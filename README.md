
# Machine Learning with FPGA and MATLAB

## Project Overview

This project explores the deployment of machine learning models on FPGA hardware, focusing on **Linear Regression** and **Deep Neural Networks (DNN)**. The models were implemented using **Simulink** and **HDL Coder** in **MATLAB**, with a specific emphasis on hardware acceleration for efficient real-time processing. The HDL code generated was deployed on the **Nexys 4 Artix-7 FPGA** board, enabling a comparison between software and hardware execution.

### Models Implemented
1. **Linear Regression**: Predicting house prices using the `USAHousing.data` dataset.
2. **Deep Neural Networks**: Implementing basic neural networks with hardware-friendly activation functions.

## Linear Regression Implementation

### Steps:
1. **Simulink Model Creation**:  
   A Simulink model was created to simulate the behavior of a Linear Regression model, calculating the regression coefficients (θ) using the dataset.  
   **Equation**:  
   \[
   \hat{y} = X\theta
   \]
   where `X` is the input data matrix, and `θ` is the coefficient vector.

2. **Fixed-Point Conversion**:  
   The coefficients and input data were converted into **fixed-point** format using the function `ConvertToFixedPoint()` to accommodate FPGA's fixed-point arithmetic.

3. **Simulink Simulation**:  
   The fixed-point values were loaded from the MATLAB workspace into Simulink for simulation. The results were compared with both MATLAB simulations and FPGA hardware outputs.

## Deep Neural Network (DNN) Implementation

### Activation Function Approximation

In implementing deep neural networks, we employed **sigmoid** and **tanh** as activation functions. Since these functions are computationally expensive for hardware, we used linear approximations to facilitate FPGA deployment.

## Sigmoid and Tanh Function Approximations for Hardware Implementation

### Sigmoid Function Approximation

The sigmoid function, defined as:
```
σ(x) = 1 / (1 + e^(-x))
```
is approximated using a piecewise linear model.

### Tanh Function Approximation

The hyperbolic tangent function, defined as:
```
tanh(x) = (e^x - e^(-x)) / (e^x + e^(-x))
```
is similarly approximated using a piecewise linear approach.

Both approximations use the following piecewise linear model:
```
- For x < -3, σ(x) ≈ -1
- For -3 ≤ x < -2, σ(x) ≈ m1 * x + c1
- For -2 ≤ x ≤ 2, σ(x) ≈ m2 * x + c2
- For 2 < x ≤ 3, σ(x) ≈ m3 * x + c3
- For x > 3, σ(x) ≈ 1
```

The specific coefficients (m1, c1, m2, c2, m3, c3) for each function are as follows:

**Sigmoid Function:**
- m1 = 0.072, c1 = 0.22
- m2 = 0.21, c2 = 0.5
- m3 = 0.072, c3 = 0.78

**Tanh Function:**
- m1 = 0.18, c1 = -0.72
- m2 = 0.82, c2 = 0
- m3 = 0.18, c3 = 0.72

These piecewise linear approximations provide efficient hardware implementations by simplifying the computation of these complex functions.

### Simulink Model Creation:
Using the function `gensim(net)`, the neural network was exported as a Simulink model. Inputs and activation function outputs were converted into **fixed-point** format for FPGA compatibility, following the same process used in the linear regression model.

### HDL Code Generation and Deployment

#### Steps:
1. **Generating HDL Files**:
   - Ensure required MATLAB add-ons, including **HDL Coder** and **Fixed-Point Designer**, are installed.
   - Generate HDL files using:
     ```matlab
     checkhdl(<Simulink_Model_Name>)
     createhdl(<Simulink_Model_Name>)
     ```

2. **FilWizard Command**:  
   Run the `filwizard` command to configure the FPGA board:
   ```matlab
   filwizard
   ```
   - Select the Nexys 4 Artix-7 board.
   - Set your module as the top module.

3. **Build and Upload**:  
   Build the project and deploy the HDL code onto the FPGA.

4. **Testing and Comparison**:  
   - Connect the FPGA output to Simulink using the generated model.
   - Use a **Scope** block to compare the FPGA hardware output with MATLAB and Simulink simulations.

## Requirements

### MATLAB Toolboxes/Add-Ons:
- **Simulink**
- **HDL Coder**
- **Fixed-Point Designer**
- **MATLAB Coder**

### FPGA:
- Nexys 4 Artix-7 FPGA board (or similar)

## Usage Instructions

1. Clone the repository.
2. Open MATLAB and load the Simulink model for Linear Regression or DNN.
3. Run `ConvertToFixedPoint()` to prepare data.
4. Use `checkhdl` and `createhdl` to generate HDL files.
5. Run `filwizard` to configure the FPGA board and upload the HDL code.
6. Compare the hardware, Simulink, and MATLAB outputs to assess accuracy.

## Conclusion

This project demonstrates the successful implementation of Linear Regression and Deep Neural Networks using FPGA hardware. The use of linear approximations for activation functions enables efficient hardware deployment, while the comparison between software and hardware outputs confirms accuracy and performance improvements.

--- 

