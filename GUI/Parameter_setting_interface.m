function varargout = Parameter_setting_interface(varargin)

% Last Modified by GUIDE v2.5 10-May-2021 04:10:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Parameter_setting_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @Parameter_setting_interface_OutputFcn, ...
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


% --- Executes just before Parameter_setting_interface is made visible.
function Parameter_setting_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Parameter_setting_interface (see VARARGIN)

% Choose default command line output for Parameter_setting_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% Add Fiugre 3
axes(handles.axes3);
logo=imread('figures\figure 3.png');
image(logo);
set(handles.axes3,'Visible','off');
finish=0;
setappdata(0,'finish',finish);
% UIWAIT makes Parameter_setting_interface wait for user response (see UIRESUME)
% uiwait(handles.figure2);
movegui(gcf,'center')

% --- Outputs from this function are returned to the command line.
function varargout = Parameter_setting_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha as text
%        str2double(get(hObject,'String')) returns contents of alpha as a double


% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rdc_Callback(hObject, eventdata, handles)
% hObject    handle to Rdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rdc as text
%        str2double(get(hObject,'String')) returns contents of Rdc as a double


% --- Executes during object creation, after setting all properties.
function Rdc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function alpha_s_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_s as text
%        str2double(get(hObject,'String')) returns contents of alpha_s as a double


