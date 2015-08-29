%% Circular Convolution
% Linear and circular convolution are fundamentally different operations.
% However, there are conditions under which linear and circular convolution
% are equivalent. Establishing this equivalence has important implications.
% For two vectors, x and y, the circular convolution is equal to the inverse
% discrete Fourier transform (DFT) of the product of the vectors' DFTs.
% Knowing the conditions under which linear and circular convolution are 
% equivalent allows you to use the DFT to efficiently compute linear 
% convolutions.

%% Function Declaration
% Uncomment below text to make it operate as an independent function
%

disp('Function Declare');

% function [y] = mokau_conv(x,h)


%% System Transfer Function

h= [1,2,3,4,5,6]

%% Input variable
x=[10,20,30]

%% Index of start of input and system transfer function

nx=length(x);
nh=length(h);

m=nx;

%% Expanding Input Matrix Size

for count = 1:nh-1
    
    x(m+1)=0;
    m=m+1;
end

q=nh;


%% Expanding Transfer Function Matrix Size

for count = 1:nx-1
    
    h(q+1)=0;
    q=q+1;
end


%% Final Matrices

x

h

%% Convolution
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

%% OUTPUT Matrix

output_matrix

mul_h = h';

y= output_matrix * mul_h;

y=y'


%% Function Declaration termination
% For terminating function declaration
disp('Function Declaration Ends');
%end


%% Author: Kaustubh Shivdikar
% MATLAB Lab experiment of Linear to circular convolution.
%
% <<D:\MATLAB Files\matlablogo.png>>
%
