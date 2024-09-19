function XTest_FixedPoint = Convert_Data_to_Fixed_Point(XFeatures, XTest)
% This function converts double type XTest (Test Data) into fixed point by
% considering the maximum and minimum values of XFeatures matrix along with
% fractional part.

% It is assumed that XTest is submatrix of XFeatures.

% Convert matrices to fixed-point representation based on statistics from XFeatures

% 1. Find maximum and minimum values across all elements of XFeatures
max_val = max(XFeatures(:));
min_val = min(XFeatures(:));

% 2. Find maximum and minimum fractional values greater than zero across all elements
fractional_values = abs(XFeatures - floor(XFeatures)); % Fractional parts of all elements
fractional_values_non_zero = fractional_values(fractional_values > 0); % Filter non-zero fractional values



% 4. Convert X Test to fixed—point using WL and EL
% Check if XFeatures has only positive integers
if isempty(fractional_values_non_zero)
    FL = 0;
    max_fractional = 0;
    min_fractional = 0;
else
    max_fractional = max(fractional_values_non_zero);
    min_fractional = min(fractional_values_non_zero);
    
    % Determine FL based on the smallest non-zero fractional value
    FL = 1 + ceil(-log2(min_fractional)); % 1 is added (manually)
end

% Calculate WL
WL = 1 + ceil(log2(max(abs([max_val, min_val])))) + FL;

 XTest_FixedPoint=fi(XTest,1,WL,FL);
end
