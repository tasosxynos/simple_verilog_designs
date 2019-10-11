module counter8del20 (clear, clock, load, start_stop, count, data);
  input [7:0] data;
  output [7:0] count;
  input start_stop;
  input load;
  input clock;
  input clear;
  
  wire [3:0] count1;
  wire [3:0] count2;
  wire [3:0] data1;
  wire [3:0] data2;
  wire highmsb;

assign highmsb = ~count[3];
assign data1[3:0] = data[3:0];
assign data2[3:0] = data[7:4];
assign allones = count[0]&count[1]&count[2]&count[3];

counter4del20 u1_counter4del20 (
.clear(clear),
.clock(clock),
.load(load),
.start_stop(start_stop),
.count(count1),
.data(data1)
);

counter4del20 u2_counter4del20 (
.clear(clear),
.clock(clock),
.load(load),
.start_stop(allones),
.count(count2),
.data(data2)
);


assign count = {count2, count1};


endmodule
