%function [y] = convolver(x,h)
x = [1,2,3,4,5,6];
h = [10,20,30];
nx=length(x);
nh=length(h);

m=nx;

for count = 1:nh-1
    
    x(m+1)=0;
    m=m+1;
end

q=nh;

for count = 1:nx-1
    
    h(q+1)=0;
    q=q+1;
end

x

h

[x_m,x_n] = size (x);

x_mat = zeros(x_m,x_n);

aux_x = x;

for count = 1:x_n-1

        temp_x = circshift(x,[1,count]);
        temp_x;
        aux_x = [aux_x,temp_x];
     
end

output_matrix = zeros(x_n);

global_counter = 1;

for n = 1:x_n
   
    for m = 1:x_n
         
        output_matrix(m,n) = aux_x ( global_counter );
        global_counter = global_counter + 1;
        
    end
       
end
    
mul_h = h';

y= output_matrix * mul_h;

y=y'

%end