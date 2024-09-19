// -------------------------------------------------------------
// 
// File Name: hdlsrc\DNN\Hidden_Layer2.v
// Created: 2024-09-19 22:24:12
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Hidden_Layer2
// Source Path: DNN/DNNModel/Hidden Layer2
// Hierarchy Level: 1
// Model version: 1.53
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Hidden_Layer2
          (Bias_0,
           Bias_1,
           Bias_2,
           Bias_3,
           Weight_0,
           Weight_1,
           Weight_2,
           Weight_3,
           Weight_4,
           Weight_5,
           Weight_6,
           Weight_7,
           Weight_8,
           Weight_9,
           Weight_10,
           Weight_11,
           X_0,
           X_1,
           X_2,
           ytan_0,
           ytan_1,
           ytan_2,
           ytan_3);


  input   signed [8:0] Bias_0;  // sfix9_En6
  input   signed [8:0] Bias_1;  // sfix9_En6
  input   signed [8:0] Bias_2;  // sfix9_En6
  input   signed [8:0] Bias_3;  // sfix9_En6
  input   signed [9:0] Weight_0;  // sfix10_En7
  input   signed [9:0] Weight_1;  // sfix10_En7
  input   signed [9:0] Weight_2;  // sfix10_En7
  input   signed [9:0] Weight_3;  // sfix10_En7
  input   signed [9:0] Weight_4;  // sfix10_En7
  input   signed [9:0] Weight_5;  // sfix10_En7
  input   signed [9:0] Weight_6;  // sfix10_En7
  input   signed [9:0] Weight_7;  // sfix10_En7
  input   signed [9:0] Weight_8;  // sfix10_En7
  input   signed [9:0] Weight_9;  // sfix10_En7
  input   signed [9:0] Weight_10;  // sfix10_En7
  input   signed [9:0] Weight_11;  // sfix10_En7
  input   signed [15:0] X_0;  // sfix16_En14
  input   signed [15:0] X_1;  // sfix16_En14
  input   signed [15:0] X_2;  // sfix16_En14
  output  signed [15:0] ytan_0;  // sfix16_En14
  output  signed [15:0] ytan_1;  // sfix16_En14
  output  signed [15:0] ytan_2;  // sfix16_En14
  output  signed [15:0] ytan_3;  // sfix16_En14


  wire signed [8:0] Bias [0:3];  // sfix9_En6 [4]
  wire signed [9:0] Weight [0:3] [0:2];  // sfix10_En7 [4x3]
  wire signed [15:0] X [0:2];  // sfix16_En14 [3]
  reg signed [15:0] ytan [0:3];  // sfix16_En14 [4]
  reg signed [31:0] k;  // int32
  reg signed [25:0] prodAB;  // sfix26_En21
  reg signed [27:0] c;  // sfix28_En21
  reg signed [31:0] k_0;  // int32
  reg signed [15:0] y;  // sfix16_En10
  reg signed [15:0] slice_temp;  // sfix16_En10
  reg signed [15:0] add_cast [0:3];  // sfix16_En10 [4]
  reg signed [16:0] add_cast_0 [0:3];  // sfix17_En10 [4]
  reg signed [16:0] add_cast_1 [0:3];  // sfix17_En10 [4]
  reg signed [16:0] add_temp [0:3];  // sfix17_En10 [4]
  reg signed [28:0] add_cast_2 [0:2];  // sfix29_En21 [3]
  reg signed [28:0] add_cast_3 [0:2];  // sfix29_En21 [3]
  reg signed [28:0] add_temp_0 [0:2];  // sfix29_En21 [3]
  reg signed [31:0] mul_temp [0:3];  // sfix32_En20 [4]
  reg signed [32:0] add_cast_4 [0:3];  // sfix33_En20 [4]
  reg signed [32:0] add_temp_1 [0:3];  // sfix33_En20 [4]
  reg signed [31:0] mul_temp_0 [0:3];  // sfix32_En20 [4]
  reg signed [31:0] mul_temp_1 [0:3];  // sfix32_En20 [4]
  reg signed [32:0] add_cast_5 [0:3];  // sfix33_En20 [4]
  reg signed [32:0] add_temp_2 [0:3];  // sfix33_En20 [4]


  assign Bias[0] = Bias_0;
  assign Bias[1] = Bias_1;
  assign Bias[2] = Bias_2;
  assign Bias[3] = Bias_3;

  assign Weight[0][0] = Weight_0;
  assign Weight[1][0] = Weight_1;
  assign Weight[2][0] = Weight_2;
  assign Weight[3][0] = Weight_3;
  assign Weight[0][1] = Weight_4;
  assign Weight[1][1] = Weight_5;
  assign Weight[2][1] = Weight_6;
  assign Weight[3][1] = Weight_7;
  assign Weight[0][2] = Weight_8;
  assign Weight[1][2] = Weight_9;
  assign Weight[2][2] = Weight_10;
  assign Weight[3][2] = Weight_11;

  assign X[0] = X_0;
  assign X[1] = X_1;
  assign X[2] = X_2;

  always @* begin
    c = 28'sb0000000000000000000000000000;
    y = 16'sb0000000000000000;
    prodAB = 26'sb00000000000000000000000000;
    slice_temp = 16'sb0000000000000000;
    // ytan = NN_Layer_Tanh_HDL(Bias,Weight,X)
    // This function implements NN Layer using Tanh Function
    // It is HDL supported, it can be used in HDL Code Generation
    // where
    //     Weight = Weights should be arranged as Row Vector
    //     X = Instances of Input Features should be arranged as Row Vector
    //     Bias = it can be Row or Column Vector
    //     Y = It is output vector (arranged as Column Vector)
    //         from all neurons of given layer.
    // Note: All inputs of this function should be in fixed point form
    // Word Length
    // Fractional Length

    for(k = 32'sd0; k <= 32'sd3; k = k + 32'sd1) begin
      c = 28'sb0000000000000000000000000000;

      for(k_0 = 32'sd0; k_0 <= 32'sd2; k_0 = k_0 + 32'sd1) begin
        prodAB = Weight[k][k_0] * X[k_0];
        add_cast_2[k_0] = {c[27], c};
        add_cast_3[k_0] = {{3{prodAB[25]}}, prodAB};
        add_temp_0[k_0] = add_cast_2[k_0] + add_cast_3[k_0];
        if ((add_temp_0[k_0][28] == 1'b0) && (add_temp_0[k_0][27] != 1'b0)) begin
          c = 28'sb0111111111111111111111111111;
        end
        else if ((add_temp_0[k_0][28] == 1'b1) && (add_temp_0[k_0][27] != 1'b1)) begin
          c = 28'sb1000000000000000000000000000;
        end
        else begin
          c = add_temp_0[k_0][27:0];
        end
      end

      if (((c[27] == 1'b0) && (c[26] != 1'b0)) || ((c[27] == 1'b0) && (c[26:11] == 16'sb0111111111111111))) begin
        add_cast[k] = 16'sb0111111111111111;
      end
      else if ((c[27] == 1'b1) && (c[26] != 1'b1)) begin
        add_cast[k] = 16'sb1000000000000000;
      end
      else begin
        add_cast[k] = c[26:11] + $signed({1'b0, c[10]});
      end
      add_cast_0[k] = {add_cast[k][15], add_cast[k]};
      add_cast_1[k] = {{4{Bias[k][8]}}, {Bias[k], 4'b0000}};
      add_temp[k] = add_cast_0[k] + add_cast_1[k];
      if ((add_temp[k][16] == 1'b0) && (add_temp[k][15] != 1'b0)) begin
        slice_temp = 16'sb0111111111111111;
      end
      else if ((add_temp[k][16] == 1'b1) && (add_temp[k][15] != 1'b1)) begin
        slice_temp = 16'sb1000000000000000;
      end
      else begin
        slice_temp = add_temp[k][15:0];
      end
      // Word Length
      // Fractional Length
      // Slopes and Offsets
      if (slice_temp < 16'sb1111100000000000) begin
        y = 16'sb1111110000000000;
      end
      else if (slice_temp < 16'sb1111101110011010) begin
        mul_temp[k] = 16'sb0000000010111000 * slice_temp;
        add_cast_4[k] = {mul_temp[k][31], mul_temp[k]};
        add_temp_1[k] = add_cast_4[k] + 33'sh1FFF47C00;
        y = add_temp_1[k][25:10];
      end
      else if ((slice_temp >= 16'sb1111101110011010) && (slice_temp <= 16'sb0000010001100110)) begin
        mul_temp_0[k] = 16'sb0000001101001000 * slice_temp;
        y = mul_temp_0[k][25:10];
      end
      else if (slice_temp <= 16'sb0000100000000000) begin
        mul_temp_1[k] = 16'sb0000000010111000 * slice_temp;
        add_cast_5[k] = {mul_temp_1[k][31], mul_temp_1[k]};
        add_temp_2[k] = add_cast_5[k] + 33'sh0000B8400;
        y = add_temp_2[k][25:10];
      end
      else begin
        y = 16'sb0000010000000000;
      end
      // Saturating between -1 to +1
      if (y < 16'sb1111110000000000) begin
        y = 16'sb1111110000000000;
      end
      else if (y >= 16'sb0000010000000000) begin
        y = 16'sb0000010000000000;
      end
      if ((y[15] == 1'b0) && (y[14:11] != 4'b0000)) begin
        ytan[k] = 16'sb0111111111111111;
      end
      else if ((y[15] == 1'b1) && (y[14:11] != 4'b1111)) begin
        ytan[k] = 16'sb1000000000000000;
      end
      else begin
        ytan[k] = {y[11:0], 4'b0000};
      end
    end

  end



  assign ytan_0 = ytan[0];

  assign ytan_1 = ytan[1];

  assign ytan_2 = ytan[2];

  assign ytan_3 = ytan[3];

endmodule  // Hidden_Layer2

