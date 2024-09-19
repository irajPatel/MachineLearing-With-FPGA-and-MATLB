function xf = ConvertToFixedPoint(xin, hstep)
    % ConvertToFixedPoint Converts a double type array into a fixed-point array
    % Inputs:
    %   xin   - Input array of doubles
    %   hstep - Optional parameter specifying step size for rounding
    % Output:
    %   xf    - Output fixed-point array

    % Calculate the maximum and minimum of the input array
    Xmax = max(xin);
    Xmin = min(xin);
    
    % Convert to integer part
    IP_max = fix(Xmax);
    IP_min = fix(Xmin);
    
    % Get fractional parts of the input array
    fractional_parts = abs(xin - floor(xin));
    
    % Get only non-zero fractional parts
    non_zero_fractional_parts = fractional_parts(fractional_parts > 0);
    FP_min = min(non_zero_fractional_parts);

    % Calculate the integer word length
    if (IP_max > 0) && (IP_min < 0)
        % Case where IP_max is positive and IP_min is negative
        WL_int = ceil(IP_max) + abs(IP_min);
    elseif (IP_max > 0) && (IP_min > 0)
        % Case where both IP_max and IP_min are positive
        IP_min = 0;
        WL_int = ceil(log2(abs(IP_max) + abs(IP_min)));
    elseif (IP_max < 0) && (IP_min < 0)
        % Case where both IP_max and IP_min are negative
        IP_max = 0;
        WL_int = ceil(log2(abs(IP_max) + abs(IP_min)));
    else
        WL_int = 0; % Handle case where IP_max and IP_min are 0
    end

    % Calculate the fractional word length
    if nargin < 2
        hfactor = 15; % Define a default value for hfactor
        if isempty(FP_min)
            FL = 0; % No fractional part
        else    
            FL = ceil(log2(1 / abs(FP_min / hfactor)));
        end
    else
        % Case when FP_min is not empty and hstep is provided
        FL = ceil(log2(1 / abs(hstep)));
    end
    
    % Total word length = Integer part + Fractional part
    WL_total = WL_int + FL+2;
    s=1;
    
    % Convert input to fixed-point representation
    xf = fi(xin, s, WL_total, FL);
end
