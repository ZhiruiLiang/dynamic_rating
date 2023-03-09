function varargout = attention(varargin)
% ATTENTION MATLAB code for attention.fig
%      ATTENTION, by itself, creates a new ATTENTION or raises the existing
%      singleton*.
%
%      H = ATTENTION returns the handle to a new ATTENTION or the handle to
%      the existing singleton*.
%
%      ATTENTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATTENTION.M with the given input arguments.
%
%      ATTENTION('Property','Value',...) creates a new ATTENTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before attention_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to attention_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help attention

% Last Modified by GUIDE v2.5 24-Apr-2017 16:46:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @attention_OpeningFcn, ...
                   'gui_OutputFcn',  @attention_OutputFcn, ...
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


% --- Executes just before attention is made visible.
function attention_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to attention (see VARARGIN)

% Choose default command line output for attention
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.figure1,'Position',[100 25 84.4 11.714]);%起点横坐标，起点纵坐标，宽度，长度
axes(handles.axes1);
logo31=imread('figures\figure 9.png');
image(logo31);
set(handles.axes1,'Visible','off');
message=getappdata(0,'message');
set(handles.textmessage,'String',message);
% UIWAIT makes attention wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = attention_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in PB_sure.
function PB_sure_Callback(hObject, eventdata, handles)
% hObject    handle to PB_sure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1)
