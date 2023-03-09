function varargout = QSR_load_data_interface(varargin)

% Last Modified by GUIDE v2.5 10-May-2021 04:10:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QSR_load_data_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @QSR_load_data_interface_OutputFcn, ...
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


% --- Executes just before QSR_load_data_interface is made visible.
function QSR_load_data_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to QSR_load_data_interface (see VARARGIN)

% Choose default command line output for QSR_load_data_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% Line
axes(handles.axes40);
h=line([0,1],[0,0]);
set(h,'Color',[.2 .5 .5]);
axis off;
% Add Fiugre 4
axes(handles.axes4);
logo22=imread('figures\figure 4.jpg');
image(logo22);
set(handles.axes4,'Visible','off');
finish=0;
setappdata(0,'finish',finish);
% UIWAIT makes QSR_load_data_interface wait for user response (see UIRESUME)
% uiwait(handles.figure3);
movegui(gcf,'center')

% --- Outputs from this function are returned to the command line.
function varargout = QSR_load_data_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in QSR_selectS.
function QSR_selectS_Callback(hObject, eventdata, handles)
% hObject    handle to QSR_selectS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Read global solar radiation data
[filename,pathname]=uigetfile('*.xlsx','Choose data of global solar radiation');
str=[pathname filename]; 
[num2,~]=xlsread(str);
S=num2;
setappdata(0,'S',S);
u=[0.25:0.25:24]';
hload=plot(handles.data_S,u,S);
set(hload,'Linewidth',2.5);

% --- Executes on button press in QSR_selectTa.
function QSR_selectTa_Callback(hObject, eventdata, handles)
% hObject    handle to QSR_selectTa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('*.xlsx','Choose data of ambient temperature');
str=[pathname filename]; 
[num2,~]=xlsread(str);
Ta=num2;
setappdata(0,'Ta',Ta);
u=[0.25:0.25:24]';
hload=plot(handles.data_Ta,u,Ta);
set(hload,'Linewidth',2.5);

% --- Executes on button press in QSR_selectV.
function QSR_selectV_Callback(hObject, eventdata, handles)
% hObject    handle to QSR_selectV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('*.xlsx','Choose data of wind velocity');
str=[pathname filename]; 
[num2,~]=xlsread(str);
V=num2;
setappdata(0,'V',V);
u=[0.25:0.25:24]';
hload=plot(handles.data_V,u,V);
set(hload,'Linewidth',2.5);

% --- Executes on button press in QSR_selectdelta.
function QSR_selectdelta_Callback(hObject, eventdata, handles)
% hObject    handle to QSR_selectdelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('*.xlsx','Choose data of wind attack angle');
str=[pathname filename]; 
[num2,~]=xlsread(str);
delta=num2;
setappdata(0,'delta',delta);
u=[0.25:0.25:24]';
hload=plot(handles.data_delta,u,delta);
set(hload,'Linewidth',2.5);

% --- Executes on button press in QSR_selectIdc.
function QSR_selectIdc_Callback(hObject, eventdata, handles)
% hObject    handle to QSR_selectIdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('*.xlsx','Choose data of DC current');
str=[pathname filename]; 
[num2,~]=xlsread(str);
Idc=num2;
setappdata(0,'Idc',Idc);
u=[0.25:0.25:24]';
hload=plot(handles.data_Idc,u,Idc);
set(hload,'Linewidth',2.5);

% --- Executes on button press in Finish_3.
function Finish_3_Callback(hObject, eventdata, handles)
% hObject    handle to Finish_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
finish=100;
setappdata(0,'finish',finish);
S=getappdata(0,'S');
V=getappdata(0,'V');
Ta=getappdata(0,'Ta');
delta=getappdata(0,'delta');
Idc=getappdata(0,'Idc');

if isequal(S,[])==0 && isequal(V,[])==0 && isequal(Ta,[])==0 && isequal(delta,[])==0
    message='Data load successfully！';
    setappdata(0,'message',message);
    run('success.m');
    finish=200;
    setappdata(0,'finish',finish);
else 
    message='Not enough data yet！';
    setappdata(0,'message',message);
    run('attention.m');
end

% --- Executes on button press in Next_3.
function Next_3_Callback(hObject, eventdata, handles)
% hObject    handle to Next_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

finish=getappdata(0,'finish');
if  finish==0
    message='Please click the "Finish" button for data verification！';
    setappdata(0,'message',message);
    run('attention.m');
elseif finish==100
    message='Please load all data first and click the "Finish" button！';
    setappdata(0,'message',message);
    run('attention.m'); 
elseif finish==200
    run('QSR_calculation_interface.m');
    close(handles.figure3);
end

% --- Executes on button press in Back_3.
function Back_3_Callback(hObject, eventdata, handles)
% hObject    handle to Back_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure3);
run('Parameter_setting_interface.m');

% --- Executes on button press in Exit_3.
function Exit_3_Callback(hObject, eventdata, handles)
% hObject    handle to Exit_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos_size = get(handles.figure3,'Position');
user_response = question('Title','Confirm Close');
answer=getappdata(0,'answer');
switch answer
case 0
	% take no action  
case 1
	% Prepare to close application window
	close(handles.figure3)
case 2
	% take no action
end
