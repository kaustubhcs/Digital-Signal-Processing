t=0:0.0000001:10;   %Time vector 
w = 2; %pulse width
d= w/2:w*2:10; %delay vector
y2=pulstran(t,d,'rectpuls',w); 
plot(t,y2); 