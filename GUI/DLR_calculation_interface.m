function varargout = DLR_calculation_interface(varargin)

% Last Modified by GUIDE v2.5 10-May-2021 04:10:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DLR_calculation_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @DLR_calculation_interface_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DLR_calculation_interface is made visible.
function DLR_calculation_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DLR_calculation_interface (see VARARGIN)

% Choose default command line output for DLR_calculation_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% Add Fiugre 5
axes(handles.axes5);
logo22=imread('figures\figure 5.png');
image(logo22);
set(handles.axes5,'Visible','off');
% UIWAIT makes DLR_calculation_interface wait for user response (see UIRESUME)
% uiwait(handles.figure4);
movegui(gcf,'center')

% --- Outputs from this function are returned to the command line.
function varargout = DLR_calculation_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start_calculation.
function Start_calculation_Callback(hObject, eventdata, handles)
% hObject    handle to Start_calculation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S_1min=getappdata(0,'S');
V_1min=getappdata(0,'V');
Ta_1min=getappdata(0,'Ta');
delta_1min=getappdata(0,'delta');
Idc_1min=getappdata(0,'Idc');

% Get the parameters entered by the user
%Joule Heating Parameters
Rdc = getappdata(0,'Rdc');
alpha = getappdata(0,'alpha');

%Solar Heating Parameters
alpha_s = getappdata(0,'alpha_s');
D = getappdata(0,'D');

%Convective Cooling Paraneters
rho_r = getappdata(0,'rho_r');
g = getappdata(0,'g');

%Radiative Cooling Parameters
epsilon = getappdata(0,'epsilon');
theta_B = getappdata(0,'theta_B');

%Other Parameters
Tsmax = getappdata(0,'Tsmax');
ma = getappdata(0,'ma');
ms = getappdata(0,'ms');
ca = getappdata(0,'ca');
cs = getappdata(0,'cs');
mc = ma*ca+ms*cs; 
dt = 60;

if isequal(Idc_1min,[])==0
    % conductors surface temperature calculation
    Ts_DLR = zeros(1440,1);

    S = S_1min(1); % global solar radiation; unit: W/m2
    V = V_1min(1); % wind velocity; unit: m/s
    Ta = Ta_1min(1); % ambient temperature; unit: Celsius
    delta = delta_1min(1); % wind attack angle; unit: degree
    Idc = Idc_1min(1); % DC current; unit: A
    Ts = 50;
    PJ = PJ_calculation(Idc,Rdc,alpha,Ts);
    PS = PS_calculation(alpha_s,S,D);
    Pc = Pc_calculation(Ts,Ta,D,V,delta);
    Pr = Pr_calculation(Ts,Ta,D,epsilon,theta_B);
    Dif = PJ+PS-Pc-Pr;
    while abs(Dif)>=0.1
        PJ_1d = PJ_derivative(Idc,Rdc,alpha);
        Pc_1d = Pc_derivative(Ts,Ta,D,V,delta);
        Pr_1d = Pr_derivative(Ta,D,epsilon,theta_B);
        Slack =Pc_1d(Ts) + Pr_1d(Ts) - PJ_1d;
        Slack1=double(Slack);
        Ts = Ts + Dif/Slack1;
        PJ = PJ_calculation(Idc,Rdc,alpha,Ts);
        PS = PS_calculation(alpha_s,S,D);
        Pc = Pc_calculation(Ts,Ta,D,V,delta);
        Pr = Pr_calculation(Ts,Ta,D,epsilon,theta_B);
        Dif = PJ+PS-Pc-Pr;
    end
    Ts_DLR(1) = Ts;
    for i=2:1440
        S = S_1min(i); % global solar radiation; unit: W/m2
        V = V_1min(i); % wind velocity; unit: m/s
        Ta = Ta_1min(i); % ambient temperature; unit: Celsius
        delta = delta_1min(i); % wind attack angle; unit: degree
        Idc = Idc_1min(i); % DC current; unit: A
        PJ = PJ_calculation(Idc,Rdc,alpha,Ts_DLR(i-1));
        PS = PS_calculation(alpha_s,S,D);
        Pc = Pc_calculation(Ts_DLR(i-1),Ta,D,V,delta);
        Pr = Pr_calculation(Ts_DLR(i-1),Ta,D,epsilon,theta_B);
        dT = dt*(PJ+PS-Pc-Pr)/mc;
        Ts_DLR(i) = Ts_DLR(i-1)+dT; 
    end
    e=[1/60:1/60:24]';
    hTs=plot(handles.Ts,e,Ts_DLR);
    set(hTs,'Linewidth',2.5);
    grid on;
else
    Ts_DLR = [];
end

% Dynamic line rating
Imax_DLR = zeros(1440,1);

for i=1:1440
    S = S_1min(i); % global solar radiation; unit: W/m2
    V = V_1min(i); % wind velocity; unit: m/s
    Ta = Ta_1min(i); % ambient temperature; unit: Celsius
    delta = delta_1min(i); % wind attack angle; unit: degree
    Ts = Tsmax;
    PS = PS_calculation(alpha_s,S,D);
    Pc = Pc_calculation(Ts,Ta,D,V,delta);
    Pr = Pr_calculation(Ts,Ta,D,epsilon,theta_B);
    Imax_DLR(i) = sqrt((Pc+Pr-PS)/(Rdc*(1+alpha*(Ts-20))));
end

e=[1/60:1/60:24]';
hImax=plot(handles.Imax,e,Imax_DLR);
set(hImax,'Linewidth',2.5);
grid on;
setappdata(0,'Ts_DLR',Ts_DLR);
setappdata(0,'Imax_DLR',Imax_DLR);


% --- Executes on button press in Save_results.
function Save_results_Callback(hObject, eventdata, handles)
% hObject    handle to Save_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fTs = fopen('results\Ts_DLR.txt','wt');
Ts_DLR=getappdata(0,'Ts_DLR');
fprintf(fTs,'%g\n',Ts_DLR);      
fclose(fTs);

fImax = fopen('results\Imax_DLR.txt','wt');
Imax_DLR=getappdata(0,'Imax_DLR');
fprintf(fImax,'%g\n',Imax_DLR);      
fclose(fImax);

message='The result is saved successfully！';
setappdata(0,'message',message);
run('success.m');

% --- Executes on button press in Exit_4.
function Exit_4_Callback(hObject, eventdata, handles)
% hObject    handle to Exit_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos_size = get(handles.figure4,'Position');
user_response = question('Title','Confirm Close');
answer=getappdata(0,'answer');
switch answer
case 0
	% take no action  
case 1
	% Prepare to close application window
	close(handles.figure4)
case 2
	% take no action
end

% --- Executes on button press in Back_4.
function Back_4_Callback(hObject, eventdata, handles)
% hObject    handle to Back_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure4);
run('DLR_load_data_interface.m');


% --- Executes on button press in Try_QSR.
function Try_QSR_Callback(hObject, eventdata, handles)
% hObject    handle to Try_QSR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure4);
run('QSR_load_data_interface.m');
