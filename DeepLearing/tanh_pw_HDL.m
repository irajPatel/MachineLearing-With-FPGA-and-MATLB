function ytan = tanh_pw_HDL(x)
    WL = 16; % Word Length
    FL = 10; % Fractional Length
    F = hdlfimath();
    nt = numerictype(1, WL, FL);
    xf = fi(x, nt);

    % Slopes and Offsets
    m1 = fi(0.18, nt);
    c1 = fi(-0.72, nt);
    m2 = fi(0.82, nt);
    c2 = fi(0, nt);
    m3 = fi(0.18, nt);
    c3 = fi(0.72, nt);

    if xf < fi(-2,nt)
        y = fi(-1,nt,F);
    elseif xf < fi(-1.1,nt)
        y = fi(m1 * x + c1,nt,F);
    elseif (xf >= fi(-1.1,nt)) && (xf <= fi(1.1,nt))
        y = fi(m2 * x +c2,nt,F);
    elseif xf <= fi(2,nt)
        y = fi(m3* x +c3,nt,F);
    else
        y = fi(1,nt,F);
    end

    % Saturating between -1 to +1
    if y < fi(-1,nt)
        ytan = fi(-1,nt,F);
    elseif y >= fi(1,nt)
        ytan = fi(1,nt,F);
    else
        ytan = fi(y,nt,F);
    end
end