clc
clear
close all

I = iread('Level_3/fig3_n3.png', 'gray', 'double');

tic
classifica_carta(I)
toc
