%
% Taylor2.m - Use a Taylor expansion to approximate f = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2
%
% INPUT:    User is asked to input the number of terms and value of x
% OUTPUT:   Display a five-column table showing the number of terms, corresponding term,
%           approximation value, true error (Et), and relative error (?t) in the output of the program.
%
% Paolo Gabriel Casas
% 6/2/2015

clc         % clear command window
clear       % clear all variables
close all   % close all graphics windows

% Asked user to input n and x
fprintf('Taylor series of f = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2 \n');
N = input('Input the number of terms in the expansion:  ');
x1 = input('Input value of x to evaluate the function:  ');

% Calculates the corresponding Taylor series expansion
syms x;
f_T = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2;
T = taylor(f_T,'Order',N);

% Calculates the approximation value
f = -0.1*x1^4-0.15*x1^3-0.5*x1^2-0.25*x1+1.2;
if N == 1;
        approx = f;
else
    for n=0:N-1
        approx = f;
        f_prime = diff(f,N);
        approx = approx + (f_prime/factorial(N)).*x1^(N);
    end
end

% Calculate the true error and relative error
True_err = f - approx;
Rel_err = (f - approx)/f;

% Display the Taylor approximation and the resulting error
fprintf('\n');
fprintf('Number of Terms: %d\nCorresponding Term: ',N);
fprintf('%0.3f',T);
fprintf('Approximation value: \n',approx);
fprintf('True Error: %0.3f\nRelative Error: %0.3f\b',True_err,Rel_err);
fprintf('\n');

% Plot the results
t=[5 -5 -100 100];
fplot(char(T),t);
%fplot(char(f),t);