% --- Executes during object creation, after setting all properties.
function alpha_s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D_Callback(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D as text
%        str2double(get(hObject,'String')) returns contents of D as a double


% --- Executes during object creation, after setting all properties.
function D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function theta_B_Callback(hObject, eventdata, handles)
% hObject    handle to theta_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_B as text
%        str2double(get(hObject,'String')) returns contents of theta_B as a double


% --- Executes during object creation, after setting all properties.
function theta_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function epsilon_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon as text
%        str2double(get(hObject,'String')) returns contents of epsilon as a double


% --- Executes during object creation, after setting all properties.
function epsilon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function rho_r_Callback(hObject, eventdata, handles)
% hObject    handle to rho_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rho_r as text
%        str2double(get(hObject,'String')) returns contents of rho_r as a double


% --- Executes during object creation, after setting all properties.
function rho_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rho_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g as text
%        str2double(get(hObject,'String')) returns contents of g as a double


% --- Executes during object creation, after setting all properties.
function g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Tsmax_Callback(hObject, eventdata, handles)
% hObject    handle to Tsmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tsmax as text
%        str2double(get(hObject,'String')) returns contents of Tsmax as a double


% --- Executes during object creation, after setting all properties.
function Tsmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tsmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ma_Callback(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ma as text
%        str2double(get(hObject,'String')) returns contents of ma as a double


% --- Executes during object creation, after setting all properties.
function ma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ms_Callback(hObject, eventdata, handles)
% hObject    handle to ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ms as text
%        str2double(get(hObject,'String')) returns contents of ms as a double


% --- Executes during object creation, after setting all properties.
function ms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ca_Callback(hObject, eventdata, handles)
% hObject    handle to ca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ca as text
%        str2double(get(hObject,'String')) returns contents of ca as a double


% --- Executes during object creation, after setting all properties.
function ca_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function cs_Callback(hObject, eventdata, handles)
% hObject    handle to cs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cs as text
%        str2double(get(hObject,'String')) returns contents of cs as a double


% --- Executes during object creation, after setting all properties.
function cs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in default_1.
function default_1_Callback(hObject, eventdata, handles)
% hObject    handle to default_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rdc = 0.0674/1000; % DC resistance; unit: Omega/m
alpha = 0.005; % temperature coefficient of the resistance
set(handles.Rdc,'String',num2str(Rdc));
set(handles.alpha,'String',num2str(alpha));

% --- Executes on button press in default_2.
function default_2_Callback(hObject, eventdata, handles)
% hObject    handle to default_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alpha_s = 0.5; % absorptivity of the surface of the conductor  
D = 0.02862; % external diameter of conductor; unit: m
set(handles.alpha_s,'String',num2str(alpha_s));
set(handles.D,'String',num2str(D));

% --- Executes on button press in default_3.
function default_3_Callback(hObject, eventdata, handles)
% hObject    handle to default_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rho_r = 1;
g = 9.807;
set(handles.rho_r,'String',num2str(rho_r));
set(handles.g,'String',num2str(g));

% --- Executes on button press in default_4.
function default_4_Callback(hObject, eventdata, handles)
% hObject    handle to default_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
epsilon = 0.5; % emissivity
theta_B = 5.67e-8; % Stefan-Boltzmann constant
set(handles.epsilon,'String',num2str(epsilon));
set(handles.theta_B,'String',num2str(theta_B));

% --- Executes on button press in default_5.
function default_5_Callback(hObject, eventdata, handles)
% hObject    handle to default_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tsmax=75;% maximum allowable conductors surface temperature
ma = 1159; % mass of non-ferrous sections; unit: kg/km
ms = 437; % mass of ferrous sections; unit: kg/km
ca = 0.91; % specific heat capacity of non-ferrous sections
cs = 0.49; % specific heat capacity of ferrous sections
set(handles.Tsmax,'String',num2str(Tsmax));
set(handles.ma,'String',num2str(ma));
set(handles.ms,'String',num2str(ms));
set(handles.ca,'String',num2str(ca));
set(handles.cs,'String',num2str(cs));

% --- Executes on button press in Finish_2.
function Finish_2_Callback(hObject, eventdata, handles)
% hObject    handle to Finish_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
finish=100;
setappdata(0,'finish',finish);
in_PJ=0;
in_PS=0;
in_Pc=0;
in_Pr=0;
in_other=0;
%Joule Heating Parameters
Rdc = str2double(get(handles.Rdc,'String'));
setappdata(0,'Rdc',Rdc);
alpha = str2double(get(handles.alpha,'String'));
setappdata(0,'alpha',alpha);
if  isnan(Rdc)|| isnan(alpha)
    in_PJ=1;
end

%Solar Heating Parameters
alpha_s = str2double(get(handles.alpha_s,'String'));
setappdata(0,'alpha_s',alpha_s);
D = str2double(get(handles.D,'String'));
setappdata(0,'D',D);
if  isnan(alpha_s)|| isnan(D)
    in_PS=1;
end

%Convective Cooling Paraneters
rho_r = str2double(get(handles.rho_r,'String'));
setappdata(0,'rho_r',rho_r);
g = str2double(get(handles.g,'String'));
setappdata(0,'g',g);
if isnan(rho_r)|| isnan(g)
    in_Pc=1;
end

%Radiative Cooling Parameters
epsilon = str2double(get(handles.epsilon,'String'));
setappdata(0,'epsilon',epsilon);
theta_B = str2double(get(handles.theta_B,'String'));
setappdata(0,'theta_B',theta_B);
if isnan(epsilon)|| isnan(theta_B)
    in_Pr=1;
end

%Other Parameters
Tsmax = str2double(get(handles.Tsmax,'String'));
setappdata(0,'Tsmax',Tsmax);
ma = str2double(get(handles.ma,'String'));
setappdata(0,'ma',ma);
ms = str2double(get(handles.ms,'String'));
setappdata(0,'ms',ms);
ca = str2double(get(handles.ca,'String'));
setappdata(0,'ca',ca);
cs = str2double(get(handles.cs,'String'));
setappdata(0,'cs',cs);
if isnan(Tsmax)|| isnan(ma)|| isnan(ms)|| isnan(ca)|| isnan(cs)
    in_other=1;
end

%parameter check
if in_PJ==1 && in_PS==0 && in_Pc==0 && in_Pr==0 && in_other==0
    message='Joule heating parameters are not enough！';
    setappdata(0,'message',message);
    run('attention.m');
elseif in_PJ==0 && in_PS==1 && in_Pc==0 && in_Pr==0 && in_other==0
    message='Solar heating parameters are not enough！';
    setappdata(0,'message',message);
    run('attention.m');
elseif in_PJ==0 && in_PS==0 && in_Pc==1 && in_Pr==0 && in_other==0
    message='Convective cooling paraneters are not enough！';
    setappdata(0,'message',message);
    run('attention.m');
elseif in_PJ==0 && in_PS==0 && in_Pc==0 && in_Pr==1 && in_other==0
    message='Radiative cooling parameters are not enough！';
    setappdata(0,'message',message);
    run('attention.m');
elseif in_PJ==0 && in_PS==0 && in_Pc==0 && in_Pr==0 && in_other==1
    message='Other parameters are not enough！';
    setappdata(0,'message',message);
    run('attention.m');    
elseif in_PJ==0 && in_PS==0 && in_Pc==0 && in_Pr==0 && in_other==0
    message='Parameter set successfully！';
    setappdata(0,'message',message);
    run('success.m');
    finish=200;
    setappdata(0,'finish',finish);
else 
    message='Not enough parameters are entered！';
    setappdata(0,'message',message);
    run('attention.m');
end

% --- Executes on button press in Back_2.
function Back_2_Callback(hObject, eventdata, handles)
% hObject    handle to Back_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure2);
run('main_interface.m');

% --- Executes on button press in QSR.
function QSR_Callback(hObject, eventdata, handles)
% hObject    handle to QSR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

finish=getappdata(0,'finish');
if  finish==0
    message='Please click the "Finish" button for data verification！';
    setappdata(0,'message',message);
    run('attention.m');
elseif finish==100
    message='Please set all parameters first and click the "Finish" button！';
    setappdata(0,'message',message);
    run('attention.m'); 
elseif finish==200
    run('QSR_load_data_interface.m');
    close(handles.figure2);
end


% --- Executes on button press in DLR.
function DLR_Callback(hObject, eventdata, handles)
% hObject    handle to DLR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
finish=getappdata(0,'finish');
if  finish==0
    message='Please click the "Finish" button for data verification！';
    setappdata(0,'message',message);
    run('attention.m');
elseif finish==100
    message='Please set all parameters first and click the "Finish" button！';
    setappdata(0,'message',message);
    run('attention.m'); 
elseif finish==200
    run('DLR_load_data_interface.m');
    close(handles.figure2);
end


% --- Executes on button press in Exit_2.
function Exit_2_Callback(hObject, eventdata, handles)
% hObject    handle to Exit_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos_size = get(handles.figure2,'Position');
user_response = question('Title','Confirm Close');
answer=getappdata(0,'answer');
switch answer
case 0
	% take no action  
case 1
	% Prepare to close application window
	close(handles.figure2)
case 2
	% take no action
end
