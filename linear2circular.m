%% Linear Convolution
% This example shows how to establish an equivalence between linear and 
% circular convolution.
% Linear and circular convolution are fundamentally different operations.
% However, there are conditions under which linear and circular convolution
% are equivalent. Establishing this equivalence has important implications.
% For two vectors, x and y, the circular convolution is equal to the
% inverse discrete Fourier transform (DFT) of the product of the vectors'
% DFTs. Knowing the conditions under which linear and circular convolution
% are equivalent allows you to use the DFT to efficiently compute linear
% convolutions.
% The linear convolution of an N-point vector, x, and a L-point vector,
% y, has length N+L-1.
% For the circular convolution of x and y to be equivalent, you must
% pad the vectors with zeros to length at least N+L-1 before you take
% the DFT. After you invert the product of the DFTs, retain only the
% first N+L-1 elements.

%% Formula
% <<D:\MATLAB Files\l2c.png>>


%% Function Declaration
% Uncomment below text to make it operate as an independent function
%

disp('Function Declare');

% function [ op_matrix ] = lincirc_convolve_simply( x,nx,h,nh)

%% System Transfer Function

h= [1,2,3,4,5,6]

%% Input variable
x=[10,20,30]

%% Index of start of input and system transfer function

nh=0
nx=0

%% Length of each variable

tx = length(x)
th = length(h)


%% Origin for output
ny = nx + nh




%% Length of output
% Direct Formula

ty = tx + th - 1

%% OUTPUT Matrix

m = ty;
n = th;

output_matrix = zeros(n,m);



%% Iterative addition

for count_h = 1:th

    for count_x = 1:tx
    
        output_matrix(count_h,m + 1 - count_x - count_h + 1) = x(tx - count_x + 1) * h(th - count_h + 1);
        
        
    end
    
    
end

%% Iterattive ouput computation

for c = 1:ty
   
    y(c) = 0;
    
    
end




%% Adding columns



for i = 1:m
    
    
    for j = 1:n
   
        y(i) = y(i) + output_matrix(j,i);
    end
    
end

output_matrix

l=max(tx,th);

q=ty-l;

m=1;

for count = ty-q+1:ty
   
        y(m)= y(m)+y(count);
        m=m+1;
        
end

%% Generating OUTPUT

for count1 = 1:l
    
    op_matrix(count1)=y(count1);
   
end

%%
% OUPUT

op_matrix

%% Function Declaration termination
% For terminating function declaration
disp('Function Declaration Ends');
%end


%% Author: Kaustubh Shivdikar
% MATLAB Lab experiment of Linear to circular convolution.
%
% <<D:\MATLAB Files\matlablogo.png>>
%
