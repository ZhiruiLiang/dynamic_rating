function varargout = main_interface(varargin)

% Last Modified by GUIDE v2.5 10-May-2021 03:21:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @main_interface_OutputFcn, ...
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


% --- Executes just before main_interface is made visible.
function main_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_interface (see VARARGIN)

% Choose default command line output for main_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%set(handles.figure1,'Position',[55.8 8.643 178.4 39.714]);
% Add Fiugre 1
axes(handles.axes1);
logo=imread('figures\figure 1.jpg');
image(logo);
set(handles.axes1,'Visible','off');
% Add Fiugre 2
axes(handles.axes2);
logo=imread('figures\figure 2.png');
image(logo);
set(handles.axes2,'Visible','off');
% UIWAIT makes main_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);
movegui(gcf,'center')

% --- Outputs from this function are returned to the command line.
function varargout = main_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Clear global variables

S=[];% global solar radiation; unit: W/m2
V=[];% wind velocity; unit: m/s
Ta=[];% ambient temperature; unit: Celsius
delta=[];% wind attack angle; unit: degree
Idc=[]; % DC current; unit: A
setappdata(0,'S',S);
setappdata(0,'V',V);
setappdata(0,'Ta',Ta);
setappdata(0,'delta',delta);
setappdata(0,'Idc',Idc);

Ts_QSR=[];
Imax_QSR=[];
setappdata(0,'Ts_QSR',Ts_QSR);
setappdata(0,'Imax_QSR',Imax_QSR);

Ts_DLR=[];
Imax_DLR=[];
setappdata(0,'Ts_DLR',Ts_DLR);
setappdata(0,'Imax_DLR',Imax_DLR);

% Get the parameters entered by the user
%Joule Heating Parameters
Rdc = [];
setappdata(0,'Rdc',Rdc);
alpha = [];
setappdata(0,'alpha',alpha);

%Solar Heating Parameters
alpha_s = [];
setappdata(0,'alpha_s',alpha_s);
D = [];
setappdata(0,'D',D);

%Convective Cooling Paraneters
rho_r = [];
setappdata(0,'rho_r',rho_r);
g = [];
setappdata(0,'g',g);

%Radiative Cooling Parameters
epsilon = [];
setappdata(0,'epsilon',epsilon);
theta_B = [];
setappdata(0,'theta_B',theta_B);

%Other Parameters
Tsmax = [];
setappdata(0,'Tsmax',Tsmax);
ma = [];
setappdata(0,'ma',ma);
ms = [];
setappdata(0,'ms',ms);
ca = [];
setappdata(0,'ca',ca);
cs = [];
setappdata(0,'cs',cs);

run('Parameter_setting_interface.m')
close(handles.figure1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos_size = get(handles.figure1,'Position');
user_response = question('Title','Confirm Close');
answer=getappdata(0,'answer');
switch answer
case 0
	% take no action  
case 1
	% Prepare to close application window
	close(handles.figure1)
case 2
	% take no action
end
