% Load the diabetes dataset into a table
data = readtable("diabetes.csv");

% Get the column names, excluding the first column (assuming it's a label)
columnNames = data.Properties.VariableNames(2:end);

% Extract relevant features from the dataset
data = [data.Glucose, data.BloodPressure, data.SkinThickness, data.Insulin, data.BMI, ...
        data.DiabetesPedigreeFunction, data.Age, data.Outcome];

% Assign all data to a variable
All_Data = data;

% Separate the input features and output labels
Xin = All_Data(:, 1:end-1);    % Features (everything except the last column)
Yout = All_Data(:, end);       % Outcome (last column)

% Normalize the input and output data
X = mapminmax(Xin');  % Normalize input features
Y = mapminmax(Yout', 0, 1);  % Normalize output (scaled between 0 and 1)

Len = length(Y);  % Total number of samples

% Define training and testing data split
Prob = 0.8;  % 80% of data will be used for training
NTr = round(Prob * Len);  % Number of training samples

% Split the data into training and testing sets
XTrain = X(:, 1:NTr);  % Training inputs
YTrain = Y(:, 1:NTr);  % Training outputs

XTest = X(:, NTr+1:end);  % Testing inputs
YTest = Y(:, NTr+1:end);  % Testing outputs

% Transpose test data to have features along columns
XTest = XTest';
YTest = YTest';

% Neural Network Setup
% Define neural network input size based on training data
[R, C] = size(XTrain);
inputSize = R;

% Define neural network architecture with two hidden layers
hiddenLayerSize1 = 3;  % Size of first hidden layer
hiddenLayerSize2 = round(R/2);  % Size of second hidden layer (half of input size)

% Create a feedforward neural network
net = feedforwardnet([hiddenLayerSize1, hiddenLayerSize2]);

% Set training parameters for the neural network
net.trainParam.epochs = 1000;  % Maximum number of training epochs
net.trainParam.goal = 1e-6;  % Performance goal for training
net.trainParam.max_fail = 200;  % Maximum allowed failures

% Set activation functions for each layer
net.layers{1}.transferFcn = 'tansig';  % Tanh sigmoid for first hidden layer
net.layers{2}.transferFcn = 'tansig';  % Tanh sigmoid for second hidden layer
net.layers{3}.transferFcn = 'logsig';  % Log sigmoid for output layer

% Train the neural network using training data
net = train(net, XTrain, YTrain);

% Generate a Simulink model of the trained neural network
%gensim(net);

% Extract weights and biases from the trained network
W1d = net.IW{1,1};  % Weights for input layer
b1d = net.b{1};     % Biases for input layer

W2d = net.LW{2,1};  % Weights for hidden layer 1
b2d = net.b{2};     % Biases for hidden layer 1

W3d = net.LW{3,2};  % Weights for hidden layer 2 (output layer)
b3d = net.b{3};     % Biases for hidden layer 2 (output layer)

% Convert test data, weights, and biases to fixed-point representation
XTestf = Convert_Data_to_Fixed_Point(X, XTest);
W1df = Convert_Data_to_Fixed_Point(W1d, W1d);
b1df = Convert_Data_to_Fixed_Point(b1d, b1d);
W2df = Convert_Data_to_Fixed_Point(W2d, W2d);
b2df = Convert_Data_to_Fixed_Point(b2d, b2d);
W3df = Convert_Data_to_Fixed_Point(W3d, W3d);
b3df = Convert_Data_to_Fixed_Point(b3d, b3d);

% Save the trained weights and biases in a .mat file for later use
save('DeepLearing.mat', 'W1d', 'W2d', 'W3d', 'b1d', 'b2d', 'b3d', 'net');



%% Simulink data output
ySim = out.y2;  % Extract the Simulink output

% Remove any extra samples from Simulink output
ySim(end) = [];  % Ensure the length matches test data

% Calculate accuracy of Simulink output against true test labels
Accuracy_Sim = 100 * mean(ySim == YTest);  % Accuracy percentage of Simulink model
