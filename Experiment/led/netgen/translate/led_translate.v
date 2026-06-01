////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: led_translate.v
// /___/   /\     Timestamp: Wed May 20 15:18:35 2026
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim led.ngd led_translate.v 
// Device	: 3s100ecp132-4
// Input file	: led.ngd
// Output file	: /home/yzy/code/ElectronicTestingandExperimentalTechnology/E8/Experiment/led/netgen/translate/led_translate.v
// # of Modules	: 1
// Design Name	: led
// Xilinx        : /home/yzy/core/ise/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module led (
  clk, reset, led_out
);
  input clk;
  input reset;
  output [3 : 0] led_out;
  wire \Mcount_counter_cy<10>_rt_5 ;
  wire \Mcount_counter_cy<11>_rt_7 ;
  wire \Mcount_counter_cy<12>_rt_9 ;
  wire \Mcount_counter_cy<13>_rt_11 ;
  wire \Mcount_counter_cy<14>_rt_13 ;
  wire \Mcount_counter_cy<15>_rt_15 ;
  wire \Mcount_counter_cy<16>_rt_17 ;
  wire \Mcount_counter_cy<17>_rt_19 ;
  wire \Mcount_counter_cy<18>_rt_21 ;
  wire \Mcount_counter_cy<19>_rt_23 ;
  wire \Mcount_counter_cy<1>_rt_25 ;
  wire \Mcount_counter_cy<20>_rt_27 ;
  wire \Mcount_counter_cy<21>_rt_29 ;
  wire \Mcount_counter_cy<22>_rt_31 ;
  wire \Mcount_counter_cy<23>_rt_33 ;
  wire \Mcount_counter_cy<24>_rt_35 ;
  wire \Mcount_counter_cy<25>_rt_37 ;
  wire \Mcount_counter_cy<2>_rt_39 ;
  wire \Mcount_counter_cy<3>_rt_41 ;
  wire \Mcount_counter_cy<4>_rt_43 ;
  wire \Mcount_counter_cy<5>_rt_45 ;
  wire \Mcount_counter_cy<6>_rt_47 ;
  wire \Mcount_counter_cy<7>_rt_49 ;
  wire \Mcount_counter_cy<8>_rt_51 ;
  wire \Mcount_counter_cy<9>_rt_53 ;
  wire \Mcount_counter_xor<26>_rt_55 ;
  wire N0;
  wire N1;
  wire clk_BUFGP;
  wire reset_IBUF_119;
  wire \clk_BUFGP/IBUFG_2 ;
  wire VCC;
  wire GND;
  wire [25 : 0] Mcount_counter_cy;
  wire [0 : 0] Mcount_counter_lut;
  wire [26 : 0] Result;
  wire [26 : 0] counter;
  X_ZERO   XST_GND (
    .O(N0)
  );
  X_ONE   XST_VCC (
    .O(N1)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_0 (
    .CLK(clk_BUFGP),
    .I(Result[0]),
    .SRST(reset_IBUF_119),
    .O(counter[0]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_1 (
    .CLK(clk_BUFGP),
    .I(Result[1]),
    .SRST(reset_IBUF_119),
    .O(counter[1]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_2 (
    .CLK(clk_BUFGP),
    .I(Result[2]),
    .SRST(reset_IBUF_119),
    .O(counter[2]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_3 (
    .CLK(clk_BUFGP),
    .I(Result[3]),
    .SRST(reset_IBUF_119),
    .O(counter[3]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_4 (
    .CLK(clk_BUFGP),
    .I(Result[4]),
    .SRST(reset_IBUF_119),
    .O(counter[4]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_5 (
    .CLK(clk_BUFGP),
    .I(Result[5]),
    .SRST(reset_IBUF_119),
    .O(counter[5]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_6 (
    .CLK(clk_BUFGP),
    .I(Result[6]),
    .SRST(reset_IBUF_119),
    .O(counter[6]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_7 (
    .CLK(clk_BUFGP),
    .I(Result[7]),
    .SRST(reset_IBUF_119),
    .O(counter[7]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_8 (
    .CLK(clk_BUFGP),
    .I(Result[8]),
    .SRST(reset_IBUF_119),
    .O(counter[8]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_9 (
    .CLK(clk_BUFGP),
    .I(Result[9]),
    .SRST(reset_IBUF_119),
    .O(counter[9]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_10 (
    .CLK(clk_BUFGP),
    .I(Result[10]),
    .SRST(reset_IBUF_119),
    .O(counter[10]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_11 (
    .CLK(clk_BUFGP),
    .I(Result[11]),
    .SRST(reset_IBUF_119),
    .O(counter[11]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_12 (
    .CLK(clk_BUFGP),
    .I(Result[12]),
    .SRST(reset_IBUF_119),
    .O(counter[12]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_13 (
    .CLK(clk_BUFGP),
    .I(Result[13]),
    .SRST(reset_IBUF_119),
    .O(counter[13]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_14 (
    .CLK(clk_BUFGP),
    .I(Result[14]),
    .SRST(reset_IBUF_119),
    .O(counter[14]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_15 (
    .CLK(clk_BUFGP),
    .I(Result[15]),
    .SRST(reset_IBUF_119),
    .O(counter[15]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_16 (
    .CLK(clk_BUFGP),
    .I(Result[16]),
    .SRST(reset_IBUF_119),
    .O(counter[16]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_17 (
    .CLK(clk_BUFGP),
    .I(Result[17]),
    .SRST(reset_IBUF_119),
    .O(counter[17]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_18 (
    .CLK(clk_BUFGP),
    .I(Result[18]),
    .SRST(reset_IBUF_119),
    .O(counter[18]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_19 (
    .CLK(clk_BUFGP),
    .I(Result[19]),
    .SRST(reset_IBUF_119),
    .O(counter[19]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_20 (
    .CLK(clk_BUFGP),
    .I(Result[20]),
    .SRST(reset_IBUF_119),
    .O(counter[20]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_21 (
    .CLK(clk_BUFGP),
    .I(Result[21]),
    .SRST(reset_IBUF_119),
    .O(counter[21]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_22 (
    .CLK(clk_BUFGP),
    .I(Result[22]),
    .SRST(reset_IBUF_119),
    .O(counter[22]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_23 (
    .CLK(clk_BUFGP),
    .I(Result[23]),
    .SRST(reset_IBUF_119),
    .O(counter[23]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_24 (
    .CLK(clk_BUFGP),
    .I(Result[24]),
    .SRST(reset_IBUF_119),
    .O(counter[24]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_25 (
    .CLK(clk_BUFGP),
    .I(Result[25]),
    .SRST(reset_IBUF_119),
    .O(counter[25]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  counter_26 (
    .CLK(clk_BUFGP),
    .I(Result[26]),
    .SRST(reset_IBUF_119),
    .O(counter[26]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_MUX2   \Mcount_counter_cy<0>  (
    .IB(N0),
    .IA(N1),
    .SEL(Mcount_counter_lut[0]),
    .O(Mcount_counter_cy[0])
  );
  X_XOR2   \Mcount_counter_xor<0>  (
    .I0(N0),
    .I1(Mcount_counter_lut[0]),
    .O(Result[0])
  );
  X_MUX2   \Mcount_counter_cy<1>  (
    .IB(Mcount_counter_cy[0]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<1>_rt_25 ),
    .O(Mcount_counter_cy[1])
  );
  X_XOR2   \Mcount_counter_xor<1>  (
    .I0(Mcount_counter_cy[0]),
    .I1(\Mcount_counter_cy<1>_rt_25 ),
    .O(Result[1])
  );
  X_MUX2   \Mcount_counter_cy<2>  (
    .IB(Mcount_counter_cy[1]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<2>_rt_39 ),
    .O(Mcount_counter_cy[2])
  );
  X_XOR2   \Mcount_counter_xor<2>  (
    .I0(Mcount_counter_cy[1]),
    .I1(\Mcount_counter_cy<2>_rt_39 ),
    .O(Result[2])
  );
  X_MUX2   \Mcount_counter_cy<3>  (
    .IB(Mcount_counter_cy[2]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<3>_rt_41 ),
    .O(Mcount_counter_cy[3])
  );
  X_XOR2   \Mcount_counter_xor<3>  (
    .I0(Mcount_counter_cy[2]),
    .I1(\Mcount_counter_cy<3>_rt_41 ),
    .O(Result[3])
  );
  X_MUX2   \Mcount_counter_cy<4>  (
    .IB(Mcount_counter_cy[3]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<4>_rt_43 ),
    .O(Mcount_counter_cy[4])
  );
  X_XOR2   \Mcount_counter_xor<4>  (
    .I0(Mcount_counter_cy[3]),
    .I1(\Mcount_counter_cy<4>_rt_43 ),
    .O(Result[4])
  );
  X_MUX2   \Mcount_counter_cy<5>  (
    .IB(Mcount_counter_cy[4]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<5>_rt_45 ),
    .O(Mcount_counter_cy[5])
  );
  X_XOR2   \Mcount_counter_xor<5>  (
    .I0(Mcount_counter_cy[4]),
    .I1(\Mcount_counter_cy<5>_rt_45 ),
    .O(Result[5])
  );
  X_MUX2   \Mcount_counter_cy<6>  (
    .IB(Mcount_counter_cy[5]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<6>_rt_47 ),
    .O(Mcount_counter_cy[6])
  );
  X_XOR2   \Mcount_counter_xor<6>  (
    .I0(Mcount_counter_cy[5]),
    .I1(\Mcount_counter_cy<6>_rt_47 ),
    .O(Result[6])
  );
  X_MUX2   \Mcount_counter_cy<7>  (
    .IB(Mcount_counter_cy[6]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<7>_rt_49 ),
    .O(Mcount_counter_cy[7])
  );
  X_XOR2   \Mcount_counter_xor<7>  (
    .I0(Mcount_counter_cy[6]),
    .I1(\Mcount_counter_cy<7>_rt_49 ),
    .O(Result[7])
  );
  X_MUX2   \Mcount_counter_cy<8>  (
    .IB(Mcount_counter_cy[7]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<8>_rt_51 ),
    .O(Mcount_counter_cy[8])
  );
  X_XOR2   \Mcount_counter_xor<8>  (
    .I0(Mcount_counter_cy[7]),
    .I1(\Mcount_counter_cy<8>_rt_51 ),
    .O(Result[8])
  );
  X_MUX2   \Mcount_counter_cy<9>  (
    .IB(Mcount_counter_cy[8]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<9>_rt_53 ),
    .O(Mcount_counter_cy[9])
  );
  X_XOR2   \Mcount_counter_xor<9>  (
    .I0(Mcount_counter_cy[8]),
    .I1(\Mcount_counter_cy<9>_rt_53 ),
    .O(Result[9])
  );
  X_MUX2   \Mcount_counter_cy<10>  (
    .IB(Mcount_counter_cy[9]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<10>_rt_5 ),
    .O(Mcount_counter_cy[10])
  );
  X_XOR2   \Mcount_counter_xor<10>  (
    .I0(Mcount_counter_cy[9]),
    .I1(\Mcount_counter_cy<10>_rt_5 ),
    .O(Result[10])
  );
  X_MUX2   \Mcount_counter_cy<11>  (
    .IB(Mcount_counter_cy[10]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<11>_rt_7 ),
    .O(Mcount_counter_cy[11])
  );
  X_XOR2   \Mcount_counter_xor<11>  (
    .I0(Mcount_counter_cy[10]),
    .I1(\Mcount_counter_cy<11>_rt_7 ),
    .O(Result[11])
  );
  X_MUX2   \Mcount_counter_cy<12>  (
    .IB(Mcount_counter_cy[11]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<12>_rt_9 ),
    .O(Mcount_counter_cy[12])
  );
  X_XOR2   \Mcount_counter_xor<12>  (
    .I0(Mcount_counter_cy[11]),
    .I1(\Mcount_counter_cy<12>_rt_9 ),
    .O(Result[12])
  );
  X_MUX2   \Mcount_counter_cy<13>  (
    .IB(Mcount_counter_cy[12]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<13>_rt_11 ),
    .O(Mcount_counter_cy[13])
  );
  X_XOR2   \Mcount_counter_xor<13>  (
    .I0(Mcount_counter_cy[12]),
    .I1(\Mcount_counter_cy<13>_rt_11 ),
    .O(Result[13])
  );
  X_MUX2   \Mcount_counter_cy<14>  (
    .IB(Mcount_counter_cy[13]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<14>_rt_13 ),
    .O(Mcount_counter_cy[14])
  );
  X_XOR2   \Mcount_counter_xor<14>  (
    .I0(Mcount_counter_cy[13]),
    .I1(\Mcount_counter_cy<14>_rt_13 ),
    .O(Result[14])
  );
  X_MUX2   \Mcount_counter_cy<15>  (
    .IB(Mcount_counter_cy[14]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<15>_rt_15 ),
    .O(Mcount_counter_cy[15])
  );
  X_XOR2   \Mcount_counter_xor<15>  (
    .I0(Mcount_counter_cy[14]),
    .I1(\Mcount_counter_cy<15>_rt_15 ),
    .O(Result[15])
  );
  X_MUX2   \Mcount_counter_cy<16>  (
    .IB(Mcount_counter_cy[15]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<16>_rt_17 ),
    .O(Mcount_counter_cy[16])
  );
  X_XOR2   \Mcount_counter_xor<16>  (
    .I0(Mcount_counter_cy[15]),
    .I1(\Mcount_counter_cy<16>_rt_17 ),
    .O(Result[16])
  );
  X_MUX2   \Mcount_counter_cy<17>  (
    .IB(Mcount_counter_cy[16]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<17>_rt_19 ),
    .O(Mcount_counter_cy[17])
  );
  X_XOR2   \Mcount_counter_xor<17>  (
    .I0(Mcount_counter_cy[16]),
    .I1(\Mcount_counter_cy<17>_rt_19 ),
    .O(Result[17])
  );
  X_MUX2   \Mcount_counter_cy<18>  (
    .IB(Mcount_counter_cy[17]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<18>_rt_21 ),
    .O(Mcount_counter_cy[18])
  );
  X_XOR2   \Mcount_counter_xor<18>  (
    .I0(Mcount_counter_cy[17]),
    .I1(\Mcount_counter_cy<18>_rt_21 ),
    .O(Result[18])
  );
  X_MUX2   \Mcount_counter_cy<19>  (
    .IB(Mcount_counter_cy[18]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<19>_rt_23 ),
    .O(Mcount_counter_cy[19])
  );
  X_XOR2   \Mcount_counter_xor<19>  (
    .I0(Mcount_counter_cy[18]),
    .I1(\Mcount_counter_cy<19>_rt_23 ),
    .O(Result[19])
  );
  X_MUX2   \Mcount_counter_cy<20>  (
    .IB(Mcount_counter_cy[19]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<20>_rt_27 ),
    .O(Mcount_counter_cy[20])
  );
  X_XOR2   \Mcount_counter_xor<20>  (
    .I0(Mcount_counter_cy[19]),
    .I1(\Mcount_counter_cy<20>_rt_27 ),
    .O(Result[20])
  );
  X_MUX2   \Mcount_counter_cy<21>  (
    .IB(Mcount_counter_cy[20]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<21>_rt_29 ),
    .O(Mcount_counter_cy[21])
  );
  X_XOR2   \Mcount_counter_xor<21>  (
    .I0(Mcount_counter_cy[20]),
    .I1(\Mcount_counter_cy<21>_rt_29 ),
    .O(Result[21])
  );
  X_MUX2   \Mcount_counter_cy<22>  (
    .IB(Mcount_counter_cy[21]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<22>_rt_31 ),
    .O(Mcount_counter_cy[22])
  );
  X_XOR2   \Mcount_counter_xor<22>  (
    .I0(Mcount_counter_cy[21]),
    .I1(\Mcount_counter_cy<22>_rt_31 ),
    .O(Result[22])
  );
  X_MUX2   \Mcount_counter_cy<23>  (
    .IB(Mcount_counter_cy[22]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<23>_rt_33 ),
    .O(Mcount_counter_cy[23])
  );
  X_XOR2   \Mcount_counter_xor<23>  (
    .I0(Mcount_counter_cy[22]),
    .I1(\Mcount_counter_cy<23>_rt_33 ),
    .O(Result[23])
  );
  X_MUX2   \Mcount_counter_cy<24>  (
    .IB(Mcount_counter_cy[23]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<24>_rt_35 ),
    .O(Mcount_counter_cy[24])
  );
  X_XOR2   \Mcount_counter_xor<24>  (
    .I0(Mcount_counter_cy[23]),
    .I1(\Mcount_counter_cy<24>_rt_35 ),
    .O(Result[24])
  );
  X_MUX2   \Mcount_counter_cy<25>  (
    .IB(Mcount_counter_cy[24]),
    .IA(N0),
    .SEL(\Mcount_counter_cy<25>_rt_37 ),
    .O(Mcount_counter_cy[25])
  );
  X_XOR2   \Mcount_counter_xor<25>  (
    .I0(Mcount_counter_cy[24]),
    .I1(\Mcount_counter_cy<25>_rt_37 ),
    .O(Result[25])
  );
  X_XOR2   \Mcount_counter_xor<26>  (
    .I0(Mcount_counter_cy[25]),
    .I1(\Mcount_counter_xor<26>_rt_55 ),
    .O(Result[26])
  );
  X_BUF   reset_IBUF (
    .I(reset),
    .O(reset_IBUF_119)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<1>_rt  (
    .ADR0(counter[1]),
    .O(\Mcount_counter_cy<1>_rt_25 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<2>_rt  (
    .ADR0(counter[2]),
    .O(\Mcount_counter_cy<2>_rt_39 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<3>_rt  (
    .ADR0(counter[3]),
    .O(\Mcount_counter_cy<3>_rt_41 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<4>_rt  (
    .ADR0(counter[4]),
    .O(\Mcount_counter_cy<4>_rt_43 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<5>_rt  (
    .ADR0(counter[5]),
    .O(\Mcount_counter_cy<5>_rt_45 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<6>_rt  (
    .ADR0(counter[6]),
    .O(\Mcount_counter_cy<6>_rt_47 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<7>_rt  (
    .ADR0(counter[7]),
    .O(\Mcount_counter_cy<7>_rt_49 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<8>_rt  (
    .ADR0(counter[8]),
    .O(\Mcount_counter_cy<8>_rt_51 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<9>_rt  (
    .ADR0(counter[9]),
    .O(\Mcount_counter_cy<9>_rt_53 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<10>_rt  (
    .ADR0(counter[10]),
    .O(\Mcount_counter_cy<10>_rt_5 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<11>_rt  (
    .ADR0(counter[11]),
    .O(\Mcount_counter_cy<11>_rt_7 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<12>_rt  (
    .ADR0(counter[12]),
    .O(\Mcount_counter_cy<12>_rt_9 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<13>_rt  (
    .ADR0(counter[13]),
    .O(\Mcount_counter_cy<13>_rt_11 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<14>_rt  (
    .ADR0(counter[14]),
    .O(\Mcount_counter_cy<14>_rt_13 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<15>_rt  (
    .ADR0(counter[15]),
    .O(\Mcount_counter_cy<15>_rt_15 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<16>_rt  (
    .ADR0(counter[16]),
    .O(\Mcount_counter_cy<16>_rt_17 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<17>_rt  (
    .ADR0(counter[17]),
    .O(\Mcount_counter_cy<17>_rt_19 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<18>_rt  (
    .ADR0(counter[18]),
    .O(\Mcount_counter_cy<18>_rt_21 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<19>_rt  (
    .ADR0(counter[19]),
    .O(\Mcount_counter_cy<19>_rt_23 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<20>_rt  (
    .ADR0(counter[20]),
    .O(\Mcount_counter_cy<20>_rt_27 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<21>_rt  (
    .ADR0(counter[21]),
    .O(\Mcount_counter_cy<21>_rt_29 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<22>_rt  (
    .ADR0(counter[22]),
    .O(\Mcount_counter_cy<22>_rt_31 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<23>_rt  (
    .ADR0(counter[23]),
    .O(\Mcount_counter_cy<23>_rt_33 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<24>_rt  (
    .ADR0(counter[24]),
    .O(\Mcount_counter_cy<24>_rt_35 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_cy<25>_rt  (
    .ADR0(counter[25]),
    .O(\Mcount_counter_cy<25>_rt_37 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_counter_xor<26>_rt  (
    .ADR0(counter[26]),
    .O(\Mcount_counter_xor<26>_rt_55 ),
    .ADR1(GND)
  );
  X_INV   \Mcount_counter_lut<0>_INV_0  (
    .I(counter[0]),
    .O(Mcount_counter_lut[0])
  );
  X_IPAD   clk_118 (
    .PAD(clk)
  );
  X_OPAD   \led_out<0>  (
    .PAD(led_out[0])
  );
  X_OPAD   \led_out<1>  (
    .PAD(led_out[1])
  );
  X_OPAD   \led_out<2>  (
    .PAD(led_out[2])
  );
  X_OPAD   \led_out<3>  (
    .PAD(led_out[3])
  );
  X_IPAD   reset_123 (
    .PAD(reset)
  );
  X_CKBUF   \clk_BUFGP/BUFG  (
    .I(\clk_BUFGP/IBUFG_2 ),
    .O(clk_BUFGP)
  );
  X_CKBUF   \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk_BUFGP/IBUFG_2 )
  );
  X_OBUF   led_out_0_OBUF (
    .I(counter[23]),
    .O(led_out[0])
  );
  X_OBUF   led_out_1_OBUF (
    .I(counter[24]),
    .O(led_out[1])
  );
  X_OBUF   led_out_2_OBUF (
    .I(counter[25]),
    .O(led_out[2])
  );
  X_OBUF   led_out_3_OBUF (
    .I(counter[26]),
    .O(led_out[3])
  );
  X_ONE   NlwBlock_led_VCC (
    .O(VCC)
  );
  X_ZERO   NlwBlock_led_GND (
    .O(GND)
  );
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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

