%%Questão 1
clc
polygon = [0 0; 10 0; 5 5; 0 0];
tcolor = [1 0.5 0.5];
patch(polygon(:,1),polygon(:,2),tcolor,'FaceAlpha', 0.5)
axis([-1 11 -1 6])
grid on
axis equal

%%Questão 2
clcpolygon = [0 0; 10 0; 5 5; 0 0];
tcolor= [1 0.5 0.5];
line(polygon(:,1),polygon(:,2),'LineWidth',2,'color',[1 0.5 0.5])
axis([-1 11 -1 6])
grid on
axis equal

%%Questão 3
clc
Theta = 45;
R = [cosd(Theta) -sind(Theta) 0; sind(Theta) cosd(Theta) 0; 0 0 1];
polygon = [0 0 1; 10 0 1 ; 5 5 1; 0 0 1];
polygonR = R*polygon';
tcolor = [1 0.5 0.5];
line(polygonR(1,:),polygonR(2,:),'LineWidth',2,'color',[1 0.5 0.5])
axis([-1 11 -1 6])
grid on
axis equal