set moduleName stream_merger
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
set C_modelName {stream_merger}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_exhEventMetaFifo_s_12 int 50 regular {fifo 0 volatile } {global 0}  }
	{ rx_ackEventFifo_V int 50 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhEventFifo_V int 50 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_exhEventMetaFifo_s_12", "interface" : "fifo", "bitwidth" : 50, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ackEventFifo_V", "interface" : "fifo", "bitwidth" : 50, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhEventFifo_V", "interface" : "fifo", "bitwidth" : 50, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_exhEventMetaFifo_s_12_dout sc_in sc_lv 50 signal 0 } 
	{ rx_exhEventMetaFifo_s_12_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_exhEventMetaFifo_s_12_read sc_out sc_logic 1 signal 0 } 
	{ rx_ibhEventFifo_V_dout sc_in sc_lv 50 signal 2 } 
	{ rx_ibhEventFifo_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_ibhEventFifo_V_read sc_out sc_logic 1 signal 2 } 
	{ rx_ackEventFifo_V_din sc_out sc_lv 50 signal 1 } 
	{ rx_ackEventFifo_V_full_n sc_in sc_logic 1 signal 1 } 
	{ rx_ackEventFifo_V_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_exhEventMetaFifo_s_12_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo_s_12", "role": "dout" }} , 
 	{ "name": "rx_exhEventMetaFifo_s_12_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo_s_12", "role": "empty_n" }} , 
 	{ "name": "rx_exhEventMetaFifo_s_12_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo_s_12", "role": "read" }} , 
 	{ "name": "rx_ibhEventFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "rx_ibhEventFifo_V", "role": "dout" }} , 
 	{ "name": "rx_ibhEventFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo_V", "role": "empty_n" }} , 
 	{ "name": "rx_ibhEventFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo_V", "role": "read" }} , 
 	{ "name": "rx_ackEventFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "rx_ackEventFifo_V", "role": "din" }} , 
 	{ "name": "rx_ackEventFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_ackEventFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "stream_merger",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "rx_exhEventMetaFifo_s_12", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhEventMetaFifo_s_12_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ackEventFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ackEventFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhEventFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhEventFifo_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	stream_merger {
		rx_exhEventMetaFifo_s_12 {Type I LastRead 0 FirstWrite -1}
		rx_ackEventFifo_V {Type O LastRead -1 FirstWrite 2}
		rx_ibhEventFifo_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_exhEventMetaFifo_s_12 { ap_fifo {  { rx_exhEventMetaFifo_s_12_dout fifo_data 0 50 }  { rx_exhEventMetaFifo_s_12_empty_n fifo_status 0 1 }  { rx_exhEventMetaFifo_s_12_read fifo_update 1 1 } } }
	rx_ackEventFifo_V { ap_fifo {  { rx_ackEventFifo_V_din fifo_data 1 50 }  { rx_ackEventFifo_V_full_n fifo_status 0 1 }  { rx_ackEventFifo_V_write fifo_update 1 1 } } }
	rx_ibhEventFifo_V { ap_fifo {  { rx_ibhEventFifo_V_dout fifo_data 0 50 }  { rx_ibhEventFifo_V_empty_n fifo_status 0 1 }  { rx_ibhEventFifo_V_read fifo_update 1 1 } } }
}
