# 8-to-3 Priority Encoder

**Description:**
RTL implementation of an 8-to-3 priority encoder written in Verilog. The combinational logic strictly uses if-else cascading to prioritize the highest active bit (bit 7 down to bit 0) while explicitly preventing latch inference.

**Verification:**
Includes a self-checking testbench (`priority_encoder_tb.v`) compiled and simulated using Icarus Verilog.
