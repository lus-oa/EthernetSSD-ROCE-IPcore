set moduleName merge_rx_meta
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
set C_modelName {merge_rx_meta}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ip2udpMetaFifo_V_s int 32 regular {fifo 0 volatile } {global 0}  }
	{ rx_ip2udpMetaFifo_V_1 int 16 regular {fifo 0 volatile } {global 0}  }
	{ rx_udpMetaFifo_V int 49 regular {fifo 0 volatile } {global 0}  }
	{ rx_ipUdpMetaFifo_V_t_1 int 128 regular {fifo 1 volatile } {global 1}  }
	{ rx_ipUdpMetaFifo_V_t int 16 regular {fifo 1 volatile } {global 1}  }
	{ rx_ipUdpMetaFifo_V_m int 16 regular {fifo 1 volatile } {global 1}  }
	{ rx_ipUdpMetaFifo_V_l int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ip2udpMetaFifo_V_s", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ip2udpMetaFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_udpMetaFifo_V", "interface" : "fifo", "bitwidth" : 49, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ipUdpMetaFifo_V_t_1", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ipUdpMetaFifo_V_t", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ipUdpMetaFifo_V_m", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ipUdpMetaFifo_V_l", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_ip2udpMetaFifo_V_s_dout sc_in sc_lv 32 signal 0 } 
	{ rx_ip2udpMetaFifo_V_s_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ip2udpMetaFifo_V_s_read sc_out sc_logic 1 signal 0 } 
	{ rx_ip2udpMetaFifo_V_1_dout sc_in sc_lv 16 signal 1 } 
	{ rx_ip2udpMetaFifo_V_1_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_ip2udpMetaFifo_V_1_read sc_out sc_logic 1 signal 1 } 
	{ rx_udpMetaFifo_V_dout sc_in sc_lv 49 signal 2 } 
	{ rx_udpMetaFifo_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_udpMetaFifo_V_read sc_out sc_logic 1 signal 2 } 
	{ rx_ipUdpMetaFifo_V_t_1_din sc_out sc_lv 128 signal 3 } 
	{ rx_ipUdpMetaFifo_V_t_1_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_ipUdpMetaFifo_V_t_1_write sc_out sc_logic 1 signal 3 } 
	{ rx_ipUdpMetaFifo_V_t_din sc_out sc_lv 16 signal 4 } 
	{ rx_ipUdpMetaFifo_V_t_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_ipUdpMetaFifo_V_t_write sc_out sc_logic 1 signal 4 } 
	{ rx_ipUdpMetaFifo_V_m_din sc_out sc_lv 16 signal 5 } 
	{ rx_ipUdpMetaFifo_V_m_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_ipUdpMetaFifo_V_m_write sc_out sc_logic 1 signal 5 } 
	{ rx_ipUdpMetaFifo_V_l_din sc_out sc_lv 16 signal 6 } 
	{ rx_ipUdpMetaFifo_V_l_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_ipUdpMetaFifo_V_l_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_s", "role": "dout" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_s", "role": "empty_n" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_s", "role": "read" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_1", "role": "dout" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_1", "role": "empty_n" }} , 
 	{ "name": "rx_ip2udpMetaFifo_V_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpMetaFifo_V_1", "role": "read" }} , 
 	{ "name": "rx_udpMetaFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":49, "type": "signal", "bundle":{"name": "rx_udpMetaFifo_V", "role": "dout" }} , 
 	{ "name": "rx_udpMetaFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udpMetaFifo_V", "role": "empty_n" }} , 
 	{ "name": "rx_udpMetaFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udpMetaFifo_V", "role": "read" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_t_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_t_1", "role": "din" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_t_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_t_1", "role": "full_n" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_t_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_t_1", "role": "write" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_t_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_t", "role": "din" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_t_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_t", "role": "full_n" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_t_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_t", "role": "write" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_m_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_m", "role": "din" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_m_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_m", "role": "full_n" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_m_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_m", "role": "write" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_l_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_l", "role": "din" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_l_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_l", "role": "full_n" }} , 
 	{ "name": "rx_ipUdpMetaFifo_V_l_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ipUdpMetaFifo_V_l", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "merge_rx_meta",
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
			{"Name" : "rx_ip2udpMetaFifo_V_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpMetaFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ip2udpMetaFifo_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpMetaFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udpMetaFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udpMetaFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ipUdpMetaFifo_V_t_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ipUdpMetaFifo_V_t_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ipUdpMetaFifo_V_t", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ipUdpMetaFifo_V_t_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ipUdpMetaFifo_V_m", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ipUdpMetaFifo_V_m_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ipUdpMetaFifo_V_l", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ipUdpMetaFifo_V_l_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	merge_rx_meta {
		rx_ip2udpMetaFifo_V_s {Type I LastRead 0 FirstWrite -1}
		rx_ip2udpMetaFifo_V_1 {Type I LastRead 0 FirstWrite -1}
		rx_udpMetaFifo_V {Type I LastRead 0 FirstWrite -1}
		rx_ipUdpMetaFifo_V_t_1 {Type O LastRead -1 FirstWrite 1}
		rx_ipUdpMetaFifo_V_t {Type O LastRead -1 FirstWrite 1}
		rx_ipUdpMetaFifo_V_m {Type O LastRead -1 FirstWrite 1}
		rx_ipUdpMetaFifo_V_l {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ip2udpMetaFifo_V_s { ap_fifo {  { rx_ip2udpMetaFifo_V_s_dout fifo_data 0 32 }  { rx_ip2udpMetaFifo_V_s_empty_n fifo_status 0 1 }  { rx_ip2udpMetaFifo_V_s_read fifo_update 1 1 } } }
	rx_ip2udpMetaFifo_V_1 { ap_fifo {  { rx_ip2udpMetaFifo_V_1_dout fifo_data 0 16 }  { rx_ip2udpMetaFifo_V_1_empty_n fifo_status 0 1 }  { rx_ip2udpMetaFifo_V_1_read fifo_update 1 1 } } }
	rx_udpMetaFifo_V { ap_fifo {  { rx_udpMetaFifo_V_dout fifo_data 0 49 }  { rx_udpMetaFifo_V_empty_n fifo_status 0 1 }  { rx_udpMetaFifo_V_read fifo_update 1 1 } } }
	rx_ipUdpMetaFifo_V_t_1 { ap_fifo {  { rx_ipUdpMetaFifo_V_t_1_din fifo_data 1 128 }  { rx_ipUdpMetaFifo_V_t_1_full_n fifo_status 0 1 }  { rx_ipUdpMetaFifo_V_t_1_write fifo_update 1 1 } } }
	rx_ipUdpMetaFifo_V_t { ap_fifo {  { rx_ipUdpMetaFifo_V_t_din fifo_data 1 16 }  { rx_ipUdpMetaFifo_V_t_full_n fifo_status 0 1 }  { rx_ipUdpMetaFifo_V_t_write fifo_update 1 1 } } }
	rx_ipUdpMetaFifo_V_m { ap_fifo {  { rx_ipUdpMetaFifo_V_m_din fifo_data 1 16 }  { rx_ipUdpMetaFifo_V_m_full_n fifo_status 0 1 }  { rx_ipUdpMetaFifo_V_m_write fifo_update 1 1 } } }
	rx_ipUdpMetaFifo_V_l { ap_fifo {  { rx_ipUdpMetaFifo_V_l_din fifo_data 1 16 }  { rx_ipUdpMetaFifo_V_l_full_n fifo_status 0 1 }  { rx_ipUdpMetaFifo_V_l_write fifo_update 1 1 } } }
}
