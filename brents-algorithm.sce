/*BRENT'S ALGORITHM
Mary Elizabeth E. Chua

READ ME

Good day sir! I apologize for this code, I decided that I really couldn't understand it on time. It does not work. Hehe.

I will learn this during the break sir. Thank you again for your kind consideration.
*/

function f=f(x)
    f = x^2 + 2*x + 2
endfunction

xl=0
xu=2

eps = 2.22044604925031*(10)^(-16)

tol = 0.000001 // es

a = xl; b = xu; fa = f(a); fb = f(b);
c = a; fc = f(a); d = b - c; e = d;

iter = 0;
imax = 100;
m = 0;

ea = 100;
es = 0.00001;

while ((abs(m)>=tol) | (fb==0) | (iter==0))
    
    if (sign(fa) == sign(fb)) then
        a = c;
        fa = fc;
        d = b - c;
        e = d;
    end
    
    if (abs(fa) < abs(fb)) then
        c = b;
        b = a;
        a = c;
        fc = fb;
        fb = fa;
        fa = fc;
    end
    
    m = 0.5 * (a-b);
    tol = 2*eps*max(abs(b), 1);
    
    if ((abs(e)>=tol) & (abs(fc)>abs(fb))) then
        s = fb/fc;
        
        if (a==c) then
            //Secant Method
            
            //End of Secant Method
            p = 2*m*s;
            q = 1-s;
        else
            // Inverse quadratic interpolation
            
            // End of Inverse quadratic interpolation
            q = fc/fa;
            r = fb/fa;
            p = s*(2*m*q*(q-r)-(b-c)*(r-1));
            q = (q-1)*(r-1)*(s-1);
        end
        
        if (p>0) then
            q = -q;
        else
            p = -p;
        end
        
        if (((2 * p) < ((3 * m * q) - abs(tol * q))) & (p < abs(0.5 * e * q))) then
            e = d;
            d = p/q;
        else
            d = m;
            e = m;
        end
        
    else
        //Bisection Method
        
        //End of Bisection Method
        d = m;
        e = m; 
    end
    c = b;
    fc = fb;
    
    if (abs(d)>tol) then
        b = b + d;
    else
        b = b - (sign(b-a) * tol);
    end
    
    fb = f(b);
    iter = iter + 1
end

disp(b)
