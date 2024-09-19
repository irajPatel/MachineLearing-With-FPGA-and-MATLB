function ysig = sig_pw_HDL(x)
    % Word Length
    WL = 16;
    
    % Fractional Length
    FL = 10;
    
    % Initialize HDL math object
    F = hdlfimath();
    
    % Create numeric type
    nt = numerictype(1, WL, FL);
    
    % Convert input to fixed-point
    xf = fi(x, nt);
    
    % Slopes and Offsets
    m1 = fi(0.072, nt);
    c1 = fi(0.22, nt);
    m2 = fi(0.21, nt);
    c2 = fi(0.5, nt);
    m3 = fi(0.072, nt);
    c3=fi(0.78,nt);
    
    % Piecewise Linear Approximation of Sigmoid Function
    if xf < fi(-3, nt)
        y = fi(-1, nt, F);
    elseif xf < fi(-2, nt)
        y = fi(m1 * x + c1, nt, F);
    elseif (xf >= fi(-2,nt)) && (xf <= fi(2,nt))
        y = fi(m2 * x+ c2,nt, F);
    elseif xf < fi(3,nt)
        y = fi(m3 * x + c3,nt, F);
    else
        y = fi(1, nt, F);
    end
    
    % Saturation between 0 and 1
    if y <= fi(0, nt)
        ysig = fi(0, nt, F);
    elseif y >= fi(1, nt)
        ysig = fi(1, nt, F);
    else
        ysig = fi(y, nt, F);
    end
end