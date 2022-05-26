// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Nov 15 16:14:54 2021
// Host        : DESKTOP-Johnny running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               E:/Vivado/RealVivado/Labs/ParityBitTransmitter/ParityBitTransmitter.sim/sim_1/synth/timing/xsim/main_time_synth.v
// Design      : Parity
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Dff
   (serial_OBUF,
    out_OBUF,
    SecCLK,
    load_IBUF);
  output serial_OBUF;
  input [0:0]out_OBUF;
  input SecCLK;
  input load_IBUF;

  wire Q_i_1_n_0;
  wire SecCLK;
  wire load_IBUF;
  wire [0:0]out_OBUF;
  wire serial_OBUF;

  LUT1 #(
    .INIT(2'h1)) 
    Q_i_1
       (.I0(load_IBUF),
        .O(Q_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(out_OBUF),
        .Q(serial_OBUF),
        .R(Q_i_1_n_0));
endmodule

(* NotValidForBitStream *)
module Parity
   (load,
    E,
    clock,
    in,
    out,
    serial);
  input load;
  input E;
  input clock;
  input [7:0]in;
  output [7:0]out;
  output serial;

  wire E;
  wire E_IBUF;
  wire SecCLK;
  wire clock;
  wire clock_IBUF;
  wire clock_IBUF_BUFG;
  wire [7:0]in;
  wire [7:0]in_IBUF;
  wire load;
  wire load_IBUF;
  wire [7:0]out;
  wire [7:0]out_OBUF;
  wire serial;
  wire serial_OBUF;

initial begin
 $sdf_annotate("main_time_synth.sdf",,,,"tool_control");
end
  IBUF E_IBUF_inst
       (.I(E),
        .O(E_IBUF));
  BUFG clock_IBUF_BUFG_inst
       (.I(clock_IBUF),
        .O(clock_IBUF_BUFG));
  IBUF clock_IBUF_inst
       (.I(clock),
        .O(clock_IBUF));
  IBUF \in_IBUF[0]_inst 
       (.I(in[0]),
        .O(in_IBUF[0]));
  IBUF \in_IBUF[1]_inst 
       (.I(in[1]),
        .O(in_IBUF[1]));
  IBUF \in_IBUF[2]_inst 
       (.I(in[2]),
        .O(in_IBUF[2]));
  IBUF \in_IBUF[3]_inst 
       (.I(in[3]),
        .O(in_IBUF[3]));
  IBUF \in_IBUF[4]_inst 
       (.I(in[4]),
        .O(in_IBUF[4]));
  IBUF \in_IBUF[5]_inst 
       (.I(in[5]),
        .O(in_IBUF[5]));
  IBUF \in_IBUF[6]_inst 
       (.I(in[6]),
        .O(in_IBUF[6]));
  IBUF \in_IBUF[7]_inst 
       (.I(in[7]),
        .O(in_IBUF[7]));
  IBUF load_IBUF_inst
       (.I(load),
        .O(load_IBUF));
  SlowCLKGen main0
       (.E(E_IBUF),
        .SecCLK(SecCLK),
        .clock(clock_IBUF_BUFG));
  shift_reg main1
       (.SecCLK(SecCLK),
        .in_IBUF(in_IBUF),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF));
  Dff main5
       (.SecCLK(SecCLK),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[0]),
        .serial_OBUF(serial_OBUF));
  OBUF \out_OBUF[0]_inst 
       (.I(out_OBUF[0]),
        .O(out[0]));
  OBUF \out_OBUF[1]_inst 
       (.I(out_OBUF[1]),
        .O(out[1]));
  OBUF \out_OBUF[2]_inst 
       (.I(out_OBUF[2]),
        .O(out[2]));
  OBUF \out_OBUF[3]_inst 
       (.I(out_OBUF[3]),
        .O(out[3]));
  OBUF \out_OBUF[4]_inst 
       (.I(out_OBUF[4]),
        .O(out[4]));
  OBUF \out_OBUF[5]_inst 
       (.I(out_OBUF[5]),
        .O(out[5]));
  OBUF \out_OBUF[6]_inst 
       (.I(out_OBUF[6]),
        .O(out[6]));
  OBUF \out_OBUF[7]_inst 
       (.I(out_OBUF[7]),
        .O(out[7]));
  OBUF serial_OBUF_inst
       (.I(serial_OBUF),
        .O(serial));
