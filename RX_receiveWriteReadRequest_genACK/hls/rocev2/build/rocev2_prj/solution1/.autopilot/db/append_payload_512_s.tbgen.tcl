set moduleName append_payload_512_s
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {append_payload<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_packetInfoFifo_V int 3 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2payFifo_V_dat int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2payFifo_V_kee int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2payFifo_V_las int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2shiftFifo_V_d int 512 regular {fifo 1 volatile } {global 1}  }
	{ tx_exh2shiftFifo_V_k int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_exh2shiftFifo_V_l int 1 regular {fifo 1 volatile } {global 1}  }
	{ tx_aethShift2payFifo_3 int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_aethShift2payFifo_5 int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_aethShift2payFifo_6 int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_rethShift2payFifo_3 int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_rethShift2payFifo_5 int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_rethShift2payFifo_6 int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_rawPayFifo_V_data int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_rawPayFifo_V_keep int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_rawPayFifo_V_last int 1 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_packetInfoFifo_V", "interface" : "fifo", "bitwidth" : 3, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo_V_dat", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo_V_kee", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo_V_las", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2shiftFifo_V_d", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2shiftFifo_V_k", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2shiftFifo_V_l", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_aethShift2payFifo_3", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_aethShift2payFifo_5", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_aethShift2payFifo_6", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethShift2payFifo_3", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethShift2payFifo_5", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethShift2payFifo_6", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo_V_data", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo_V_keep", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo_V_last", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 55
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_rawPayFifo_V_data_dout sc_in sc_lv 512 signal 13 } 
	{ tx_rawPayFifo_V_data_empty_n sc_in sc_logic 1 signal 13 } 
	{ tx_rawPayFifo_V_data_read sc_out sc_logic 1 signal 13 } 
	{ tx_rawPayFifo_V_keep_dout sc_in sc_lv 64 signal 14 } 
	{ tx_rawPayFifo_V_keep_empty_n sc_in sc_logic 1 signal 14 } 
	{ tx_rawPayFifo_V_keep_read sc_out sc_logic 1 signal 14 } 
	{ tx_rawPayFifo_V_last_dout sc_in sc_lv 1 signal 15 } 
	{ tx_rawPayFifo_V_last_empty_n sc_in sc_logic 1 signal 15 } 
	{ tx_rawPayFifo_V_last_read sc_out sc_logic 1 signal 15 } 
	{ tx_rethShift2payFifo_3_dout sc_in sc_lv 512 signal 10 } 
	{ tx_rethShift2payFifo_3_empty_n sc_in sc_logic 1 signal 10 } 
	{ tx_rethShift2payFifo_3_read sc_out sc_logic 1 signal 10 } 
	{ tx_rethShift2payFifo_5_dout sc_in sc_lv 64 signal 11 } 
	{ tx_rethShift2payFifo_5_empty_n sc_in sc_logic 1 signal 11 } 
	{ tx_rethShift2payFifo_5_read sc_out sc_logic 1 signal 11 } 
	{ tx_rethShift2payFifo_6_dout sc_in sc_lv 1 signal 12 } 
	{ tx_rethShift2payFifo_6_empty_n sc_in sc_logic 1 signal 12 } 
	{ tx_rethShift2payFifo_6_read sc_out sc_logic 1 signal 12 } 
	{ tx_aethShift2payFifo_3_dout sc_in sc_lv 512 signal 7 } 
	{ tx_aethShift2payFifo_3_empty_n sc_in sc_logic 1 signal 7 } 
	{ tx_aethShift2payFifo_3_read sc_out sc_logic 1 signal 7 } 
	{ tx_aethShift2payFifo_5_dout sc_in sc_lv 64 signal 8 } 
	{ tx_aethShift2payFifo_5_empty_n sc_in sc_logic 1 signal 8 } 
	{ tx_aethShift2payFifo_5_read sc_out sc_logic 1 signal 8 } 
	{ tx_aethShift2payFifo_6_dout sc_in sc_lv 1 signal 9 } 
	{ tx_aethShift2payFifo_6_empty_n sc_in sc_logic 1 signal 9 } 
	{ tx_aethShift2payFifo_6_read sc_out sc_logic 1 signal 9 } 
	{ tx_exh2payFifo_V_dat_dout sc_in sc_lv 512 signal 1 } 
	{ tx_exh2payFifo_V_dat_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_exh2payFifo_V_dat_read sc_out sc_logic 1 signal 1 } 
	{ tx_exh2payFifo_V_kee_dout sc_in sc_lv 64 signal 2 } 
	{ tx_exh2payFifo_V_kee_empty_n sc_in sc_logic 1 signal 2 } 
	{ tx_exh2payFifo_V_kee_read sc_out sc_logic 1 signal 2 } 
	{ tx_exh2payFifo_V_las_dout sc_in sc_lv 1 signal 3 } 
	{ tx_exh2payFifo_V_las_empty_n sc_in sc_logic 1 signal 3 } 
	{ tx_exh2payFifo_V_las_read sc_out sc_logic 1 signal 3 } 
	{ tx_packetInfoFifo_V_dout sc_in sc_lv 3 signal 0 } 
	{ tx_packetInfoFifo_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_packetInfoFifo_V_read sc_out sc_logic 1 signal 0 } 
	{ tx_exh2shiftFifo_V_d_din sc_out sc_lv 512 signal 4 } 
	{ tx_exh2shiftFifo_V_d_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_exh2shiftFifo_V_d_write sc_out sc_logic 1 signal 4 } 
	{ tx_exh2shiftFifo_V_k_din sc_out sc_lv 64 signal 5 } 
	{ tx_exh2shiftFifo_V_k_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_exh2shiftFifo_V_k_write sc_out sc_logic 1 signal 5 } 
	{ tx_exh2shiftFifo_V_l_din sc_out sc_lv 1 signal 6 } 
	{ tx_exh2shiftFifo_V_l_full_n sc_in sc_logic 1 signal 6 } 
	{ tx_exh2shiftFifo_V_l_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_rawPayFifo_V_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_data", "role": "dout" }} , 
 	{ "name": "tx_rawPayFifo_V_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_data", "role": "empty_n" }} , 
 	{ "name": "tx_rawPayFifo_V_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_data", "role": "read" }} , 
 	{ "name": "tx_rawPayFifo_V_keep_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_keep", "role": "dout" }} , 
 	{ "name": "tx_rawPayFifo_V_keep_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_keep", "role": "empty_n" }} , 
 	{ "name": "tx_rawPayFifo_V_keep_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_keep", "role": "read" }} , 
 	{ "name": "tx_rawPayFifo_V_last_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_last", "role": "dout" }} , 
 	{ "name": "tx_rawPayFifo_V_last_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_last", "role": "empty_n" }} , 
 	{ "name": "tx_rawPayFifo_V_last_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_last", "role": "read" }} , 
 	{ "name": "tx_rethShift2payFifo_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_3", "role": "dout" }} , 
 	{ "name": "tx_rethShift2payFifo_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_3", "role": "empty_n" }} , 
 	{ "name": "tx_rethShift2payFifo_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_3", "role": "read" }} , 
 	{ "name": "tx_rethShift2payFifo_5_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_5", "role": "dout" }} , 
 	{ "name": "tx_rethShift2payFifo_5_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_5", "role": "empty_n" }} , 
 	{ "name": "tx_rethShift2payFifo_5_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_5", "role": "read" }} , 
 	{ "name": "tx_rethShift2payFifo_6_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_6", "role": "dout" }} , 
 	{ "name": "tx_rethShift2payFifo_6_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_6", "role": "empty_n" }} , 
 	{ "name": "tx_rethShift2payFifo_6_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethShift2payFifo_6", "role": "read" }} , 
 	{ "name": "tx_aethShift2payFifo_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_3", "role": "dout" }} , 
 	{ "name": "tx_aethShift2payFifo_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_3", "role": "empty_n" }} , 
 	{ "name": "tx_aethShift2payFifo_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_3", "role": "read" }} , 
 	{ "name": "tx_aethShift2payFifo_5_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_5", "role": "dout" }} , 
 	{ "name": "tx_aethShift2payFifo_5_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_5", "role": "empty_n" }} , 
 	{ "name": "tx_aethShift2payFifo_5_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_5", "role": "read" }} , 
 	{ "name": "tx_aethShift2payFifo_6_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_6", "role": "dout" }} , 
 	{ "name": "tx_aethShift2payFifo_6_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_6", "role": "empty_n" }} , 
 	{ "name": "tx_aethShift2payFifo_6_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_aethShift2payFifo_6", "role": "read" }} , 
 	{ "name": "tx_exh2payFifo_V_dat_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_dat", "role": "dout" }} , 
 	{ "name": "tx_exh2payFifo_V_dat_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_dat", "role": "empty_n" }} , 
 	{ "name": "tx_exh2payFifo_V_dat_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_dat", "role": "read" }} , 
 	{ "name": "tx_exh2payFifo_V_kee_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_kee", "role": "dout" }} , 
 	{ "name": "tx_exh2payFifo_V_kee_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_kee", "role": "empty_n" }} , 
 	{ "name": "tx_exh2payFifo_V_kee_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_kee", "role": "read" }} , 
 	{ "name": "tx_exh2payFifo_V_las_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_las", "role": "dout" }} , 
 	{ "name": "tx_exh2payFifo_V_las_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_las", "role": "empty_n" }} , 
 	{ "name": "tx_exh2payFifo_V_las_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_las", "role": "read" }} , 
 	{ "name": "tx_packetInfoFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_packetInfoFifo_V", "role": "dout" }} , 
 	{ "name": "tx_packetInfoFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo_V", "role": "empty_n" }} , 
 	{ "name": "tx_packetInfoFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo_V", "role": "read" }} , 
 	{ "name": "tx_exh2shiftFifo_V_d_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_d", "role": "din" }} , 
 	{ "name": "tx_exh2shiftFifo_V_d_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_d", "role": "full_n" }} , 
 	{ "name": "tx_exh2shiftFifo_V_d_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_d", "role": "write" }} , 
 	{ "name": "tx_exh2shiftFifo_V_k_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_k", "role": "din" }} , 
 	{ "name": "tx_exh2shiftFifo_V_k_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_k", "role": "full_n" }} , 
 	{ "name": "tx_exh2shiftFifo_V_k_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_k", "role": "write" }} , 
 	{ "name": "tx_exh2shiftFifo_V_l_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_l", "role": "din" }} , 
 	{ "name": "tx_exh2shiftFifo_V_l_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_l", "role": "full_n" }} , 
 	{ "name": "tx_exh2shiftFifo_V_l_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2shiftFifo_V_l", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "append_payload_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "state_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "firstPayload", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_isAETH", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_hasPayload", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_packetInfoFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_packetInfoFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo_V_dat", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_V_dat_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo_V_kee", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_V_kee_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo_V_las", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_V_las_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2shiftFifo_V_d", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2shiftFifo_V_d_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2shiftFifo_V_k", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2shiftFifo_V_k_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2shiftFifo_V_l", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2shiftFifo_V_l_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_aethShift2payFifo_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_aethShift2payFifo_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_aethShift2payFifo_5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_aethShift2payFifo_5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_aethShift2payFifo_6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_aethShift2payFifo_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethShift2payFifo_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethShift2payFifo_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethShift2payFifo_5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethShift2payFifo_5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethShift2payFifo_6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethShift2payFifo_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo_V_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo_V_keep", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_V_keep_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo_V_last", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_V_last_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	append_payload_512_s {
		state_6 {Type IO LastRead -1 FirstWrite -1}
		firstPayload {Type IO LastRead -1 FirstWrite -1}
		info_isAETH {Type IO LastRead -1 FirstWrite -1}
		info_hasPayload {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_16 {Type IO LastRead -1 FirstWrite -1}
		tx_packetInfoFifo_V {Type I LastRead 0 FirstWrite -1}
		tx_exh2payFifo_V_dat {Type I LastRead 0 FirstWrite -1}
		tx_exh2payFifo_V_kee {Type I LastRead 0 FirstWrite -1}
		tx_exh2payFifo_V_las {Type I LastRead 0 FirstWrite -1}
		tx_exh2shiftFifo_V_d {Type O LastRead -1 FirstWrite 1}
		tx_exh2shiftFifo_V_k {Type O LastRead -1 FirstWrite 1}
		tx_exh2shiftFifo_V_l {Type O LastRead -1 FirstWrite 1}
		tx_aethShift2payFifo_3 {Type I LastRead 0 FirstWrite -1}
		tx_aethShift2payFifo_5 {Type I LastRead 0 FirstWrite -1}
		tx_aethShift2payFifo_6 {Type I LastRead 0 FirstWrite -1}
		tx_rethShift2payFifo_3 {Type I LastRead 0 FirstWrite -1}
		tx_rethShift2payFifo_5 {Type I LastRead 0 FirstWrite -1}
		tx_rethShift2payFifo_6 {Type I LastRead 0 FirstWrite -1}
		tx_rawPayFifo_V_data {Type I LastRead 0 FirstWrite -1}
		tx_rawPayFifo_V_keep {Type I LastRead 0 FirstWrite -1}
		tx_rawPayFifo_V_last {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_packetInfoFifo_V { ap_fifo {  { tx_packetInfoFifo_V_dout fifo_data 0 3 }  { tx_packetInfoFifo_V_empty_n fifo_status 0 1 }  { tx_packetInfoFifo_V_read fifo_update 1 1 } } }
	tx_exh2payFifo_V_dat { ap_fifo {  { tx_exh2payFifo_V_dat_dout fifo_data 0 512 }  { tx_exh2payFifo_V_dat_empty_n fifo_status 0 1 }  { tx_exh2payFifo_V_dat_read fifo_update 1 1 } } }
	tx_exh2payFifo_V_kee { ap_fifo {  { tx_exh2payFifo_V_kee_dout fifo_data 0 64 }  { tx_exh2payFifo_V_kee_empty_n fifo_status 0 1 }  { tx_exh2payFifo_V_kee_read fifo_update 1 1 } } }
	tx_exh2payFifo_V_las { ap_fifo {  { tx_exh2payFifo_V_las_dout fifo_data 0 1 }  { tx_exh2payFifo_V_las_empty_n fifo_status 0 1 }  { tx_exh2payFifo_V_las_read fifo_update 1 1 } } }
	tx_exh2shiftFifo_V_d { ap_fifo {  { tx_exh2shiftFifo_V_d_din fifo_data 1 512 }  { tx_exh2shiftFifo_V_d_full_n fifo_status 0 1 }  { tx_exh2shiftFifo_V_d_write fifo_update 1 1 } } }
	tx_exh2shiftFifo_V_k { ap_fifo {  { tx_exh2shiftFifo_V_k_din fifo_data 1 64 }  { tx_exh2shiftFifo_V_k_full_n fifo_status 0 1 }  { tx_exh2shiftFifo_V_k_write fifo_update 1 1 } } }
	tx_exh2shiftFifo_V_l { ap_fifo {  { tx_exh2shiftFifo_V_l_din fifo_data 1 1 }  { tx_exh2shiftFifo_V_l_full_n fifo_status 0 1 }  { tx_exh2shiftFifo_V_l_write fifo_update 1 1 } } }
	tx_aethShift2payFifo_3 { ap_fifo {  { tx_aethShift2payFifo_3_dout fifo_data 0 512 }  { tx_aethShift2payFifo_3_empty_n fifo_status 0 1 }  { tx_aethShift2payFifo_3_read fifo_update 1 1 } } }
	tx_aethShift2payFifo_5 { ap_fifo {  { tx_aethShift2payFifo_5_dout fifo_data 0 64 }  { tx_aethShift2payFifo_5_empty_n fifo_status 0 1 }  { tx_aethShift2payFifo_5_read fifo_update 1 1 } } }
	tx_aethShift2payFifo_6 { ap_fifo {  { tx_aethShift2payFifo_6_dout fifo_data 0 1 }  { tx_aethShift2payFifo_6_empty_n fifo_status 0 1 }  { tx_aethShift2payFifo_6_read fifo_update 1 1 } } }
	tx_rethShift2payFifo_3 { ap_fifo {  { tx_rethShift2payFifo_3_dout fifo_data 0 512 }  { tx_rethShift2payFifo_3_empty_n fifo_status 0 1 }  { tx_rethShift2payFifo_3_read fifo_update 1 1 } } }
	tx_rethShift2payFifo_5 { ap_fifo {  { tx_rethShift2payFifo_5_dout fifo_data 0 64 }  { tx_rethShift2payFifo_5_empty_n fifo_status 0 1 }  { tx_rethShift2payFifo_5_read fifo_update 1 1 } } }
	tx_rethShift2payFifo_6 { ap_fifo {  { tx_rethShift2payFifo_6_dout fifo_data 0 1 }  { tx_rethShift2payFifo_6_empty_n fifo_status 0 1 }  { tx_rethShift2payFifo_6_read fifo_update 1 1 } } }
	tx_rawPayFifo_V_data { ap_fifo {  { tx_rawPayFifo_V_data_dout fifo_data 0 512 }  { tx_rawPayFifo_V_data_empty_n fifo_status 0 1 }  { tx_rawPayFifo_V_data_read fifo_update 1 1 } } }
	tx_rawPayFifo_V_keep { ap_fifo {  { tx_rawPayFifo_V_keep_dout fifo_data 0 64 }  { tx_rawPayFifo_V_keep_empty_n fifo_status 0 1 }  { tx_rawPayFifo_V_keep_read fifo_update 1 1 } } }
	tx_rawPayFifo_V_last { ap_fifo {  { tx_rawPayFifo_V_last_dout fifo_data 0 1 }  { tx_rawPayFifo_V_last_empty_n fifo_status 0 1 }  { tx_rawPayFifo_V_last_read fifo_update 1 1 } } }
}