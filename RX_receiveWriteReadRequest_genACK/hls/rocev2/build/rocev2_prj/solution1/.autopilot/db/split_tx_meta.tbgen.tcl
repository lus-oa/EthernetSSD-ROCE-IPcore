set moduleName split_tx_meta
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
set C_modelName {split_tx_meta}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_ipUdpMetaFifo_V_t_1 int 128 regular {fifo 0 volatile } {global 0}  }
	{ tx_ipUdpMetaFifo_V_t int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_ipUdpMetaFifo_V_m int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_ipUdpMetaFifo_V_l int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_udp2ipMetaFifo_V_s int 32 regular {fifo 1 volatile } {global 1}  }
	{ tx_udp2ipMetaFifo_V_1 int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_udpMetaFifo_V_the int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_udpMetaFifo_V_my_s int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_udpMetaFifo_V_len int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_udpMetaFifo_V_val int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_ipUdpMetaFifo_V_t_1", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo_V_t", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo_V_m", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo_V_l", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_udp2ipMetaFifo_V_s", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udp2ipMetaFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo_V_the", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo_V_my_s", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo_V_len", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo_V_val", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_ipUdpMetaFifo_V_t_1_dout sc_in sc_lv 128 signal 0 } 
	{ tx_ipUdpMetaFifo_V_t_1_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_ipUdpMetaFifo_V_t_1_read sc_out sc_logic 1 signal 0 } 
	{ tx_ipUdpMetaFifo_V_t_dout sc_in sc_lv 16 signal 1 } 
	{ tx_ipUdpMetaFifo_V_t_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_ipUdpMetaFifo_V_t_read sc_out sc_logic 1 signal 1 } 
	{ tx_ipUdpMetaFifo_V_m_dout sc_in sc_lv 16 signal 2 } 
	{ tx_ipUdpMetaFifo_V_m_empty_n sc_in sc_logic 1 signal 2 } 
	{ tx_ipUdpMetaFifo_V_m_read sc_out sc_logic 1 signal 2 } 
	{ tx_ipUdpMetaFifo_V_l_dout sc_in sc_lv 16 signal 3 } 
	{ tx_ipUdpMetaFifo_V_l_empty_n sc_in sc_logic 1 signal 3 } 
	{ tx_ipUdpMetaFifo_V_l_read sc_out sc_logic 1 signal 3 } 
	{ tx_udp2ipMetaFifo_V_s_din sc_out sc_lv 32 signal 4 } 
	{ tx_udp2ipMetaFifo_V_s_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_udp2ipMetaFifo_V_s_write sc_out sc_logic 1 signal 4 } 
	{ tx_udp2ipMetaFifo_V_1_din sc_out sc_lv 16 signal 5 } 
	{ tx_udp2ipMetaFifo_V_1_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_udp2ipMetaFifo_V_1_write sc_out sc_logic 1 signal 5 } 
	{ tx_udpMetaFifo_V_the_din sc_out sc_lv 16 signal 6 } 
	{ tx_udpMetaFifo_V_the_full_n sc_in sc_logic 1 signal 6 } 
	{ tx_udpMetaFifo_V_the_write sc_out sc_logic 1 signal 6 } 
	{ tx_udpMetaFifo_V_my_s_din sc_out sc_lv 16 signal 7 } 
	{ tx_udpMetaFifo_V_my_s_full_n sc_in sc_logic 1 signal 7 } 
	{ tx_udpMetaFifo_V_my_s_write sc_out sc_logic 1 signal 7 } 
	{ tx_udpMetaFifo_V_len_din sc_out sc_lv 16 signal 8 } 
	{ tx_udpMetaFifo_V_len_full_n sc_in sc_logic 1 signal 8 } 
	{ tx_udpMetaFifo_V_len_write sc_out sc_logic 1 signal 8 } 
	{ tx_udpMetaFifo_V_val_din sc_out sc_lv 1 signal 9 } 
	{ tx_udpMetaFifo_V_val_full_n sc_in sc_logic 1 signal 9 } 
	{ tx_udpMetaFifo_V_val_write sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t_1", "role": "dout" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t_1", "role": "empty_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t_1", "role": "read" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t", "role": "dout" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t", "role": "empty_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t", "role": "read" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_m_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_m", "role": "dout" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_m_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_m", "role": "empty_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_m_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_m", "role": "read" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_l_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_l", "role": "dout" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_l_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_l", "role": "empty_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_l_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_l", "role": "read" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_s", "role": "din" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_s", "role": "full_n" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_s", "role": "write" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_1", "role": "din" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_1", "role": "full_n" }} , 
 	{ "name": "tx_udp2ipMetaFifo_V_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipMetaFifo_V_1", "role": "write" }} , 
 	{ "name": "tx_udpMetaFifo_V_the_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_the", "role": "din" }} , 
 	{ "name": "tx_udpMetaFifo_V_the_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_the", "role": "full_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_the_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_the", "role": "write" }} , 
 	{ "name": "tx_udpMetaFifo_V_my_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_my_s", "role": "din" }} , 
 	{ "name": "tx_udpMetaFifo_V_my_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_my_s", "role": "full_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_my_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_my_s", "role": "write" }} , 
 	{ "name": "tx_udpMetaFifo_V_len_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_len", "role": "din" }} , 
 	{ "name": "tx_udpMetaFifo_V_len_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_len", "role": "full_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_len_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_len", "role": "write" }} , 
 	{ "name": "tx_udpMetaFifo_V_val_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_val", "role": "din" }} , 
 	{ "name": "tx_udpMetaFifo_V_val_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_val", "role": "full_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_val_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_val", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "split_tx_meta",
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
			{"Name" : "tx_ipUdpMetaFifo_V_t_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_t_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo_V_t", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_t_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo_V_m", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_m_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo_V_l", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_l_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udp2ipMetaFifo_V_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipMetaFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udp2ipMetaFifo_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipMetaFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo_V_the", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_the_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo_V_my_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_my_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo_V_len", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_len_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo_V_val", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_val_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	split_tx_meta {
		tx_ipUdpMetaFifo_V_t_1 {Type I LastRead 0 FirstWrite -1}
		tx_ipUdpMetaFifo_V_t {Type I LastRead 0 FirstWrite -1}
		tx_ipUdpMetaFifo_V_m {Type I LastRead 0 FirstWrite -1}
		tx_ipUdpMetaFifo_V_l {Type I LastRead 0 FirstWrite -1}
		tx_udp2ipMetaFifo_V_s {Type O LastRead -1 FirstWrite 1}
		tx_udp2ipMetaFifo_V_1 {Type O LastRead -1 FirstWrite 1}
		tx_udpMetaFifo_V_the {Type O LastRead -1 FirstWrite 1}
		tx_udpMetaFifo_V_my_s {Type O LastRead -1 FirstWrite 1}
		tx_udpMetaFifo_V_len {Type O LastRead -1 FirstWrite 1}
		tx_udpMetaFifo_V_val {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_ipUdpMetaFifo_V_t_1 { ap_fifo {  { tx_ipUdpMetaFifo_V_t_1_dout fifo_data 0 128 }  { tx_ipUdpMetaFifo_V_t_1_empty_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_t_1_read fifo_update 1 1 } } }
	tx_ipUdpMetaFifo_V_t { ap_fifo {  { tx_ipUdpMetaFifo_V_t_dout fifo_data 0 16 }  { tx_ipUdpMetaFifo_V_t_empty_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_t_read fifo_update 1 1 } } }
	tx_ipUdpMetaFifo_V_m { ap_fifo {  { tx_ipUdpMetaFifo_V_m_dout fifo_data 0 16 }  { tx_ipUdpMetaFifo_V_m_empty_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_m_read fifo_update 1 1 } } }
	tx_ipUdpMetaFifo_V_l { ap_fifo {  { tx_ipUdpMetaFifo_V_l_dout fifo_data 0 16 }  { tx_ipUdpMetaFifo_V_l_empty_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_l_read fifo_update 1 1 } } }
	tx_udp2ipMetaFifo_V_s { ap_fifo {  { tx_udp2ipMetaFifo_V_s_din fifo_data 1 32 }  { tx_udp2ipMetaFifo_V_s_full_n fifo_status 0 1 }  { tx_udp2ipMetaFifo_V_s_write fifo_update 1 1 } } }
	tx_udp2ipMetaFifo_V_1 { ap_fifo {  { tx_udp2ipMetaFifo_V_1_din fifo_data 1 16 }  { tx_udp2ipMetaFifo_V_1_full_n fifo_status 0 1 }  { tx_udp2ipMetaFifo_V_1_write fifo_update 1 1 } } }
	tx_udpMetaFifo_V_the { ap_fifo {  { tx_udpMetaFifo_V_the_din fifo_data 1 16 }  { tx_udpMetaFifo_V_the_full_n fifo_status 0 1 }  { tx_udpMetaFifo_V_the_write fifo_update 1 1 } } }
	tx_udpMetaFifo_V_my_s { ap_fifo {  { tx_udpMetaFifo_V_my_s_din fifo_data 1 16 }  { tx_udpMetaFifo_V_my_s_full_n fifo_status 0 1 }  { tx_udpMetaFifo_V_my_s_write fifo_update 1 1 } } }
	tx_udpMetaFifo_V_len { ap_fifo {  { tx_udpMetaFifo_V_len_din fifo_data 1 16 }  { tx_udpMetaFifo_V_len_full_n fifo_status 0 1 }  { tx_udpMetaFifo_V_len_write fifo_update 1 1 } } }
	tx_udpMetaFifo_V_val { ap_fifo {  { tx_udpMetaFifo_V_val_din fifo_data 1 1 }  { tx_udpMetaFifo_V_val_full_n fifo_status 0 1 }  { tx_udpMetaFifo_V_val_write fifo_update 1 1 } } }
}