endmodule

module SlowCLKGen
   (SecCLK,
    clock,
    E);
  output SecCLK;
  input clock;
  input E;

  wire E;
  wire SecCLK;
  wire SecCLK_i_1_n_0;
  wire SecCLK_i_2_n_0;
  wire SecCLK_i_3_n_0;
  wire SecCLK_i_4_n_0;
  wire SecCLK_i_5_n_0;
  wire SecCLK_i_6_n_0;
  wire SecCNTR;
  wire \SecCNTR[0]_i_3_n_0 ;
  wire \SecCNTR[0]_i_4_n_0 ;
  wire \SecCNTR[0]_i_5_n_0 ;
  wire \SecCNTR[0]_i_6_n_0 ;
  wire \SecCNTR[0]_i_7_n_0 ;
  wire [26:0]SecCNTR_reg;
  wire \SecCNTR_reg[0]_i_10_n_0 ;
  wire \SecCNTR_reg[0]_i_10_n_1 ;
  wire \SecCNTR_reg[0]_i_10_n_2 ;
  wire \SecCNTR_reg[0]_i_10_n_3 ;
  wire \SecCNTR_reg[0]_i_11_n_3 ;
  wire \SecCNTR_reg[0]_i_12_n_0 ;
  wire \SecCNTR_reg[0]_i_12_n_1 ;
  wire \SecCNTR_reg[0]_i_12_n_2 ;
  wire \SecCNTR_reg[0]_i_12_n_3 ;
  wire \SecCNTR_reg[0]_i_13_n_0 ;
  wire \SecCNTR_reg[0]_i_13_n_1 ;
  wire \SecCNTR_reg[0]_i_13_n_2 ;
  wire \SecCNTR_reg[0]_i_13_n_3 ;
  wire \SecCNTR_reg[0]_i_14_n_0 ;
  wire \SecCNTR_reg[0]_i_14_n_1 ;
  wire \SecCNTR_reg[0]_i_14_n_2 ;
  wire \SecCNTR_reg[0]_i_14_n_3 ;
  wire \SecCNTR_reg[0]_i_15_n_0 ;
  wire \SecCNTR_reg[0]_i_15_n_1 ;
  wire \SecCNTR_reg[0]_i_15_n_2 ;
  wire \SecCNTR_reg[0]_i_15_n_3 ;
  wire \SecCNTR_reg[0]_i_2_n_0 ;
  wire \SecCNTR_reg[0]_i_2_n_1 ;
  wire \SecCNTR_reg[0]_i_2_n_2 ;
  wire \SecCNTR_reg[0]_i_2_n_3 ;
  wire \SecCNTR_reg[0]_i_2_n_4 ;
  wire \SecCNTR_reg[0]_i_2_n_5 ;
  wire \SecCNTR_reg[0]_i_2_n_6 ;
  wire \SecCNTR_reg[0]_i_2_n_7 ;
  wire \SecCNTR_reg[0]_i_9_n_0 ;
  wire \SecCNTR_reg[0]_i_9_n_1 ;
  wire \SecCNTR_reg[0]_i_9_n_2 ;
  wire \SecCNTR_reg[0]_i_9_n_3 ;
  wire \SecCNTR_reg[12]_i_1_n_0 ;
  wire \SecCNTR_reg[12]_i_1_n_1 ;
  wire \SecCNTR_reg[12]_i_1_n_2 ;
  wire \SecCNTR_reg[12]_i_1_n_3 ;
  wire \SecCNTR_reg[12]_i_1_n_4 ;
  wire \SecCNTR_reg[12]_i_1_n_5 ;
  wire \SecCNTR_reg[12]_i_1_n_6 ;
  wire \SecCNTR_reg[12]_i_1_n_7 ;
  wire \SecCNTR_reg[16]_i_1_n_0 ;
  wire \SecCNTR_reg[16]_i_1_n_1 ;
  wire \SecCNTR_reg[16]_i_1_n_2 ;
  wire \SecCNTR_reg[16]_i_1_n_3 ;
  wire \SecCNTR_reg[16]_i_1_n_4 ;
  wire \SecCNTR_reg[16]_i_1_n_5 ;
  wire \SecCNTR_reg[16]_i_1_n_6 ;
  wire \SecCNTR_reg[16]_i_1_n_7 ;
  wire \SecCNTR_reg[20]_i_1_n_0 ;
  wire \SecCNTR_reg[20]_i_1_n_1 ;
  wire \SecCNTR_reg[20]_i_1_n_2 ;
  wire \SecCNTR_reg[20]_i_1_n_3 ;
  wire \SecCNTR_reg[20]_i_1_n_4 ;
  wire \SecCNTR_reg[20]_i_1_n_5 ;
  wire \SecCNTR_reg[20]_i_1_n_6 ;
  wire \SecCNTR_reg[20]_i_1_n_7 ;
  wire \SecCNTR_reg[24]_i_1_n_2 ;
  wire \SecCNTR_reg[24]_i_1_n_3 ;
  wire \SecCNTR_reg[24]_i_1_n_5 ;
  wire \SecCNTR_reg[24]_i_1_n_6 ;
  wire \SecCNTR_reg[24]_i_1_n_7 ;
  wire \SecCNTR_reg[4]_i_1_n_0 ;
  wire \SecCNTR_reg[4]_i_1_n_1 ;
  wire \SecCNTR_reg[4]_i_1_n_2 ;
  wire \SecCNTR_reg[4]_i_1_n_3 ;
  wire \SecCNTR_reg[4]_i_1_n_4 ;
  wire \SecCNTR_reg[4]_i_1_n_5 ;
  wire \SecCNTR_reg[4]_i_1_n_6 ;
  wire \SecCNTR_reg[4]_i_1_n_7 ;
  wire \SecCNTR_reg[8]_i_1_n_0 ;
  wire \SecCNTR_reg[8]_i_1_n_1 ;
  wire \SecCNTR_reg[8]_i_1_n_2 ;
  wire \SecCNTR_reg[8]_i_1_n_3 ;
  wire \SecCNTR_reg[8]_i_1_n_4 ;
  wire \SecCNTR_reg[8]_i_1_n_5 ;
  wire \SecCNTR_reg[8]_i_1_n_6 ;
  wire \SecCNTR_reg[8]_i_1_n_7 ;
  wire clock;
  wire [26:0]p_0_in;
  wire [3:1]\NLW_SecCNTR_reg[0]_i_11_CO_UNCONNECTED ;
  wire [3:2]\NLW_SecCNTR_reg[0]_i_11_O_UNCONNECTED ;
  wire [3:2]\NLW_SecCNTR_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_SecCNTR_reg[24]_i_1_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h2888)) 
    SecCLK_i_1
       (.I0(E),
        .I1(SecCLK),
        .I2(SecCLK_i_2_n_0),
        .I3(SecCLK_i_3_n_0),
        .O(SecCLK_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    SecCLK_i_2
       (.I0(SecCLK_i_4_n_0),
        .I1(SecCLK_i_5_n_0),
        .I2(SecCLK_i_6_n_0),
        .I3(p_0_in[3]),
        .I4(p_0_in[2]),
        .I5(p_0_in[1]),
        .O(SecCLK_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    SecCLK_i_3
       (.I0(p_0_in[25]),
        .I1(p_0_in[24]),
        .I2(p_0_in[22]),
        .I3(p_0_in[23]),
        .I4(p_0_in[26]),
        .I5(SecCNTR_reg[0]),
        .O(SecCLK_i_3_n_0));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    SecCLK_i_4
       (.I0(p_0_in[12]),
        .I1(p_0_in[13]),
        .I2(p_0_in[10]),
        .I3(p_0_in[11]),
        .I4(p_0_in[15]),
        .I5(p_0_in[14]),
        .O(SecCLK_i_4_n_0));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    SecCLK_i_5
       (.I0(p_0_in[19]),
        .I1(p_0_in[18]),
        .I2(p_0_in[17]),
        .I3(p_0_in[16]),
        .I4(p_0_in[21]),
        .I5(p_0_in[20]),
        .O(SecCLK_i_5_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    SecCLK_i_6
       (.I0(p_0_in[7]),
        .I1(p_0_in[6]),
        .I2(p_0_in[4]),
        .I3(p_0_in[5]),
        .I4(p_0_in[9]),
        .I5(p_0_in[8]),
        .O(SecCLK_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    SecCLK_reg
       (.C(clock),
        .CE(1'b1),
        .D(SecCLK_i_1_n_0),
        .Q(SecCLK),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h80000000)) 
    \SecCNTR[0]_i_1 
       (.I0(\SecCNTR[0]_i_3_n_0 ),
        .I1(\SecCNTR[0]_i_4_n_0 ),
        .I2(\SecCNTR[0]_i_5_n_0 ),
        .I3(\SecCNTR[0]_i_6_n_0 ),
        .I4(\SecCNTR[0]_i_7_n_0 ),
        .O(SecCNTR));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \SecCNTR[0]_i_3 
       (.I0(p_0_in[19]),
        .I1(p_0_in[20]),
        .I2(p_0_in[17]),
        .I3(p_0_in[18]),
        .I4(p_0_in[22]),
        .I5(p_0_in[21]),
        .O(\SecCNTR[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \SecCNTR[0]_i_4 
       (.I0(p_0_in[25]),
        .I1(p_0_in[26]),
        .I2(p_0_in[23]),
        .I3(p_0_in[24]),
        .I4(E),
        .I5(SecCNTR_reg[0]),
        .O(\SecCNTR[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \SecCNTR[0]_i_5 
       (.I0(p_0_in[13]),
        .I1(p_0_in[14]),
        .I2(p_0_in[12]),
        .I3(p_0_in[11]),
        .I4(p_0_in[16]),
        .I5(p_0_in[15]),
        .O(\SecCNTR[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \SecCNTR[0]_i_6 
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[4]),
        .I3(p_0_in[3]),
        .O(\SecCNTR[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \SecCNTR[0]_i_7 
       (.I0(p_0_in[7]),
        .I1(p_0_in[8]),
        .I2(p_0_in[5]),
        .I3(p_0_in[6]),
        .I4(p_0_in[10]),
        .I5(p_0_in[9]),
        .O(\SecCNTR[0]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \SecCNTR[0]_i_8 
       (.I0(SecCNTR_reg[0]),
        .O(p_0_in[0]));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[0] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[0]_i_2_n_7 ),
        .Q(SecCNTR_reg[0]),
        .R(SecCNTR));
  CARRY4 \SecCNTR_reg[0]_i_10 
       (.CI(\SecCNTR_reg[0]_i_9_n_0 ),
        .CO({\SecCNTR_reg[0]_i_10_n_0 ,\SecCNTR_reg[0]_i_10_n_1 ,\SecCNTR_reg[0]_i_10_n_2 ,\SecCNTR_reg[0]_i_10_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[24:21]),
        .S(SecCNTR_reg[24:21]));
  CARRY4 \SecCNTR_reg[0]_i_11 
       (.CI(\SecCNTR_reg[0]_i_10_n_0 ),
        .CO({\NLW_SecCNTR_reg[0]_i_11_CO_UNCONNECTED [3:1],\SecCNTR_reg[0]_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_SecCNTR_reg[0]_i_11_O_UNCONNECTED [3:2],p_0_in[26:25]}),
        .S({1'b0,1'b0,SecCNTR_reg[26:25]}));
  CARRY4 \SecCNTR_reg[0]_i_12 
       (.CI(\SecCNTR_reg[0]_i_13_n_0 ),
        .CO({\SecCNTR_reg[0]_i_12_n_0 ,\SecCNTR_reg[0]_i_12_n_1 ,\SecCNTR_reg[0]_i_12_n_2 ,\SecCNTR_reg[0]_i_12_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[16:13]),
        .S(SecCNTR_reg[16:13]));
  CARRY4 \SecCNTR_reg[0]_i_13 
       (.CI(\SecCNTR_reg[0]_i_15_n_0 ),
        .CO({\SecCNTR_reg[0]_i_13_n_0 ,\SecCNTR_reg[0]_i_13_n_1 ,\SecCNTR_reg[0]_i_13_n_2 ,\SecCNTR_reg[0]_i_13_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[12:9]),
        .S(SecCNTR_reg[12:9]));
  CARRY4 \SecCNTR_reg[0]_i_14 
       (.CI(1'b0),
        .CO({\SecCNTR_reg[0]_i_14_n_0 ,\SecCNTR_reg[0]_i_14_n_1 ,\SecCNTR_reg[0]_i_14_n_2 ,\SecCNTR_reg[0]_i_14_n_3 }),
        .CYINIT(SecCNTR_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[4:1]),
        .S(SecCNTR_reg[4:1]));
  CARRY4 \SecCNTR_reg[0]_i_15 
       (.CI(\SecCNTR_reg[0]_i_14_n_0 ),
        .CO({\SecCNTR_reg[0]_i_15_n_0 ,\SecCNTR_reg[0]_i_15_n_1 ,\SecCNTR_reg[0]_i_15_n_2 ,\SecCNTR_reg[0]_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[8:5]),
        .S(SecCNTR_reg[8:5]));
  CARRY4 \SecCNTR_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\SecCNTR_reg[0]_i_2_n_0 ,\SecCNTR_reg[0]_i_2_n_1 ,\SecCNTR_reg[0]_i_2_n_2 ,\SecCNTR_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\SecCNTR_reg[0]_i_2_n_4 ,\SecCNTR_reg[0]_i_2_n_5 ,\SecCNTR_reg[0]_i_2_n_6 ,\SecCNTR_reg[0]_i_2_n_7 }),
        .S({SecCNTR_reg[3:1],p_0_in[0]}));
  CARRY4 \SecCNTR_reg[0]_i_9 
       (.CI(\SecCNTR_reg[0]_i_12_n_0 ),
        .CO({\SecCNTR_reg[0]_i_9_n_0 ,\SecCNTR_reg[0]_i_9_n_1 ,\SecCNTR_reg[0]_i_9_n_2 ,\SecCNTR_reg[0]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[20:17]),
        .S(SecCNTR_reg[20:17]));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[10] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[8]_i_1_n_5 ),
        .Q(SecCNTR_reg[10]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[11] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[8]_i_1_n_4 ),
        .Q(SecCNTR_reg[11]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[12] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[12]_i_1_n_7 ),
        .Q(SecCNTR_reg[12]),
        .R(SecCNTR));
  CARRY4 \SecCNTR_reg[12]_i_1 
       (.CI(\SecCNTR_reg[8]_i_1_n_0 ),
        .CO({\SecCNTR_reg[12]_i_1_n_0 ,\SecCNTR_reg[12]_i_1_n_1 ,\SecCNTR_reg[12]_i_1_n_2 ,\SecCNTR_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\SecCNTR_reg[12]_i_1_n_4 ,\SecCNTR_reg[12]_i_1_n_5 ,\SecCNTR_reg[12]_i_1_n_6 ,\SecCNTR_reg[12]_i_1_n_7 }),
        .S(SecCNTR_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[13] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[12]_i_1_n_6 ),
        .Q(SecCNTR_reg[13]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[14] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[12]_i_1_n_5 ),
        .Q(SecCNTR_reg[14]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[15] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[12]_i_1_n_4 ),
        .Q(SecCNTR_reg[15]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[16] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[16]_i_1_n_7 ),
        .Q(SecCNTR_reg[16]),
        .R(SecCNTR));
  CARRY4 \SecCNTR_reg[16]_i_1 
       (.CI(\SecCNTR_reg[12]_i_1_n_0 ),
        .CO({\SecCNTR_reg[16]_i_1_n_0 ,\SecCNTR_reg[16]_i_1_n_1 ,\SecCNTR_reg[16]_i_1_n_2 ,\SecCNTR_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\SecCNTR_reg[16]_i_1_n_4 ,\SecCNTR_reg[16]_i_1_n_5 ,\SecCNTR_reg[16]_i_1_n_6 ,\SecCNTR_reg[16]_i_1_n_7 }),
        .S(SecCNTR_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[17] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[16]_i_1_n_6 ),
        .Q(SecCNTR_reg[17]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[18] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[16]_i_1_n_5 ),
        .Q(SecCNTR_reg[18]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[19] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[16]_i_1_n_4 ),
        .Q(SecCNTR_reg[19]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[1] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[0]_i_2_n_6 ),
        .Q(SecCNTR_reg[1]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[20] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[20]_i_1_n_7 ),
        .Q(SecCNTR_reg[20]),
        .R(SecCNTR));
  CARRY4 \SecCNTR_reg[20]_i_1 
       (.CI(\SecCNTR_reg[16]_i_1_n_0 ),
        .CO({\SecCNTR_reg[20]_i_1_n_0 ,\SecCNTR_reg[20]_i_1_n_1 ,\SecCNTR_reg[20]_i_1_n_2 ,\SecCNTR_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\SecCNTR_reg[20]_i_1_n_4 ,\SecCNTR_reg[20]_i_1_n_5 ,\SecCNTR_reg[20]_i_1_n_6 ,\SecCNTR_reg[20]_i_1_n_7 }),
        .S(SecCNTR_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[21] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[20]_i_1_n_6 ),
        .Q(SecCNTR_reg[21]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[22] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[20]_i_1_n_5 ),
        .Q(SecCNTR_reg[22]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[23] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[20]_i_1_n_4 ),
        .Q(SecCNTR_reg[23]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[24] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[24]_i_1_n_7 ),
        .Q(SecCNTR_reg[24]),
        .R(SecCNTR));
  CARRY4 \SecCNTR_reg[24]_i_1 
       (.CI(\SecCNTR_reg[20]_i_1_n_0 ),
        .CO({\NLW_SecCNTR_reg[24]_i_1_CO_UNCONNECTED [3:2],\SecCNTR_reg[24]_i_1_n_2 ,\SecCNTR_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_SecCNTR_reg[24]_i_1_O_UNCONNECTED [3],\SecCNTR_reg[24]_i_1_n_5 ,\SecCNTR_reg[24]_i_1_n_6 ,\SecCNTR_reg[24]_i_1_n_7 }),
        .S({1'b0,SecCNTR_reg[26:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[25] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[24]_i_1_n_6 ),
        .Q(SecCNTR_reg[25]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[26] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[24]_i_1_n_5 ),
        .Q(SecCNTR_reg[26]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[2] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[0]_i_2_n_5 ),
        .Q(SecCNTR_reg[2]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[3] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[0]_i_2_n_4 ),
        .Q(SecCNTR_reg[3]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[4] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[4]_i_1_n_7 ),
        .Q(SecCNTR_reg[4]),
        .R(SecCNTR));
  CARRY4 \SecCNTR_reg[4]_i_1 
       (.CI(\SecCNTR_reg[0]_i_2_n_0 ),
        .CO({\SecCNTR_reg[4]_i_1_n_0 ,\SecCNTR_reg[4]_i_1_n_1 ,\SecCNTR_reg[4]_i_1_n_2 ,\SecCNTR_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\SecCNTR_reg[4]_i_1_n_4 ,\SecCNTR_reg[4]_i_1_n_5 ,\SecCNTR_reg[4]_i_1_n_6 ,\SecCNTR_reg[4]_i_1_n_7 }),
        .S(SecCNTR_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[5] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[4]_i_1_n_6 ),
        .Q(SecCNTR_reg[5]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[6] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[4]_i_1_n_5 ),
        .Q(SecCNTR_reg[6]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[7] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[4]_i_1_n_4 ),
        .Q(SecCNTR_reg[7]),
        .R(SecCNTR));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[8] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[8]_i_1_n_7 ),
        .Q(SecCNTR_reg[8]),
        .R(SecCNTR));
  CARRY4 \SecCNTR_reg[8]_i_1 
       (.CI(\SecCNTR_reg[4]_i_1_n_0 ),
        .CO({\SecCNTR_reg[8]_i_1_n_0 ,\SecCNTR_reg[8]_i_1_n_1 ,\SecCNTR_reg[8]_i_1_n_2 ,\SecCNTR_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\SecCNTR_reg[8]_i_1_n_4 ,\SecCNTR_reg[8]_i_1_n_5 ,\SecCNTR_reg[8]_i_1_n_6 ,\SecCNTR_reg[8]_i_1_n_7 }),
        .S(SecCNTR_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \SecCNTR_reg[9] 
       (.C(clock),
        .CE(E),
        .D(\SecCNTR_reg[8]_i_1_n_6 ),
        .Q(SecCNTR_reg[9]),
        .R(SecCNTR));
endmodule

module shift
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift" *) 
module shift_0
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1__6
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift" *) 
module shift_1
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1__5
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift" *) 
module shift_2
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1__4
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift" *) 
module shift_3
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1__3
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift" *) 
module shift_4
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1__2
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift" *) 
module shift_5
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1__1
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift" *) 
module shift_6
   (out_OBUF,
    D,
    D_0,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [0:0]out_OBUF;
  output D;
  input D_0;
  input SecCLK;
  input [0:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire SecCLK;
  wire [0:0]in_IBUF;
  wire load_IBUF;
  wire [0:0]out_OBUF;

  LUT3 #(
    .INIT(8'hB8)) 
    W_i_1__0
       (.I0(in_IBUF),
        .I1(load_IBUF),
        .I2(out_OBUF),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    W_reg
       (.C(SecCLK),
        .CE(1'b1),
        .D(D_0),
        .Q(out_OBUF),
        .R(1'b0));
endmodule

module shift_reg
   (out_OBUF,
    SecCLK,
    in_IBUF,
    load_IBUF);
  output [7:0]out_OBUF;
  input SecCLK;
  input [7:0]in_IBUF;
  input load_IBUF;

  wire D;
  wire D_0;
  wire D_1;
  wire D_2;
  wire D_3;
  wire D_4;
  wire D_5;
  wire D_6;
  wire SecCLK;
  wire [7:0]in_IBUF;
  wire load_IBUF;
  wire [7:0]out_OBUF;

  shift Stage0
       (.D(D),
        .D_0(D_0),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[7]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[0]));
  shift_0 Stage1
       (.D(D_0),
        .D_0(D_1),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[0]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[1]));
  shift_1 Stage2
       (.D(D_1),
        .D_0(D_2),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[1]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[2]));
  shift_2 Stage3
       (.D(D_2),
        .D_0(D_3),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[2]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[3]));
  shift_3 Stage4
       (.D(D_3),
        .D_0(D_4),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[3]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[4]));
  shift_4 Stage5
       (.D(D_4),
        .D_0(D_5),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[4]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[5]));
  shift_5 Stage6
       (.D(D_5),
        .D_0(D_6),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[5]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[6]));
  shift_6 Stage7
       (.D(D_6),
        .D_0(D),
        .SecCLK(SecCLK),
        .in_IBUF(in_IBUF[6]),
        .load_IBUF(load_IBUF),
        .out_OBUF(out_OBUF[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
