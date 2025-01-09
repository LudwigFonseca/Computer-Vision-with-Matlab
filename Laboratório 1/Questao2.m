function varargout = Questao2(varargin)
% QUESTAO2 MATLAB code for Questao2.fig
%      QUESTAO2, by itself, creates a new QUESTAO2 or raises the existing
%      singleton*.
%
%      H = QUESTAO2 returns the handle to a new QUESTAO2 or the handle to
%      the existing singleton*.
%
%      QUESTAO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUESTAO2.M with the given input arguments.
%
%      QUESTAO2('Property','Value',...) creates a new QUESTAO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Questao2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Questao2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Questao2

% Last Modified by GUIDE v2.5 10-Apr-2019 15:34:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Questao2_OpeningFcn, ...
                   'gui_OutputFcn',  @Questao2_OutputFcn, ...
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

% --- Executes just before Questao2 is made visible.
function Questao2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Questao2 (see VARARGIN)

% Choose default command line output for Questao2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Questao2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Img1;
global Img2;
global Img3;
global Tam;
Img1 = imread('PanoramicGray.jpg');
Img2 = 255 - imread('TelescopicGray.jpg');

Tam  = size(Img2); 
axes(handles.axes4)
Img4 = Img1(1:Tam(1) , 1:Tam(2));
imshow(Img4)

axes(handles.axes3)
Img3 = Img1;
Img3(1:Tam(1) , 1:Tam(2)) = Img2;
imshow(Img3); 

% --- Outputs from this function are returned to the command line.
function varargout = Questao2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on slider movement.
function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Img1; 
global Img2; 
global Img3;
global Img4;
global Tam; 

Img3 = Img1; 
x = get(handles.x,'Value');
x = fix(1 + (1900)*x);

y = get(handles.y,'Value');
y = fix(1 + (567)*y);

axes(handles.axes4)
Img4 = Img1(y:y + Tam(1) - 1 , x:x + Tam(2) - 1);
imshow(Img4)

axes(handles.axes3)
Img3(y:y + Tam(1) - 1, x: x + Tam(2) - 1) = Img2; 
imshow(Img3);

% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function y_Callback(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Img1; 
global Img2; 
global Img3;
global Img4;
global Tam; 

Img3 = Img1; 
x = get(handles.x,'Value');
x = fix(1 + (1900)*x);

y = get(handles.y,'Value');
y = fix(1 + (567)*y);

axes(handles.axes4)
Img4 = Img1(y:y + Tam(1) - 1 , x:x + Tam(2) - 1);
imshow(Img4)

axes(handles.axes3)
Img3(y:y + Tam(1) - 1, x: x + Tam(2)-1) = Img2; 
imshow(Img3);

% --- Executes during object creation, after setting all properties.
function y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in espelhamentoX.
function espelhamentoX_Callback(hObject, eventdata, handles)
% hObject    handle to espelhamentoX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img4; 
e = [1 0 0; 0 -1 0; 0 0 1]; 
Tf = affine2d(e); 
out = imwarp(Img4,Tf); 
axes(handles.axes4)
imshow(out) 

% --- Executes on button press in espelhamentoY.
function espelhamentoY_Callback(hObject, eventdata, handles)
% hObject    handle to espelhamentoY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img4; 
e = [-1 0 0; 0 1 0; 0 0 1]; 
Tf = affine2d(e); 
out = imwarp(Img4,Tf);
axes(handles.axes4)
imshow(out)  

% --- Executes on button press in escalamento.
function escalamento_Callback(hObject, eventdata, handles)
% hObject    handle to escalamento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img4; 
x = str2num(get(handles.escalamentoedit,'string'));
e = [x(1) 0 0; 0 x(2) 0; 0 0 1]; 
Tf = affine2d(e); 
out = imwarp(Img4,Tf);
axes(handles.axes4)
imshow(out) 


% --- Executes on button press in cisalhamento.
function cisalhamento_Callback(hObject, eventdata, handles)
% hObject    handle to cisalhamento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img4; 
x = str2num(get(handles.cisalhamentoedit,'string'));
c = [1 x(1) 0; x(2) 1 0; 0 0 1]; 
Tf = affine2d(c); 
out = imwarp(Img4,Tf); 
axes(handles.axes4)
imshow(out) 

% --- Executes on button press in rotacao.
function rotacao_Callback(hObject, eventdata, handles)
% hObject    handle to rotacao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img4; 
theta = get(handles.rotacao,'value');
theta = cell2mat(theta);
theta = theta(1);
r = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1]; 
Tf = affine2d(r); 
out = imwarp(Img4,Tf); 
axes(handles.axes4)
imshow(out)  

% --- Executes during object creation, after setting all properties.
function rotacao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotacao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

