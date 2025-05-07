💻 Digital System Design Lab – Sungkyul University
This repository contains hands-on lab assignments from the Digital System Design course at the Department of Information and Communication Engineering, Sungkyul University.
All projects are written in Verilog HDL and cover fundamental topics such as combinational and sequential logic circuits, finite state machines, counters, and a stopwatch project using 7-segment displays.

📁 Directory Structure

Digital System Lab/

├── CH0 ~ CH5-2         # Chapter-based lab exercises (MUX, adder, FSM, etc.)

├── StopWatch/          # Verilog-based stopwatch project with 7-segment display

└── Includes testbenches (tb_*.v) for most modules

⚙️ Development Environment
- Language: Verilog HDL
- Simulator: ModelSim (used in lab sessions)
- Core Components
    Combinational logic: MUX, decoder, encoder, comparator, etc.
    Sequential logic: flip-flops, counters, shift registers
    FSM (Finite State Machines): Moore model
    Clock dividers, 7-segment display encoders


🧠 Key Lab Topics
- CH1–CH2: 2:1, 4:1, 8:1 MUX, Half/Full Adders with testbenches
- CH4: Decoder, Encoder, Comparator, Multiplexer, 7-segment Display
- CH5-1: D Flip-Flop, Up/Down Counter, Moore FSM
- CH5-2: Clock Divider, PIPO and SISO Shift Registers
- StopWatch: Functional stopwatch with Verilog & 7-segment display

📌 Features
- Includes testbench files (tb_*.v) for simulation and verification
- Clearly separated modules for design and testing
- Compatible with common FPGA workflows and simulators

📎 Notes
This project is for academic use and is primarily designed for simulation and educational purposes.
Some modules may require adaptation for specific FPGA boards or development kits depending on the clock and reset setup.
