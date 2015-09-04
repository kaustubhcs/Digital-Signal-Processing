%% Windowing
% Design, visualize, and implement window functions. Compare mainlobe 
% widths and sidelobe levels of windows as a function of their size and 
% other parameters.

%% Initialization

clear all
clc

%% Function Begin
disp('Commented for Publishing');
% function z = Windowing(N) {


%% STOP BAND Frequency

fs=800;

%% PASS BAND Frequency

fp=300;

%% Sampling Frequency

F=1800;


Wp=(2*pi*fp)/F;

Ws=(2*pi*fs)/F;

Wc=(Ws+Wp)/2;

%% Order of the filter
% Commented for publishing.
% N=input('Enter the order of the royal filter (Number has to be odd): ');
N = 31;

alpha=(N-1)/2;

for i=1:(2*alpha)+1
  
    hd(i)= (Wc*sin(i-alpha))/(pi*Wc*(i-alpha));
   
    
end

t=1:(2*alpha)+1;

hd((N-1)/2)=(Wc/pi);

%% Original

hd


%% Rectangular window
r = rectwin(N);
%% Blackman window
b= blackman(N);
%% Chebyshev window
c = chebwin(N);
%% Tukey window
tk = tukeywin(N);
%% Blackmanharris window
bmh = blackmanharris(N);
%% Hamming window
hm = hamming(N);
%% Hanning window
hn = hann(N);
%% Flat Top window
ftw = flattopwin(N);

%% Computing output for filter design

for i=1:(2*alpha)+1
    
    rh(i)=r(i)*hd(i);
    
    bh(i)=b(i)*hd(i);
    
    ch(i)=c(i)*hd(i);

    th(i)=tk(i)*hd(i);

    bmhh(i)=bmh(i)*hd(i);
    
    hmh(i)=hm(i)*hd(i);
    
    hnh(i)=hn(i)*hd(i);
    
    ftwh(i) = ftw(i)*hd(i);
    
    
end

%% Plotting of OUTPUT for Comparison
% Subplot is Disabled for publishing purposes


% subplot(3,3,1);
figure();
stem(t,hd);
xlabel('Original Plot');

% subplot(3,3,2);
figure();
stem(t,rh);
xlabel('Rectangular window');

% subplot(3,3,3);
figure();
stem(t,bh);
xlabel('Blackman window');

% subplot(3,3,4);
figure();
stem(t,ch);
xlabel('Chebyshev window');

% subplot(3,3,5);
figure();
stem(t,th);
xlabel('Tukey window ');

% subplot(3,3,6);
figure();
stem(t,bmhh);
xlabel('Blackmanharris window');


% subplot(3,3,7);
figure();
stem(t,hmh);
xlabel('Hamming window');


% subplot(3,3,8);
figure();
stem(t,hnh);
xlabel('Hanning window');


% subplot(3,3,9);
figure();
stem(t,ftwh);
xlabel('Flat Top window');


%% Author: Kaustubh Shivdikar
% MATLAB Lab experiment of Linear to circular convolution.
%
% <<D:\MATLAB Files\matlablogo.png>>
%


