set moduleName insert_icrc_512_s
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
set C_modelName {insert_icrc<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ output_V_data_V int 512 regular {axi_s 1 volatile  { m_axis_tx_data Data } }  }
	{ output_V_keep_V int 64 regular {axi_s 1 volatile  { m_axis_tx_data Keep } }  }
	{ output_V_last_V int 1 regular {axi_s 1 volatile  { m_axis_tx_data Last } }  }
	{ crcFifo1_V_V int 32 regular {fifo 0 volatile } {global 0}  }
	{ tx_crcDataFifo_V_dat int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_crcDataFifo_V_kee int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_crcDataFifo_V_las int 1 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "output_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "crcFifo1_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_crcDataFifo_V_dat", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_crcDataFifo_V_kee", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_crcDataFifo_V_las", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_crcDataFifo_V_dat_dout sc_in sc_lv 512 signal 4 } 
	{ tx_crcDataFifo_V_dat_empty_n sc_in sc_logic 1 signal 4 } 
	{ tx_crcDataFifo_V_dat_read sc_out sc_logic 1 signal 4 } 
	{ tx_crcDataFifo_V_kee_dout sc_in sc_lv 64 signal 5 } 
	{ tx_crcDataFifo_V_kee_empty_n sc_in sc_logic 1 signal 5 } 
	{ tx_crcDataFifo_V_kee_read sc_out sc_logic 1 signal 5 } 
	{ tx_crcDataFifo_V_las_dout sc_in sc_lv 1 signal 6 } 
	{ tx_crcDataFifo_V_las_empty_n sc_in sc_logic 1 signal 6 } 
	{ tx_crcDataFifo_V_las_read sc_out sc_logic 1 signal 6 } 
	{ crcFifo1_V_V_dout sc_in sc_lv 32 signal 3 } 
	{ crcFifo1_V_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ crcFifo1_V_V_read sc_out sc_logic 1 signal 3 } 
	{ m_axis_tx_data_TREADY sc_in sc_logic 1 outacc 2 } 
	{ m_axis_tx_data_TDATA sc_out sc_lv 512 signal 0 } 
	{ m_axis_tx_data_TVALID sc_out sc_logic 1 outvld 2 } 
	{ m_axis_tx_data_TKEEP sc_out sc_lv 64 signal 1 } 
	{ m_axis_tx_data_TLAST sc_out sc_lv 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_crcDataFifo_V_dat_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_dat", "role": "dout" }} , 
 	{ "name": "tx_crcDataFifo_V_dat_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_dat", "role": "empty_n" }} , 
 	{ "name": "tx_crcDataFifo_V_dat_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_dat", "role": "read" }} , 
 	{ "name": "tx_crcDataFifo_V_kee_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_kee", "role": "dout" }} , 
 	{ "name": "tx_crcDataFifo_V_kee_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_kee", "role": "empty_n" }} , 
 	{ "name": "tx_crcDataFifo_V_kee_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_kee", "role": "read" }} , 
 	{ "name": "tx_crcDataFifo_V_las_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_las", "role": "dout" }} , 
 	{ "name": "tx_crcDataFifo_V_las_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_las", "role": "empty_n" }} , 
 	{ "name": "tx_crcDataFifo_V_las_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_crcDataFifo_V_las", "role": "read" }} , 
 	{ "name": "crcFifo1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crcFifo1_V_V", "role": "dout" }} , 
 	{ "name": "crcFifo1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crcFifo1_V_V", "role": "empty_n" }} , 
 	{ "name": "crcFifo1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crcFifo1_V_V", "role": "read" }} , 
 	{ "name": "m_axis_tx_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "output_V_last_V", "role": "READY" }} , 
 	{ "name": "m_axis_tx_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_V_data_V", "role": "DATA" }} , 
 	{ "name": "m_axis_tx_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_V_last_V", "role": "VALID" }} , 
 	{ "name": "m_axis_tx_data_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_V_keep_V", "role": "KEEP" }} , 
 	{ "name": "m_axis_tx_data_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_V_last_V", "role": "LAST" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "insert_icrc_512_s",
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
			{"Name" : "output_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_tx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "output_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "ii_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "crc_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "crcFifo1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "crcFifo1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_crcDataFifo_V_dat", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_crcDataFifo_V_dat_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_crcDataFifo_V_kee", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_crcDataFifo_V_kee_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_crcDataFifo_V_las", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_crcDataFifo_V_las_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	insert_icrc_512_s {
		output_V_data_V {Type O LastRead -1 FirstWrite 1}
		output_V_keep_V {Type O LastRead -1 FirstWrite 1}
		output_V_last_V {Type O LastRead -1 FirstWrite 1}
		ii_state {Type IO LastRead -1 FirstWrite -1}
		crc_V {Type IO LastRead -1 FirstWrite -1}
		crcFifo1_V_V {Type I LastRead 0 FirstWrite -1}
		tx_crcDataFifo_V_dat {Type I LastRead 0 FirstWrite -1}
		tx_crcDataFifo_V_kee {Type I LastRead 0 FirstWrite -1}
		tx_crcDataFifo_V_las {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	output_V_data_V { axis {  { m_axis_tx_data_TDATA out_data 1 512 } } }
	output_V_keep_V { axis {  { m_axis_tx_data_TKEEP out_data 1 64 } } }
	output_V_last_V { axis {  { m_axis_tx_data_TREADY out_acc 0 1 }  { m_axis_tx_data_TVALID out_vld 1 1 }  { m_axis_tx_data_TLAST out_data 1 1 } } }
	crcFifo1_V_V { ap_fifo {  { crcFifo1_V_V_dout fifo_data 0 32 }  { crcFifo1_V_V_empty_n fifo_status 0 1 }  { crcFifo1_V_V_read fifo_update 1 1 } } }
	tx_crcDataFifo_V_dat { ap_fifo {  { tx_crcDataFifo_V_dat_dout fifo_data 0 512 }  { tx_crcDataFifo_V_dat_empty_n fifo_status 0 1 }  { tx_crcDataFifo_V_dat_read fifo_update 1 1 } } }
	tx_crcDataFifo_V_kee { ap_fifo {  { tx_crcDataFifo_V_kee_dout fifo_data 0 64 }  { tx_crcDataFifo_V_kee_empty_n fifo_status 0 1 }  { tx_crcDataFifo_V_kee_read fifo_update 1 1 } } }
	tx_crcDataFifo_V_las { ap_fifo {  { tx_crcDataFifo_V_las_dout fifo_data 0 1 }  { tx_crcDataFifo_V_las_empty_n fifo_status 0 1 }  { tx_crcDataFifo_V_las_read fifo_update 1 1 } } }
}
