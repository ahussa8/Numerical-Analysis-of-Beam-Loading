# 💻 ME-212 Solid Mechanics – Beam Loading Analysis

This project numerically analyzes internal shear forces and bending moments in cantilever beams using MATLAB. It includes simulations for distributed and discrete load cases and validates them against theoretical expectations.

---

## 📌 Overview

The project covers:
- Method of Sections
- Point Load Modeling
- Trapezoidal Rule for Numerical Integration
- MATLAB Visualization and Publishing

---

## 🔧 Methods Used

### Part 1: Method of Sections
- Used to derive analytical expressions for internal shear and moment
- Applied to a cantilever beam with combined triangular and uniform distributed loads

### Part 2: Point Load Approximation
- Simulated equivalent point loads for distributed forces
- Developed generalized code to handle arbitrary point load arrays

### Part 3: Numerical Integration
- Implemented Trapezoidal Rule to convert continuous distributed loads into 100 discrete point loads
- Validated against known solutions for uniform and parabolic load distributions

---

## 📊 Key Features

- Shear force and bending moment diagrams at 100 beam positions
- Visualization of point and distributed loads
- Accuracy within 95% of analytical methods

---

## 📁 Project Files

- `project1_main.m`: Main driver code
- `method_of_sections.m`: Analytical approach
- `point_load_analysis.m`: Point load model
- `trapezoidal_integration.m`: Numerical load conversion
- `Project1_Report.pdf`: Published report

---

## 🔍 Tools & Technologies

- MATLAB
- MATLAB's `publish` feature for report generation
- Quiver and plot functions for load visualization

---

## 📈 Sample Output

- Force and moment plots
- Quiver plot of point loads
- Commented and published MATLAB code

---
