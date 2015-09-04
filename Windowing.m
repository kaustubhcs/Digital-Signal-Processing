%% Windowing
% Design, visualize, and implement window functions. Compare mainlobe 
% widths and sidelobe levels of windows as a function of their size and 
% other parameters.

%% Initialization

clear all
clc

%% Function Begin

fs=800;

fp=300;

F=1800;

Wp=(2*pi*fp)/F;

Ws=(2*pi*fs)/F;

Wc=(Ws+Wp)/2;

%Order of the royal filter

N=input('Enter the order of the royal filter : ');

alp=(N-1)/2;

for i=1:(2*alp)+1
  
    hd(i)= (Wc*sin(i-alp))/(pi*Wc*(i-alp));
   
    
end

t=1:(2*alp)+1;

hd((N-1)/2)=(Wc/pi);

%% Original

r = rectwin(N);
b= blackman(N);
c = chebwin(N);
tk = tukeywin(N);
tr = triang(N);
bmh = blackmanharris(N);
hm = hamming(N);
hn = hann(N);
ftw = flattopwin(N);

for i=1:(2*alp)+1
    
    rh(i)=r(i)*hd(i);
    
    bh(i)=b(i)*hd(i);
    
    ch(i)=c(i)*hd(i);

    th(i)=tk(i)*hd(i);

    bmhh(i)=bmh(i)*hd(i);
    
    hmh(i)=hm(i)*hd(i);
    
    hnh(i)=hn(i)*hd(i);
    
    ftwh(i) = ftw(i)*hd(i);
    
    
end

figure();
hold on;

subplot(3,3,1);
stem(t,hd);
xlabel('Original Plot');

subplot(3,3,2);
stem(t,rh);
xlabel('Rectangular window');

subplot(3,3,3);
stem(t,bh);
xlabel('Blackman window');

subplot(3,3,4);
stem(t,ch);
xlabel('Chebyshev window');

subplot(3,3,5);
stem(t,th);
xlabel('Tukey window ');

subplot(3,3,6);
stem(t,bmhh);
xlabel('Blackmanharris window');


subplot(3,3,7);
stem(t,hmh);
xlabel('Hamming window');


subplot(3,3,8);
stem(t,hnh);
xlabel('Hanning window');


subplot(3,3,9);
stem(t,ftwh);
xlabel('Flat Top window');

