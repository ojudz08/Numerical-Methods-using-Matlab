function[]=newton(x1)

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
end