function varargout = Questao3(varargin)
% QUESTAO3 MATLAB code for Questao3.fig
%      QUESTAO3, by itself, creates a new QUESTAO3 or raises the existing
%      singleton*.
%
%      H = QUESTAO3 returns the handle to a new QUESTAO3 or the handle to
%      the existing singleton*.
%
%      QUESTAO3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUESTAO3.M with the given input arguments.
%
%      QUESTAO3('Property','Value',...) creates a new QUESTAO3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Questao3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Questao3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Questao3

% Last Modified by GUIDE v2.5 10-Apr-2019 18:19:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Questao3_OpeningFcn, ...
                   'gui_OutputFcn',  @Questao3_OutputFcn, ...
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


% --- Executes just before Questao3 is made visible.
function Questao3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Questao3 (see VARARGIN)

% Choose default command line output for Questao3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Questao3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Img1;
Img1 = imread('UFSC.jpg');
Objct = imshow(Img1);
Objct.ButtonDownFcn = @axes1_ButtonDownFcn;

% --- Outputs from this function are returned to the command line.
function varargout = Questao3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[px, py] = ginput(4);
px = fix(px);
py = fix(py); 
px1 = [px(1); px(1); px(3); px(3)];
py1 = [py(1); py(2); py(2); py(1)];
tam = size(px);
a = zeros (2*tam(1),2*tam(1)); 
sa = size (a); 
for i = 2: 2 : sa(2) 
    a((i-1), : ) = [px(i/2) py(i/2) 1 0 0 0 -px1(i/2)*px(i/2) -px1(i/2)*py(i/2)]; 
    a(i, : ) = [0 0 0 px(i/2) py(i/2) 1  -py1(i/2)*px(i/2) -py1(i/2)*py(i/2)]; 
end
T=[]; 
for i = 1 : tam(1)
    T = [T ; px1(i) ; py1(i)];
end
h = [a\T; 1];
h = reshape(h,3,3); 
h = transpose(h);
img = imread('UFSC.jpg');
tam = size(img);
m = zeros(tam(1), tam(2), 3);
for i = 1 : tam(1)
   for j = 1 : tam(2)
      pf = h * [j; i; 1];
      pf = fix(pf / pf(3));
      m(i, j, 1) = pf(1);
      m(i, j, 2) = pf(2);
      m(i, j, 3) = img(i, j);
   end
end
for i = 1 : tam(1)
   for j = 1 : tam(2)
       if m(i, j, 2)>0 && m(i, j, 1)>0
          U(m(i, j, 2), m(i, j, 1)) = m(i, j, 3);
       end 
   end
end
U = U(py(1):py(2),px(1):px(3)); 
imshow(uint8(U))

