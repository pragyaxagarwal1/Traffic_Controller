# Traffic_Controller
# 🚦 Simple Traffic Light Controller (Verilog)

This project implements a **basic traffic light controller** in Verilog for two directions: **North-South (NS)** and **East-West (EW)**. The controller toggles between the two directions using a timer and displays the appropriate light signals (Red, Yellow, Green).

---

## 🧠 Overview

- **Design Language**: Verilog HDL  
- **Simulation Tool**: ModelSim / QuestaSim  
- **Lights Representation**:  
  - `3'b100` = Red  
  - `3'b010` = Yellow *(not used in this simplified version)*  
  - `3'b001` = Green  

---

## 📁 Files

| File | Description |
|------|-------------|
| `Simple_Traffic_Light_Controller.v` | Verilog module implementing the traffic light logic |
| `tb_Simple_Traffic_Light_Controller.v` | Testbench for simulating the traffic light controller |
| `README.md` | Project description and setup instructions |

---

## ⚙️ How It Works

- There are **two states**:
  - **NS Green, EW Red**
  - **NS Red, EW Green**
- Each state lasts for `MAX_TIME` clock cycles.
- A timer is used to switch states.
- The system resets to **NS Green, EW Red** when the `reset` signal is high.

---

## ⏱ Timing Parameters

| Parameter     | Value | Description                         |
|--------------|--------|-------------------------------------|
| `MAX_TIME`    | 5      | Number of clock cycles per state   |
| Clock Period | 10 ns  | Clock toggles every 5 ns            |

---

## ▶️ Simulation Instructions

### 📦 Using ModelSim / QuestaSim

1. **Launch ModelSim**
2. **Compile the Verilog Files**:
   ```tcl
   vlog Simple_Traffic_Light_Controller.v
   vlog tb_Simple_Traffic_Light_Controller.v
