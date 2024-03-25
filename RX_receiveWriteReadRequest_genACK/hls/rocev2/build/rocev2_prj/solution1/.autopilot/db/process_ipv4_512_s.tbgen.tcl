set moduleName process_ipv4_512_s
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
set C_modelName {process_ipv4<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_crc2ipFifo_V_data int 512 regular {fifo 0 volatile } {global 0}  }
	{ rx_crc2ipFifo_V_keep int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_crc2ipFifo_V_last int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_process2dropFifo_1_5 int 512 regular {fifo 1 volatile } {global 1}  }
	{ rx_process2dropFifo_2_4 int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_process2dropFifo_s_6 int 1 regular {fifo 1 volatile } {global 1}  }
	{ rx_process2dropLengt_1 int 4 regular {fifo 1 volatile } {global 1}  }
	{ rx_ip2udpMetaFifo_V_s int 32 regular {fifo 1 volatile } {global 1}  }
	{ rx_ip2udpMetaFifo_V_1 int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_crc2ipFifo_V_data", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_crc2ipFifo_V_keep", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_crc2ipFifo_V_last", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_process2dropFifo_1_5", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_process2dropFifo_2_4", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_process2dropFifo_s_6", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_process2dropLengt_1", "interface" : "fifo", "bitwidth" : 4, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ip2udpMetaFifo_V_s", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ip2udpMetaFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_crc2ipFifo_V_data_dout sc_in sc_lv 512 signal 0 } 
	{ rx_crc2ipFifo_V_data_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_crc2ipFifo_V_data_read sc_out sc_logic 1 signal 0 } 
	{ rx_crc2ipFifo_V_keep_dout sc_in sc_lv 64 signal 1 } 
	{ rx_crc2ipFifo_V_keep_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_crc2ipFifo_V_keep_read sc_out sc_logic 1 signal 1 } 
	{ rx_crc2ipFifo_V_last_dout sc_in sc_lv 1 signal 2 } 
	{ rx_crc2ipFifo_V_last_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_crc2ipFifo_V_last_read sc_out sc_logic 1 signal 2 } 
	{ rx_process2dropFifo_1_5_din sc_out sc_lv 512 signal 3 } 
	{ rx_process2dropFifo_1_5_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_process2dropFifo_1_5_write sc_out sc_logic 1 signal 3 } 
	{ rx_process2dropFifo_2_4_din sc_out sc_lv 64 signal 4 } 
	{ rx_process2dropFifo_2_4_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_process2dropFifo_2_4_write sc_out sc_logic 1 signal 4 } 
	{ rx_process2dropFifo_s_6_din sc_out sc_lv 1 signal 5 } 
	{ rx_process2dropFifo_s_6_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_process2dropFifo_s_6_write sc_out sc_logic 1 signal 5 } 
	{ rx_process2dropLengt_1_din sc_out sc_lv 4 signal 6 } 
	{ rx_process2dropLengt_1_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_process2dropLengt_1_write sc_out sc_logic 1 signal 6 } 
	{ rx_ip2udpMetaFifo_V_s_din sc_out sc_lv 32 signal 7 } 
	{ rx_ip2udpMetaFifo_V_s_full_n sc_in sc_logic 1 signal 7 } 
	{ rx_ip2udpMetaFifo_V_s_write sc_out sc_logic 1 signal 7 } 
	{ rx_ip2udpMetaFifo_V_1_din sc_out sc_lv 16 signal 8 } 
	{ rx_ip2udpMetaFifo_V_1_full_n sc_in sc_logic 1 signal 8 } 
	{ rx_ip2udpMetaFifo_V_1_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_crc2ipFifo_V_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_data", "role": "dout" }} , 
 	{ "name": "rx_crc2ipFifo_V_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_data", "role": "empty_n" }} , 
 	{ "name": "rx_crc2ipFifo_V_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_data", "role": "read" }} , 
 	{ "name": "rx_crc2ipFifo_V_keep_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_keep", "role": "dout" }} , 
 	{ "name": "rx_crc2ipFifo_V_keep_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_keep", "role": "empty_n" }} , 
 	{ "name": "rx_crc2ipFifo_V_keep_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_keep", "role": "read" }} , 
 	{ "name": "rx_crc2ipFifo_V_last_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_last", "role": "dout" }} , 
 	{ "name": "rx_crc2ipFifo_V_last_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_last", "role": "empty_n" }} , 
 	{ "name": "rx_crc2ipFifo_V_last_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_crc2ipFifo_V_last", "role": "read" }} , 
 	{ "name": "rx_process2dropFifo_1_5_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_process2dropFifo_1_5", "role": "din" }} , 
 	{ "name": "rx_process2dropFifo_1_5_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo_1_5", "role": "full_n" }} , 
 	{ "name": "rx_process2dropFifo_1_5_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo_1_5", "role": "write" }} , 
 	{ "name": "rx_process2dropFifo_2_4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_process2dropFifo_2_4", "role": "din" }} , 
 	{ "name": "rx_process2dropFifo_2_4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo_2_4", "role": "full_n" }} , 
 	{ "name": "rx_process2dropFifo_2_4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo_2_4", "role": "write" }} , 
 	{ "name": "rx_process2dropFifo_s_6_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo_s_6", "role": "din" }} , 
 	{ "name": "rx_process2dropFifo_s_6_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo_s_6", "role": "full_n" }} , 
 	{ "name": "rx_process2dropFifo_s_6_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropFifo_s_6", "role": "write" }} , 
 	{ "name": "rx_process2dropLengt_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rx_process2dropLengt_1", "role": "din" }} , 
 	{ "name": "rx_process2dropLengt_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropLengt_1", "role": "full_n" }} , 
 	{ "name": "rx_process2dropLengt_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_process2dropLengt_1", "role": "write" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_s", "role": "din" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_s", "role": "full_n" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_s", "role": "write" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_1", "role": "din" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_1", "role": "full_n" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_1", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "process_ipv4_512_s",
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
			{"Name" : "rx_crc2ipFifo_V_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_crc2ipFifo_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_crc2ipFifo_V_keep", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_crc2ipFifo_V_keep_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_crc2ipFifo_V_last", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_crc2ipFifo_V_last_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_header_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "metaWritten_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_process2dropFifo_1_5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropFifo_1_5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_process2dropFifo_2_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropFifo_2_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_process2dropFifo_s_6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropFifo_s_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_process2dropLengt_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_process2dropLengt_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ip2udpMetaFifo_V_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpMetaFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ip2udpMetaFifo_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpMetaFifo_V_1_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	process_ipv4_512_s {
		rx_crc2ipFifo_V_data {Type I LastRead 0 FirstWrite -1}
		rx_crc2ipFifo_V_keep {Type I LastRead 0 FirstWrite -1}
		rx_crc2ipFifo_V_last {Type I LastRead 0 FirstWrite -1}
		header_ready {Type IO LastRead -1 FirstWrite -1}
		header_idx_3 {Type IO LastRead -1 FirstWrite -1}
		header_header_V_6 {Type IO LastRead -1 FirstWrite -1}
		metaWritten_3 {Type IO LastRead -1 FirstWrite -1}
		rx_process2dropFifo_1_5 {Type O LastRead -1 FirstWrite 1}
		rx_process2dropFifo_2_4 {Type O LastRead -1 FirstWrite 1}
		rx_process2dropFifo_s_6 {Type O LastRead -1 FirstWrite 1}
		rx_process2dropLengt_1 {Type O LastRead -1 FirstWrite 1}
		rx_ip2udpMetaFifo_V_s {Type O LastRead -1 FirstWrite 1}
		rx_ip2udpMetaFifo_V_1 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_crc2ipFifo_V_data { ap_fifo {  { rx_crc2ipFifo_V_data_dout fifo_data 0 512 }  { rx_crc2ipFifo_V_data_empty_n fifo_status 0 1 }  { rx_crc2ipFifo_V_data_read fifo_update 1 1 } } }
	rx_crc2ipFifo_V_keep { ap_fifo {  { rx_crc2ipFifo_V_keep_dout fifo_data 0 64 }  { rx_crc2ipFifo_V_keep_empty_n fifo_status 0 1 }  { rx_crc2ipFifo_V_keep_read fifo_update 1 1 } } }
	rx_crc2ipFifo_V_last { ap_fifo {  { rx_crc2ipFifo_V_last_dout fifo_data 0 1 }  { rx_crc2ipFifo_V_last_empty_n fifo_status 0 1 }  { rx_crc2ipFifo_V_last_read fifo_update 1 1 } } }
	rx_process2dropFifo_1_5 { ap_fifo {  { rx_process2dropFifo_1_5_din fifo_data 1 512 }  { rx_process2dropFifo_1_5_full_n fifo_status 0 1 }  { rx_process2dropFifo_1_5_write fifo_update 1 1 } } }
	rx_process2dropFifo_2_4 { ap_fifo {  { rx_process2dropFifo_2_4_din fifo_data 1 64 }  { rx_process2dropFifo_2_4_full_n fifo_status 0 1 }  { rx_process2dropFifo_2_4_write fifo_update 1 1 } } }
	rx_process2dropFifo_s_6 { ap_fifo {  { rx_process2dropFifo_s_6_din fifo_data 1 1 }  { rx_process2dropFifo_s_6_full_n fifo_status 0 1 }  { rx_process2dropFifo_s_6_write fifo_update 1 1 } } }
	rx_process2dropLengt_1 { ap_fifo {  { rx_process2dropLengt_1_din fifo_data 1 4 }  { rx_process2dropLengt_1_full_n fifo_status 0 1 }  { rx_process2dropLengt_1_write fifo_update 1 1 } } }
	rx_ip2udpMetaFifo_V_s { ap_fifo {  { rx_ip2udpMetaFifo_V_s_din fifo_data 1 32 }  { rx_ip2udpMetaFifo_V_s_full_n fifo_status 0 1 }  { rx_ip2udpMetaFifo_V_s_write fifo_update 1 1 } } }
	rx_ip2udpMetaFifo_V_1 { ap_fifo {  { rx_ip2udpMetaFifo_V_1_din fifo_data 1 16 }  { rx_ip2udpMetaFifo_V_1_full_n fifo_status 0 1 }  { rx_ip2udpMetaFifo_V_1_write fifo_update 1 1 } } }
}
