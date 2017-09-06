% Roots of Equation.m - This program will fine the root of equation of f(x)
% = x^3 - 2x^2 -5
%
% INPUT:    User is asked to choose methods on calculating the roots
%           and guss for the value of the interval points.
%           1 - Bisection Method
%           2 - False Position Method
%           3 - Secant Method
%           4 - Newton-Raphson Method
% OUTPUT:   Approximate value of the root and the percent relative error Ea.
%
% Paolo Gabriel Casas
% 6/24/2015

clc         % clear command window
clear       % clear all variables
close all   % close all graphics windows

% Asked user to input method
fprintf('Choose any of method to calculate the root of f(x) = x^3-2x2-5\n(1, 2, 3, or 4):\n');
fprintf('1 - Bisection Method\n2 - False Position Method\n3 - Secant Method\n4 - Newton-Raphson Method\n');
method = input('Input: ');

if method == 1 %BISECTION METHOD
    fprintf('\nBisection Method\nChoose an interval for x1 and x2.\n');
    x1 = input('x1: ');
    x2 = input('x2: ');
    fprintf('\n');
    
    fx1 = x1^3-2*x1^2-5;
    fx2 = x2^3-2*x2^2-5;

    if(fx1*fx2>0) 
        disp('Wrong interval. Choose again.');
    else 
        n = 1;
        x3old = 0;
        d=abs(x1-x2);
        fprintf('n\tx1\t\tx2\t\tx3\t\tsign\terror\n');

        while(d>0.0005)
            x3 = (x1+x2)/2; %midpoint
            fx1 = x1^3-2*x1^2-5;
            fx3 = x3^3-2*x3^2-5;
            sign = fx1*fx3; %sign
            d=abs(x1-x2);
            err = round((abs(x3-x3old)/x3)*100,2,'significant');
            x3old = x3;
            fprintf('%d\t%0.3f\t%0.3f\t%0.3f\t%0.0f\t\t%0.2f\n',n,x1,x2,x3,sign,err);

            % condition if the sign is + or -
            if(sign==0)
                x = x3;
            else if(sign>0)
                    x1 = x3;
                else x2 = x3;
                end
            end
            n = n+1;
        end
        x = x3;
        fprintf('\nx = %0.3f\n',x);
    end
    
else if method == 2 %FALSE POSITION METHOD
        fprintf('\nFalse Position Method\nChoose an interval for x1 and x2.\n');
        x1 = input('x1: ');
        x2 = input('x2: ');
        fprintf('\n');
        
        fx1 = x1^3-2*x1^2-5;
        fx2 = x2^3-2*x2^2-5;
        
        if(fx1*fx2>0)
            disp('Wrong interval.Choose again.');
        else             
            n = 1;
            x3old = 0;
            d=abs(x1-x2);
            fprintf('n\tx1\t\tx2\t\tx3\t\tsign\terror\n');
            
            while(d>0.003)
                fx1 = x1^3-2*x1^2-5;
                fx2 = x2^3-2*x2^2-5;
                x3 = (x1*fx2-x2*fx1)/(fx2-fx1); %midpoint
                fx3 = x3^3-2*x3^2-5;
                sign = fx1*fx3; %sign
                d=abs(x1-x3);
                err = (abs(x3-x3old)/x3)*100;
                x3old = x3;
                fprintf('%d\t%0.3f\t%0.3f\t%0.3f\t%0.0f\t\t%0.2f\n',n,x1,x2,x3,sign,err);
                
                % condition if the sign is + or -
                if(sign==0)
                    x = x3;
                else if(sign>0)
                        x1 = x3;
                    else x2 = x3;
                    end
                end
                n = n+1;
            end
        end
        x = x3;
        fprintf('\nx = %0.3f\n',x);
        
    else if method == 3 %SECANT METHOD
            fprintf('\nSecant Method\nChoose an interval for x1 and x2.\n');
            x1 = input('x1: ');
            x2 = input('x2: ');
            fprintf('\n');
            
            fx1 = x1^3-2*x1^2-5;
            fx2 = x2^3-2*x2^2-5;
            
            if(fx1*fx2>0) 
                disp('Wrong interval.Choose again.');
            else
                n = 1;
                x3old = 0;
                d=abs(x1-x2);
                fprintf('n\tx1\t\tx2\t\tx3\t\terror\n');
                
                while(d>0.001)
                    fx1 = x1^3-2*x1^2-5;
                    fx2 = x2^3-2*x2^2-5;
                    x3 = (x1*fx2-x2*fx1)/(fx2-fx1); %midpoint
                    fx3 = x3^3-2*x3^2-5;
                    
                    d=abs(x1-x2);
                    err = (abs(x3-x3old)/x3)*100;
                    x3old = x3;
                    fprintf('%d\t%0.3f\t%0.3f\t%0.3f\t%0.2f\n',n,x1,x2,x3,err);
                    
                    x1 = x2;
                    x2 = x3;
                    n = n+1;
                end
                x = x3;
                fprintf('\nx = %0.3f\n',x);
            end
            
        else if method == 4 %NEWTON-RAPHSON METHOD
                fprintf('\nNewton-Raphson Method\nChoose value for x1.\n');
                x1 = input('x1: ');
                fprintf('\n');
                
                n = 1;
                err = 0;
                x2 = 0;
                d=abs(x1-x2);
                fprintf('n\tx1\t\tx2\t\terror\n');
                
                while(d>0.0005)
                    fx1 = x1^3-2*x1^2-5;
                    f_prime = 3*x1^2-4*x1;
                    x2 = x1 - (fx1/f_prime);
                    d=abs(x1-x2);
                    err = round((abs(x2-x1)/x2)*100,2,'significant');
                    
                    fprintf('%d\t%0.3f\t%0.3f\t%0.2f\n',n,x1,x2,err);
                    x1 = x2;
                    n = n+1;
                end
                fprintf('\nx = %0.3f\n',x2);
            else
                fprintf('Wrong choice bro. Choose again.\n');
            end
        end
    end
end