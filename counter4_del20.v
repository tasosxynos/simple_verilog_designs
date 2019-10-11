module counter4del20 (clear, clock, load, start_stop, count, data);
  input [3:0] data;
  output [3:0] count;
  input start_stop;
  input load;
  input clock;
  input clear;
  reg [3:0] count;
  
  always @(posedge clock)
   if (clear) count <= #20 (0);
    else if (load) count <= #20 (data);
              else if (start_stop) count <= #20 (count + 1);
endmodule
