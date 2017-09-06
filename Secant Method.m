function[]=secant(x1,x2)
%let x1 and x2 the interval, x3 as the midpoint
fx1 = x1^3-2*x1^2-5;   
fx2 = x2^3-2*x2^2-5;

if(fx1*fx2>0) %if the root is not found on interval, calculation will stop and displays "Wrong interval"
    disp('Wrong interval');
else %if the root is within the interval, calculation will continue
    
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
end