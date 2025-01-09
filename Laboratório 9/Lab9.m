clc
clear
close all

left  = iread('left.png', 'double');
rigth = iread('right.png','double');

ImLr = left(:,:,1); ImLg = left(:,:,2); ImLb = left(:,:,3);
mdL1 = (sum(sum(left(:,:,1))))/(sum(size(left(:,:,1))));
mdL2 = (sum(sum(left(:,:,2))))/(sum(size(left(:,:,2))));
mdL3 = (sum(sum(left(:,:,3))))/(sum(size(left(:,:,3))));
grayL = ImLr./mdL1 + ImLg./mdL2 + ImLb./mdL3;
% grayL = 0.299*ImLr + 0.587*ImLg + 0.114*ImLb;


ImRr = rigth(:,:,1); ImRg = rigth(:,:,2); ImRb = rigth(:,:,3);
mdR1 = (sum(sum(rigth(:,:,1))))/(sum(size(rigth(:,:,1))));
mdR2 = (sum(sum(rigth(:,:,2))))/(sum(size(rigth(:,:,2))));
mdR3 = (sum(sum(rigth(:,:,3))))/(sum(size(rigth(:,:,3))));
grayR = ImRr./mdR1 + ImRg./mdR2 + ImRb./mdR3;
% grayR = 0.299*ImRr + 0.587*ImRg + 0.114*ImRb;

m = size(grayL, 1);
n = size(grayL, 2);
I2 = zeros(m, n);
sizeTemplate = 7;

for l = (m-sizeTemplate):-1:sizeTemplate
    for k = (n-sizeTemplate):-1:50
        
        v_minL = l; u_minL = k; v_maxL = v_minL + sizeTemplate -1; u_maxL = u_minL + sizeTemplate -1;
        
        ucL =(u_maxL-u_minL)/2 + u_minL; vcL = (v_maxL-v_minL)/2 + v_minL;
        
        template = grayL(v_minL:v_maxL, u_minL:u_maxL);
        
        C = SAD(grayR, template, v_minL, u_minL);
        
        %                         subplot(221);
        %                         idisp(grayL, 'axis', gca); hold on
        %                          plot_box(u_minL, v_minL, u_maxL, v_maxL, 'r', 'LineWidth', 2);
        %                         plot(ucL, vcL, '*r', 'LineWidth', 2);
        
        v_minR = C(2); v_maxR = C(4); u_minR = C(3); u_maxR = C(5);
        ucR =(u_maxR-u_minR)/2 + u_minR; vcR = (v_maxR-v_minR)/2 + v_minR;
        
        %                         subplot(222);
        %                         idisp(grayR, 'axis', gca); hold on
        %                         plot_box(u_minR, v_minR, u_maxR, v_maxR, 'g', 'LineWidth', 2);
        %                         plot(ucR, vcR, '*g', 'LineWidth', 2);
        
        %         d = ucL - ucR;
        d = u_minL - u_minR;
        
        I2(l, k) = d;
    end
end

figure();idisp(I2, 'bar');