set moduleName ipv4_generate_ipv421
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
set C_modelName {ipv4_generate_ipv421}
set C_modelType { void 0 }
set C_modelArgList {
	{ local_ip_address_V int 128 regular {fifo 0}  }
	{ tx_udp2ipMetaFifo_V_s int 32 regular {fifo 0 volatile } {global 0}  }
	{ tx_udp2ipMetaFifo_V_1 int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_shift2ipv4Fifo_V_1 int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_shift2ipv4Fifo_V_2 int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_shift2ipv4Fifo_V_s int 1 regular {fifo 0 volatile } {global 0}  }
	{ ip2checksum_V_data_V int 512 regular {fifo 1 volatile } {global 1}  }
	{ ip2checksum_V_keep_V int 64 regular {fifo 1 volatile } {global 1}  }
	{ ip2checksum_V_last_V int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "local_ip_address_V", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "tx_udp2ipMetaFifo_V_s", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_udp2ipMetaFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_shift2ipv4Fifo_V_1", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_shift2ipv4Fifo_V_2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_shift2ipv4Fifo_V_s", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ip2checksum_V_data_V", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ip2checksum_V_keep_V", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ip2checksum_V_last_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ local_ip_address_V_dout sc_in sc_lv 128 signal 0 } 
	{ local_ip_address_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ local_ip_address_V_read sc_out sc_logic 1 signal 0 } 
	{ tx_shift2ipv4Fifo_V_1_dout sc_in sc_lv 512 signal 3 } 
	{ tx_shift2ipv4Fifo_V_1_empty_n sc_in sc_logic 1 signal 3 } 
	{ tx_shift2ipv4Fifo_V_1_read sc_out sc_logic 1 signal 3 } 
	{ tx_shift2ipv4Fifo_V_2_dout sc_in sc_lv 64 signal 4 } 
	{ tx_shift2ipv4Fifo_V_2_empty_n sc_in sc_logic 1 signal 4 } 
	{ tx_shift2ipv4Fifo_V_2_read sc_out sc_logic 1 signal 4 } 
	{ tx_shift2ipv4Fifo_V_s_dout sc_in sc_lv 1 signal 5 } 
	{ tx_shift2ipv4Fifo_V_s_empty_n sc_in sc_logic 1 signal 5 } 
	{ tx_shift2ipv4Fifo_V_s_read sc_out sc_logic 1 signal 5 } 
	{ tx_udp2ipMetaFifo_V_s_dout sc_in sc_lv 32 signal 1 } 
	{ tx_udp2ipMetaFifo_V_s_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_udp2ipMetaFifo_V_s_read sc_out sc_logic 1 signal 1 } 
	{ tx_udp2ipMetaFifo_V_1_dout sc_in sc_lv 16 signal 2 } 
	{ tx_udp2ipMetaFifo_V_1_empty_n sc_in sc_logic 1 signal 2 } 
	{ tx_udp2ipMetaFifo_V_1_read sc_out sc_logic 1 signal 2 } 
	{ ip2checksum_V_data_V_din sc_out sc_lv 512 signal 6 } 
	{ ip2checksum_V_data_V_full_n sc_in sc_logic 1 signal 6 } 
	{ ip2checksum_V_data_V_write sc_out sc_logic 1 signal 6 } 
	{ ip2checksum_V_keep_V_din sc_out sc_lv 64 signal 7 } 
	{ ip2checksum_V_keep_V_full_n sc_in sc_logic 1 signal 7 } 
	{ ip2checksum_V_keep_V_write sc_out sc_logic 1 signal 7 } 
	{ ip2checksum_V_last_V_din sc_out sc_lv 1 signal 8 } 
	{ ip2checksum_V_last_V_full_n sc_in sc_logic 1 signal 8 } 
	{ ip2checksum_V_last_V_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "local_ip_address_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "local_ip_address_V", "role": "dout" }} , 
 	{ "name": "local_ip_address_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_ip_address_V", "role": "empty_n" }} , 
 	{ "name": "local_ip_address_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_ip_address_V", "role": "read" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_1", "role": "dout" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_1", "role": "empty_n" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_1", "role": "read" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_2", "role": "dout" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_2", "role": "empty_n" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_2", "role": "read" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_s", "role": "dout" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_s", "role": "empty_n" }} , 
 	{ "name": "tx_shift2ipv4Fifo_V_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2ipv4Fifo_V_s", "role": "read" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_s", "role": "dout" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_s", "role": "empty_n" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_s", "role": "read" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_1", "role": "dout" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_1", "role": "empty_n" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_1", "role": "read" }} , 
 	{ "name": "ip2checksum_V_data_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ip2checksum_V_data_V", "role": "din" }} , 
 	{ "name": "ip2checksum_V_data_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip2checksum_V_data_V", "role": "full_n" }} , 
 	{ "name": "ip2checksum_V_data_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip2checksum_V_data_V", "role": "write" }} , 
 	{ "name": "ip2checksum_V_keep_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "ip2checksum_V_keep_V", "role": "din" }} , 
 	{ "name": "ip2checksum_V_keep_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip2checksum_V_keep_V", "role": "full_n" }} , 
 	{ "name": "ip2checksum_V_keep_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip2checksum_V_keep_V", "role": "write" }} , 
 	{ "name": "ip2checksum_V_last_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ip2checksum_V_last_V", "role": "din" }} , 
 	{ "name": "ip2checksum_V_last_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip2checksum_V_last_V", "role": "full_n" }} , 
 	{ "name": "ip2checksum_V_last_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip2checksum_V_last_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ipv4_generate_ipv421",
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
			{"Name" : "local_ip_address_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "local_ip_address_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gi_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_udp2ipMetaFifo_V_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipMetaFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udp2ipMetaFifo_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipMetaFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_header_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_shift2ipv4Fifo_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2ipv4Fifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_shift2ipv4Fifo_V_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2ipv4Fifo_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_shift2ipv4Fifo_V_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2ipv4Fifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ip2checksum_V_data_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "ip2checksum_V_data_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ip2checksum_V_keep_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "ip2checksum_V_keep_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ip2checksum_V_last_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "ip2checksum_V_last_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	ipv4_generate_ipv421 {
		local_ip_address_V {Type I LastRead 0 FirstWrite -1}
		gi_state {Type IO LastRead -1 FirstWrite -1}
		header_idx_4 {Type IO LastRead -1 FirstWrite -1}
		tx_udp2ipMetaFifo_V_s {Type I LastRead 0 FirstWrite -1}
		tx_udp2ipMetaFifo_V_1 {Type I LastRead 0 FirstWrite -1}
		header_header_V_5 {Type IO LastRead -1 FirstWrite -1}
		tx_shift2ipv4Fifo_V_1 {Type I LastRead 0 FirstWrite -1}
		tx_shift2ipv4Fifo_V_2 {Type I LastRead 0 FirstWrite -1}
		tx_shift2ipv4Fifo_V_s {Type I LastRead 0 FirstWrite -1}
		ip2checksum_V_data_V {Type O LastRead -1 FirstWrite 1}
		ip2checksum_V_keep_V {Type O LastRead -1 FirstWrite 1}
		ip2checksum_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	local_ip_address_V { ap_fifo {  { local_ip_address_V_dout fifo_data 0 128 }  { local_ip_address_V_empty_n fifo_status 0 1 }  { local_ip_address_V_read fifo_update 1 1 } } }
	tx_udp2ipMetaFifo_V_s { ap_fifo {  { tx_udp2ipMetaFifo_V_s_dout fifo_data 0 32 }  { tx_udp2ipMetaFifo_V_s_empty_n fifo_status 0 1 }  { tx_udp2ipMetaFifo_V_s_read fifo_update 1 1 } } }
	tx_udp2ipMetaFifo_V_1 { ap_fifo {  { tx_udp2ipMetaFifo_V_1_dout fifo_data 0 16 }  { tx_udp2ipMetaFifo_V_1_empty_n fifo_status 0 1 }  { tx_udp2ipMetaFifo_V_1_read fifo_update 1 1 } } }
	tx_shift2ipv4Fifo_V_1 { ap_fifo {  { tx_shift2ipv4Fifo_V_1_dout fifo_data 0 512 }  { tx_shift2ipv4Fifo_V_1_empty_n fifo_status 0 1 }  { tx_shift2ipv4Fifo_V_1_read fifo_update 1 1 } } }
	tx_shift2ipv4Fifo_V_2 { ap_fifo {  { tx_shift2ipv4Fifo_V_2_dout fifo_data 0 64 }  { tx_shift2ipv4Fifo_V_2_empty_n fifo_status 0 1 }  { tx_shift2ipv4Fifo_V_2_read fifo_update 1 1 } } }
	tx_shift2ipv4Fifo_V_s { ap_fifo {  { tx_shift2ipv4Fifo_V_s_dout fifo_data 0 1 }  { tx_shift2ipv4Fifo_V_s_empty_n fifo_status 0 1 }  { tx_shift2ipv4Fifo_V_s_read fifo_update 1 1 } } }
	ip2checksum_V_data_V { ap_fifo {  { ip2checksum_V_data_V_din fifo_data 1 512 }  { ip2checksum_V_data_V_full_n fifo_status 0 1 }  { ip2checksum_V_data_V_write fifo_update 1 1 } } }
	ip2checksum_V_keep_V { ap_fifo {  { ip2checksum_V_keep_V_din fifo_data 1 64 }  { ip2checksum_V_keep_V_full_n fifo_status 0 1 }  { ip2checksum_V_keep_V_write fifo_update 1 1 } } }
	ip2checksum_V_last_V { ap_fifo {  { ip2checksum_V_last_V_din fifo_data 1 1 }  { ip2checksum_V_last_V_full_n fifo_status 0 1 }  { ip2checksum_V_last_V_write fifo_update 1 1 } } }
}
