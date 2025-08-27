# Fast Fourier Transform (FFT) Digital Design Flow

This project implements a fully pipelined **8-point Radix-2 Decimation-In-Frequency (DIF) FFT** from system-level modeling down to ASIC implementation.

---

## 📁 Project Structure

---

## 🚀 Design Overview
- **FFT Type:** Radix-2 DIF  
- **Transform Size:** 8-point  
- **Architecture:** Fully pipelined  
- **Latency:** 3 cycles  
- **Throughput:** 1 result per cycle  
- **Technology:** 130nm ASIC  

---

## 📊 Key Features
- High-throughput pipelined architecture  
- Optimized fixed-point arithmetic  
- Modular RTL with three FFT stages  
- Comprehensive SystemVerilog testbench  
- Full ASIC flow using OpenLane  

---

## 🛠️ Implementation Steps
### 1. System Modeling (MATLAB)
- Behavioral validation & fixed-point analysis  
- Achieved SQNR > 46 dB  

### 2. RTL Design (Verilog)
- Three pipeline stages with handshake signals  
- Resource-efficient arithmetic  

### 3. Verification (SystemVerilog)
- 100% code coverage (statement, branch, toggle)  
- File-based test vectors from MATLAB  
- Scoreboard with 0.32 tolerance  
- All 100 test cases passed  

### 4. ASIC Implementation (OpenLane)
- **Technology:** 130nm  
- **Max Frequency:** 166.67 MHz  
- **Core Area:** 288.32 × 288.42 μm  
- **Power:** 10.4 mW (slow corner)  
- **Standard Cells:** 4,211  

---

## 📈 Performance Summary
| Metric             | Value                   |
|---------------------|-------------------------|
| Maximum Frequency   | 166.67 MHz             |
| Latency             | 3 cycles               |
| Throughput          | 1 sample/cycle         |
| Core Area           | 288.32 × 288.42 μm     |
| Total Power         | 10.4 mW (slow corner)  |
| Standard Cells      | 4,211                  |

---

## 🎯 Usage
### Simulation
```bash
# MATLAB simulation
cd matlab/
matlab -r "run('test_fft.m')"
cd asic/
make run_synthesis
make run_floorplan
make run_placement
make run_routing

# RTL simulation
cd rtl/
make sim

# SystemVerilog verification
cd verification/
make run_test
