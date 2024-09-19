function ytan = NN_Layer_Tanh_HDL(Bias,Weight,X)
% ytan = NN_Layer_Tanh_HDL(Bias,Weight,X)
% This function implements NN Layer using Tanh Function
% It is HDL supported, it can be used in HDL Code Generation
% where
%     Weight = Weights should be arranged as Row Vector
%     X = Instances of Input Features should be arranged as Row Vector
%     Bias = it can be Row or Column Vector
%     Y = It is output vector (arranged as Column Vector)
%         from all neurons of given layer.
% Note: All inputs of this function should be in fixed point form

[Nodes,NCols] = size(Weight);
WL = 16;       % Word Length
FL = 10;       % Fractional Length
PM = fi(zeros(Nodes,1),1,WL,FL);
WS = fi(zeros(Nodes,1),1,WL,FL);

ytan = fi(zeros(Nodes,1),1,WL,14);

for k = 1:Nodes
   
    PM(k) = Weight(k,:)*X(:,1);
    WS(k) = PM(k) + Bias(k);
    y = tanh_pw_HDL(WS(k));
    ytan(k) = y;
end
end