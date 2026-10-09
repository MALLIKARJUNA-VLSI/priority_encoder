module priority_encoder (
    input  wire [7:0] d_in,
    output reg  [2:0] code_out,
    output reg        valid_out
);

    always @(*) begin
        // Default assignments to prevent latch inference
        code_out  = 3'b000;
        valid_out = 1'b0;

        casez (d_in)
            8'b1???????: begin code_out = 3'd7; valid_out = 1'b1; end
            8'b01??????: begin code_out = 3'd6; valid_out = 1'b1; end
            8'b001?????: begin code_out = 3'd5; valid_out = 1'b1; end
            8'b0001????: begin code_out = 3'd4; valid_out = 1'b1; end
            8'b00001???: begin code_out = 3'd3; valid_out = 1'b1; end
            8'b000001??: begin code_out = 3'd2; valid_out = 1'b1; end
            8'b0000001?: begin code_out = 3'd1; valid_out = 1'b1; end
            8'b00000001: begin code_out = 3'd0; valid_out = 1'b1; end
            default:     begin code_out = 3'b000; valid_out = 1'b0; end
        endcase
    end

endmodule