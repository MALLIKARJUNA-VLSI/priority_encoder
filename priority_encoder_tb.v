`timescale 1ns/1ps

module priority_encoder_tb;

    // Inputs
    reg [7:0] d_in;

    // Outputs
    wire [2:0] code_out;
    wire       valid_out;

    // Instantiate the Unit Under Test (UUT)
    priority_encoder uut (
        .d_in(d_in),
        .code_out(code_out),
        .valid_out(valid_out)
    );

    initial begin
        // Setup waveform dump file for GTKWave
        $dumpfile("priority_encoder.vcd");
        $dumpvars(0, priority_encoder_tb);

        $display("Time\t d_in\t\t code_out\t valid_out");
        $monitor("%0t\t %b\t %b\t\t %b", $time, d_in, code_out, valid_out);

        // Apply test vectors (testing priority from bit 7 down to bit 0)
        d_in = 8'b00000000; #10; // No active inputs
        d_in = 8'b00000001; #10; // Bit 0 active
        d_in = 8'b00000010; #10; // Bit 1 active
        d_in = 8'b00000100; #10; // Bit 2 active
        d_in = 8'b00001000; #10; // Bit 3 active
        d_in = 8'b00010000; #10; // Bit 4 active
        d_in = 8'b00100000; #10; // Bit 5 active
        d_in = 8'b01000000; #10; // Bit 6 active
        d_in = 8'b10000000; #10; // Bit 7 active
        d_in = 8'b10101010; #10; // Multiple active (testing priority: bit 7 wins)
        d_in = 8'b00011100; #10; // Multiple active (bit 4 wins)

        $finish;
    end

endmodule