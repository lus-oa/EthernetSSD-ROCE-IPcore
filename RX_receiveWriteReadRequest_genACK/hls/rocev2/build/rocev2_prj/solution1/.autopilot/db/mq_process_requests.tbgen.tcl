set moduleName mq_process_requests
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
set C_modelName {mq_process_requests}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_readReqAddr_push_1_1 int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_readReqAddr_push_s_2 int 64 regular {fifo 0 volatile } {global 0}  }
	{ mq_freeListFifo_V_V int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerReqFifo_V_1 int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerReqFifo_V_s int 1 regular {fifo 1 volatile } {global 1}  }
	{ rx_readReqAddr_pop_r_4 int 17 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerRspFifo_V_1 int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerRspFifo_V_2 int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerRspFifo_V_s int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo_V_idx int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaReqFifo_V_ent int 64 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaReqFifo_V_ent_3 int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaReqFifo_V_ent_4 int 1 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaReqFifo_V_ent_1 int 1 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaReqFifo_V_wri int 1 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaReqFifo_V_app int 1 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerUpdFifo_V_s int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerUpdFifo_V_1 int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerUpdFifo_V_3 int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerUpdFifo_V_4 int 1 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaRspFifo_V_val int 64 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaRspFifo_V_nex int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaRspFifo_V_val_1 int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaRspFifo_V_isT int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_readReqAddr_pop_r_1 int 64 regular {fifo 1 volatile } {global 1}  }
	{ mq_releaseFifo_V_V int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_readReqAddr_push_1_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_readReqAddr_push_s_2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_freeListFifo_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerReqFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerReqFifo_V_s", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_r_4", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo_V_2", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo_V_s", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_idx", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent_3", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent_4", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent_1", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_wri", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_app", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo_V_s", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo_V_3", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo_V_4", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_val", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_nex", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_val_1", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_isT", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_r_1", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_releaseFifo_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 85
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mq_metaRspFifo_V_val_dout sc_in sc_lv 64 signal 20 } 
	{ mq_metaRspFifo_V_val_empty_n sc_in sc_logic 1 signal 20 } 
	{ mq_metaRspFifo_V_val_read sc_out sc_logic 1 signal 20 } 
	{ mq_metaRspFifo_V_nex_dout sc_in sc_lv 16 signal 21 } 
	{ mq_metaRspFifo_V_nex_empty_n sc_in sc_logic 1 signal 21 } 
	{ mq_metaRspFifo_V_nex_read sc_out sc_logic 1 signal 21 } 
	{ mq_metaRspFifo_V_val_1_dout sc_in sc_lv 1 signal 22 } 
	{ mq_metaRspFifo_V_val_1_empty_n sc_in sc_logic 1 signal 22 } 
	{ mq_metaRspFifo_V_val_1_read sc_out sc_logic 1 signal 22 } 
	{ mq_metaRspFifo_V_isT_dout sc_in sc_lv 1 signal 23 } 
	{ mq_metaRspFifo_V_isT_empty_n sc_in sc_logic 1 signal 23 } 
	{ mq_metaRspFifo_V_isT_read sc_out sc_logic 1 signal 23 } 
	{ mq_pointerRspFifo_V_1_dout sc_in sc_lv 16 signal 6 } 
	{ mq_pointerRspFifo_V_1_empty_n sc_in sc_logic 1 signal 6 } 
	{ mq_pointerRspFifo_V_1_read sc_out sc_logic 1 signal 6 } 
	{ mq_pointerRspFifo_V_2_dout sc_in sc_lv 16 signal 7 } 
	{ mq_pointerRspFifo_V_2_empty_n sc_in sc_logic 1 signal 7 } 
	{ mq_pointerRspFifo_V_2_read sc_out sc_logic 1 signal 7 } 
	{ mq_pointerRspFifo_V_s_dout sc_in sc_lv 1 signal 8 } 
	{ mq_pointerRspFifo_V_s_empty_n sc_in sc_logic 1 signal 8 } 
	{ mq_pointerRspFifo_V_s_read sc_out sc_logic 1 signal 8 } 
	{ rx_readReqAddr_pop_r_4_dout sc_in sc_lv 17 signal 5 } 
	{ rx_readReqAddr_pop_r_4_empty_n sc_in sc_logic 1 signal 5 } 
	{ rx_readReqAddr_pop_r_4_read sc_out sc_logic 1 signal 5 } 
	{ mq_freeListFifo_V_V_dout sc_in sc_lv 16 signal 2 } 
	{ mq_freeListFifo_V_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ mq_freeListFifo_V_V_read sc_out sc_logic 1 signal 2 } 
	{ tx_readReqAddr_push_1_1_dout sc_in sc_lv 16 signal 0 } 
	{ tx_readReqAddr_push_1_1_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_readReqAddr_push_1_1_read sc_out sc_logic 1 signal 0 } 
	{ tx_readReqAddr_push_s_2_dout sc_in sc_lv 64 signal 1 } 
	{ tx_readReqAddr_push_s_2_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_readReqAddr_push_s_2_read sc_out sc_logic 1 signal 1 } 
	{ rx_readReqAddr_pop_r_1_din sc_out sc_lv 64 signal 24 } 
	{ rx_readReqAddr_pop_r_1_full_n sc_in sc_logic 1 signal 24 } 
	{ rx_readReqAddr_pop_r_1_write sc_out sc_logic 1 signal 24 } 
	{ mq_releaseFifo_V_V_din sc_out sc_lv 16 signal 25 } 
	{ mq_releaseFifo_V_V_full_n sc_in sc_logic 1 signal 25 } 
	{ mq_releaseFifo_V_V_write sc_out sc_logic 1 signal 25 } 
	{ mq_pointerUpdFifo_V_s_din sc_out sc_lv 16 signal 16 } 
	{ mq_pointerUpdFifo_V_s_full_n sc_in sc_logic 1 signal 16 } 
	{ mq_pointerUpdFifo_V_s_write sc_out sc_logic 1 signal 16 } 
	{ mq_pointerUpdFifo_V_1_din sc_out sc_lv 16 signal 17 } 
	{ mq_pointerUpdFifo_V_1_full_n sc_in sc_logic 1 signal 17 } 
	{ mq_pointerUpdFifo_V_1_write sc_out sc_logic 1 signal 17 } 
	{ mq_pointerUpdFifo_V_3_din sc_out sc_lv 16 signal 18 } 
	{ mq_pointerUpdFifo_V_3_full_n sc_in sc_logic 1 signal 18 } 
	{ mq_pointerUpdFifo_V_3_write sc_out sc_logic 1 signal 18 } 
	{ mq_pointerUpdFifo_V_4_din sc_out sc_lv 1 signal 19 } 
	{ mq_pointerUpdFifo_V_4_full_n sc_in sc_logic 1 signal 19 } 
	{ mq_pointerUpdFifo_V_4_write sc_out sc_logic 1 signal 19 } 
	{ mq_metaReqFifo_V_idx_din sc_out sc_lv 16 signal 9 } 
	{ mq_metaReqFifo_V_idx_full_n sc_in sc_logic 1 signal 9 } 
	{ mq_metaReqFifo_V_idx_write sc_out sc_logic 1 signal 9 } 
	{ mq_metaReqFifo_V_ent_din sc_out sc_lv 64 signal 10 } 
	{ mq_metaReqFifo_V_ent_full_n sc_in sc_logic 1 signal 10 } 
	{ mq_metaReqFifo_V_ent_write sc_out sc_logic 1 signal 10 } 
	{ mq_metaReqFifo_V_ent_3_din sc_out sc_lv 16 signal 11 } 
	{ mq_metaReqFifo_V_ent_3_full_n sc_in sc_logic 1 signal 11 } 
	{ mq_metaReqFifo_V_ent_3_write sc_out sc_logic 1 signal 11 } 
	{ mq_metaReqFifo_V_ent_4_din sc_out sc_lv 1 signal 12 } 
	{ mq_metaReqFifo_V_ent_4_full_n sc_in sc_logic 1 signal 12 } 
	{ mq_metaReqFifo_V_ent_4_write sc_out sc_logic 1 signal 12 } 
	{ mq_metaReqFifo_V_ent_1_din sc_out sc_lv 1 signal 13 } 
	{ mq_metaReqFifo_V_ent_1_full_n sc_in sc_logic 1 signal 13 } 
	{ mq_metaReqFifo_V_ent_1_write sc_out sc_logic 1 signal 13 } 
	{ mq_metaReqFifo_V_wri_din sc_out sc_lv 1 signal 14 } 
	{ mq_metaReqFifo_V_wri_full_n sc_in sc_logic 1 signal 14 } 
	{ mq_metaReqFifo_V_wri_write sc_out sc_logic 1 signal 14 } 
	{ mq_metaReqFifo_V_app_din sc_out sc_lv 1 signal 15 } 
	{ mq_metaReqFifo_V_app_full_n sc_in sc_logic 1 signal 15 } 
	{ mq_metaReqFifo_V_app_write sc_out sc_logic 1 signal 15 } 
	{ mq_pointerReqFifo_V_1_din sc_out sc_lv 16 signal 3 } 
	{ mq_pointerReqFifo_V_1_full_n sc_in sc_logic 1 signal 3 } 
	{ mq_pointerReqFifo_V_1_write sc_out sc_logic 1 signal 3 } 
	{ mq_pointerReqFifo_V_s_din sc_out sc_lv 1 signal 4 } 
	{ mq_pointerReqFifo_V_s_full_n sc_in sc_logic 1 signal 4 } 
	{ mq_pointerReqFifo_V_s_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mq_metaRspFifo_V_val_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val", "role": "dout" }} , 
 	{ "name": "mq_metaRspFifo_V_val_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val", "role": "empty_n" }} , 
 	{ "name": "mq_metaRspFifo_V_val_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val", "role": "read" }} , 
 	{ "name": "mq_metaRspFifo_V_nex_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_nex", "role": "dout" }} , 
 	{ "name": "mq_metaRspFifo_V_nex_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_nex", "role": "empty_n" }} , 
 	{ "name": "mq_metaRspFifo_V_nex_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_nex", "role": "read" }} , 
 	{ "name": "mq_metaRspFifo_V_val_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val_1", "role": "dout" }} , 
 	{ "name": "mq_metaRspFifo_V_val_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val_1", "role": "empty_n" }} , 
 	{ "name": "mq_metaRspFifo_V_val_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val_1", "role": "read" }} , 
 	{ "name": "mq_metaRspFifo_V_isT_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_isT", "role": "dout" }} , 
 	{ "name": "mq_metaRspFifo_V_isT_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_isT", "role": "empty_n" }} , 
 	{ "name": "mq_metaRspFifo_V_isT_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_isT", "role": "read" }} , 
 	{ "name": "mq_pointerRspFifo_V_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_1", "role": "dout" }} , 
 	{ "name": "mq_pointerRspFifo_V_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_1", "role": "empty_n" }} , 
 	{ "name": "mq_pointerRspFifo_V_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_1", "role": "read" }} , 
 	{ "name": "mq_pointerRspFifo_V_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_2", "role": "dout" }} , 
 	{ "name": "mq_pointerRspFifo_V_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_2", "role": "empty_n" }} , 
 	{ "name": "mq_pointerRspFifo_V_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_2", "role": "read" }} , 
 	{ "name": "mq_pointerRspFifo_V_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_s", "role": "dout" }} , 
 	{ "name": "mq_pointerRspFifo_V_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_s", "role": "empty_n" }} , 
 	{ "name": "mq_pointerRspFifo_V_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_s", "role": "read" }} , 
 	{ "name": "rx_readReqAddr_pop_r_4_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_4", "role": "dout" }} , 
 	{ "name": "rx_readReqAddr_pop_r_4_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_4", "role": "empty_n" }} , 
 	{ "name": "rx_readReqAddr_pop_r_4_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_4", "role": "read" }} , 
 	{ "name": "mq_freeListFifo_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_freeListFifo_V_V", "role": "dout" }} , 
 	{ "name": "mq_freeListFifo_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_freeListFifo_V_V", "role": "empty_n" }} , 
 	{ "name": "mq_freeListFifo_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_freeListFifo_V_V", "role": "read" }} , 
 	{ "name": "tx_readReqAddr_push_1_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_1_1", "role": "dout" }} , 
 	{ "name": "tx_readReqAddr_push_1_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_1_1", "role": "empty_n" }} , 
 	{ "name": "tx_readReqAddr_push_1_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_1_1", "role": "read" }} , 
 	{ "name": "tx_readReqAddr_push_s_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_s_2", "role": "dout" }} , 
 	{ "name": "tx_readReqAddr_push_s_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_s_2", "role": "empty_n" }} , 
 	{ "name": "tx_readReqAddr_push_s_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_s_2", "role": "read" }} , 
 	{ "name": "rx_readReqAddr_pop_r_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_1", "role": "din" }} , 
 	{ "name": "rx_readReqAddr_pop_r_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_1", "role": "full_n" }} , 
 	{ "name": "rx_readReqAddr_pop_r_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_1", "role": "write" }} , 
 	{ "name": "mq_releaseFifo_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_releaseFifo_V_V", "role": "din" }} , 
 	{ "name": "mq_releaseFifo_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_releaseFifo_V_V", "role": "full_n" }} , 
 	{ "name": "mq_releaseFifo_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_releaseFifo_V_V", "role": "write" }} , 
 	{ "name": "mq_pointerUpdFifo_V_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_s", "role": "din" }} , 
 	{ "name": "mq_pointerUpdFifo_V_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_s", "role": "full_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_s", "role": "write" }} , 
 	{ "name": "mq_pointerUpdFifo_V_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_1", "role": "din" }} , 
 	{ "name": "mq_pointerUpdFifo_V_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_1", "role": "full_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_1", "role": "write" }} , 
 	{ "name": "mq_pointerUpdFifo_V_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_3", "role": "din" }} , 
 	{ "name": "mq_pointerUpdFifo_V_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_3", "role": "full_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_3", "role": "write" }} , 
 	{ "name": "mq_pointerUpdFifo_V_4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_4", "role": "din" }} , 
 	{ "name": "mq_pointerUpdFifo_V_4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_4", "role": "full_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_4", "role": "write" }} , 
 	{ "name": "mq_metaReqFifo_V_idx_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_idx", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_V_idx_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_idx", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_V_idx_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_idx", "role": "write" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent", "role": "write" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_3", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_3", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_3", "role": "write" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_4", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_4", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_4", "role": "write" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_1", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_1", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_1", "role": "write" }} , 
 	{ "name": "mq_metaReqFifo_V_wri_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_wri", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_V_wri_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_wri", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_V_wri_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_wri", "role": "write" }} , 
 	{ "name": "mq_metaReqFifo_V_app_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_app", "role": "din" }} , 
 	{ "name": "mq_metaReqFifo_V_app_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_app", "role": "full_n" }} , 
 	{ "name": "mq_metaReqFifo_V_app_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_app", "role": "write" }} , 
 	{ "name": "mq_pointerReqFifo_V_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_1", "role": "din" }} , 
 	{ "name": "mq_pointerReqFifo_V_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_1", "role": "full_n" }} , 
 	{ "name": "mq_pointerReqFifo_V_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_1", "role": "write" }} , 
 	{ "name": "mq_pointerReqFifo_V_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_s", "role": "din" }} , 
 	{ "name": "mq_pointerReqFifo_V_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_s", "role": "full_n" }} , 
 	{ "name": "mq_pointerReqFifo_V_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_s", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mq_process_requests",
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
			{"Name" : "rt_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newMetaIdx_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "insert_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "insert_value_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "popRequest_op", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptrMeta_head_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptrMeta_tail_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptrMeta_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_readReqAddr_push_1_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqAddr_push_1_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_readReqAddr_push_s_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqAddr_push_s_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_freeListFifo_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_freeListFifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerReqFifo_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerReqFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerReqFifo_V_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerReqFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_r_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_r_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "popRequest_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_pointerRspFifo_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerRspFifo_V_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerRspFifo_V_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_idx", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_idx_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_wri", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_wri_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_app", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_app_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo_V_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo_V_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo_V_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo_V_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo_V_nex", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_nex_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo_V_val_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_val_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo_V_isT", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_isT_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_r_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_r_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_releaseFifo_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_releaseFifo_V_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	mq_process_requests {
		rt_state {Type IO LastRead -1 FirstWrite -1}
		newMetaIdx_V {Type IO LastRead -1 FirstWrite -1}
		insert_key_V {Type IO LastRead -1 FirstWrite -1}
		insert_value_V {Type IO LastRead -1 FirstWrite -1}
		popRequest_op {Type IO LastRead -1 FirstWrite -1}
		ptrMeta_head_V {Type IO LastRead -1 FirstWrite -1}
		ptrMeta_tail_V {Type IO LastRead -1 FirstWrite -1}
		ptrMeta_valid {Type IO LastRead -1 FirstWrite -1}
		tx_readReqAddr_push_1_1 {Type I LastRead 0 FirstWrite -1}
		tx_readReqAddr_push_s_2 {Type I LastRead 0 FirstWrite -1}
		mq_freeListFifo_V_V {Type I LastRead 0 FirstWrite -1}
		mq_pointerReqFifo_V_1 {Type O LastRead -1 FirstWrite 1}
		mq_pointerReqFifo_V_s {Type O LastRead -1 FirstWrite 1}
		rx_readReqAddr_pop_r_4 {Type I LastRead 0 FirstWrite -1}
		popRequest_key_V {Type IO LastRead -1 FirstWrite -1}
		mq_pointerRspFifo_V_1 {Type I LastRead 0 FirstWrite -1}
		mq_pointerRspFifo_V_2 {Type I LastRead 0 FirstWrite -1}
		mq_pointerRspFifo_V_s {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo_V_idx {Type O LastRead -1 FirstWrite 1}
		mq_metaReqFifo_V_ent {Type O LastRead -1 FirstWrite 1}
		mq_metaReqFifo_V_ent_3 {Type O LastRead -1 FirstWrite 1}
		mq_metaReqFifo_V_ent_4 {Type O LastRead -1 FirstWrite 1}
		mq_metaReqFifo_V_ent_1 {Type O LastRead -1 FirstWrite 1}
		mq_metaReqFifo_V_wri {Type O LastRead -1 FirstWrite 1}
		mq_metaReqFifo_V_app {Type O LastRead -1 FirstWrite 1}
		mq_pointerUpdFifo_V_s {Type O LastRead -1 FirstWrite 1}
		mq_pointerUpdFifo_V_1 {Type O LastRead -1 FirstWrite 1}
		mq_pointerUpdFifo_V_3 {Type O LastRead -1 FirstWrite 1}
		mq_pointerUpdFifo_V_4 {Type O LastRead -1 FirstWrite 1}
		mq_metaRspFifo_V_val {Type I LastRead 0 FirstWrite -1}
		mq_metaRspFifo_V_nex {Type I LastRead 0 FirstWrite -1}
		mq_metaRspFifo_V_val_1 {Type I LastRead 0 FirstWrite -1}
		mq_metaRspFifo_V_isT {Type I LastRead 0 FirstWrite -1}
		rx_readReqAddr_pop_r_1 {Type O LastRead -1 FirstWrite 1}
		mq_releaseFifo_V_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_readReqAddr_push_1_1 { ap_fifo {  { tx_readReqAddr_push_1_1_dout fifo_data 0 16 }  { tx_readReqAddr_push_1_1_empty_n fifo_status 0 1 }  { tx_readReqAddr_push_1_1_read fifo_update 1 1 } } }
	tx_readReqAddr_push_s_2 { ap_fifo {  { tx_readReqAddr_push_s_2_dout fifo_data 0 64 }  { tx_readReqAddr_push_s_2_empty_n fifo_status 0 1 }  { tx_readReqAddr_push_s_2_read fifo_update 1 1 } } }
	mq_freeListFifo_V_V { ap_fifo {  { mq_freeListFifo_V_V_dout fifo_data 0 16 }  { mq_freeListFifo_V_V_empty_n fifo_status 0 1 }  { mq_freeListFifo_V_V_read fifo_update 1 1 } } }
	mq_pointerReqFifo_V_1 { ap_fifo {  { mq_pointerReqFifo_V_1_din fifo_data 1 16 }  { mq_pointerReqFifo_V_1_full_n fifo_status 0 1 }  { mq_pointerReqFifo_V_1_write fifo_update 1 1 } } }
	mq_pointerReqFifo_V_s { ap_fifo {  { mq_pointerReqFifo_V_s_din fifo_data 1 1 }  { mq_pointerReqFifo_V_s_full_n fifo_status 0 1 }  { mq_pointerReqFifo_V_s_write fifo_update 1 1 } } }
	rx_readReqAddr_pop_r_4 { ap_fifo {  { rx_readReqAddr_pop_r_4_dout fifo_data 0 17 }  { rx_readReqAddr_pop_r_4_empty_n fifo_status 0 1 }  { rx_readReqAddr_pop_r_4_read fifo_update 1 1 } } }
	mq_pointerRspFifo_V_1 { ap_fifo {  { mq_pointerRspFifo_V_1_dout fifo_data 0 16 }  { mq_pointerRspFifo_V_1_empty_n fifo_status 0 1 }  { mq_pointerRspFifo_V_1_read fifo_update 1 1 } } }
	mq_pointerRspFifo_V_2 { ap_fifo {  { mq_pointerRspFifo_V_2_dout fifo_data 0 16 }  { mq_pointerRspFifo_V_2_empty_n fifo_status 0 1 }  { mq_pointerRspFifo_V_2_read fifo_update 1 1 } } }
	mq_pointerRspFifo_V_s { ap_fifo {  { mq_pointerRspFifo_V_s_dout fifo_data 0 1 }  { mq_pointerRspFifo_V_s_empty_n fifo_status 0 1 }  { mq_pointerRspFifo_V_s_read fifo_update 1 1 } } }
	mq_metaReqFifo_V_idx { ap_fifo {  { mq_metaReqFifo_V_idx_din fifo_data 1 16 }  { mq_metaReqFifo_V_idx_full_n fifo_status 0 1 }  { mq_metaReqFifo_V_idx_write fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent { ap_fifo {  { mq_metaReqFifo_V_ent_din fifo_data 1 64 }  { mq_metaReqFifo_V_ent_full_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_write fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent_3 { ap_fifo {  { mq_metaReqFifo_V_ent_3_din fifo_data 1 16 }  { mq_metaReqFifo_V_ent_3_full_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_3_write fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent_4 { ap_fifo {  { mq_metaReqFifo_V_ent_4_din fifo_data 1 1 }  { mq_metaReqFifo_V_ent_4_full_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_4_write fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent_1 { ap_fifo {  { mq_metaReqFifo_V_ent_1_din fifo_data 1 1 }  { mq_metaReqFifo_V_ent_1_full_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_1_write fifo_update 1 1 } } }
	mq_metaReqFifo_V_wri { ap_fifo {  { mq_metaReqFifo_V_wri_din fifo_data 1 1 }  { mq_metaReqFifo_V_wri_full_n fifo_status 0 1 }  { mq_metaReqFifo_V_wri_write fifo_update 1 1 } } }
	mq_metaReqFifo_V_app { ap_fifo {  { mq_metaReqFifo_V_app_din fifo_data 1 1 }  { mq_metaReqFifo_V_app_full_n fifo_status 0 1 }  { mq_metaReqFifo_V_app_write fifo_update 1 1 } } }
	mq_pointerUpdFifo_V_s { ap_fifo {  { mq_pointerUpdFifo_V_s_din fifo_data 1 16 }  { mq_pointerUpdFifo_V_s_full_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_s_write fifo_update 1 1 } } }
	mq_pointerUpdFifo_V_1 { ap_fifo {  { mq_pointerUpdFifo_V_1_din fifo_data 1 16 }  { mq_pointerUpdFifo_V_1_full_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_1_write fifo_update 1 1 } } }
	mq_pointerUpdFifo_V_3 { ap_fifo {  { mq_pointerUpdFifo_V_3_din fifo_data 1 16 }  { mq_pointerUpdFifo_V_3_full_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_3_write fifo_update 1 1 } } }
	mq_pointerUpdFifo_V_4 { ap_fifo {  { mq_pointerUpdFifo_V_4_din fifo_data 1 1 }  { mq_pointerUpdFifo_V_4_full_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_4_write fifo_update 1 1 } } }
	mq_metaRspFifo_V_val { ap_fifo {  { mq_metaRspFifo_V_val_dout fifo_data 0 64 }  { mq_metaRspFifo_V_val_empty_n fifo_status 0 1 }  { mq_metaRspFifo_V_val_read fifo_update 1 1 } } }
	mq_metaRspFifo_V_nex { ap_fifo {  { mq_metaRspFifo_V_nex_dout fifo_data 0 16 }  { mq_metaRspFifo_V_nex_empty_n fifo_status 0 1 }  { mq_metaRspFifo_V_nex_read fifo_update 1 1 } } }
	mq_metaRspFifo_V_val_1 { ap_fifo {  { mq_metaRspFifo_V_val_1_dout fifo_data 0 1 }  { mq_metaRspFifo_V_val_1_empty_n fifo_status 0 1 }  { mq_metaRspFifo_V_val_1_read fifo_update 1 1 } } }
	mq_metaRspFifo_V_isT { ap_fifo {  { mq_metaRspFifo_V_isT_dout fifo_data 0 1 }  { mq_metaRspFifo_V_isT_empty_n fifo_status 0 1 }  { mq_metaRspFifo_V_isT_read fifo_update 1 1 } } }
	rx_readReqAddr_pop_r_1 { ap_fifo {  { rx_readReqAddr_pop_r_1_din fifo_data 1 64 }  { rx_readReqAddr_pop_r_1_full_n fifo_status 0 1 }  { rx_readReqAddr_pop_r_1_write fifo_update 1 1 } } }
	mq_releaseFifo_V_V { ap_fifo {  { mq_releaseFifo_V_V_din fifo_data 1 16 }  { mq_releaseFifo_V_V_full_n fifo_status 0 1 }  { mq_releaseFifo_V_V_write fifo_update 1 1 } } }
}
