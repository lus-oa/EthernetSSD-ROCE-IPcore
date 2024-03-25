set moduleName meta_merger
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
set C_modelName {meta_merger}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ackEventFifo_V int 50 regular {fifo 0 volatile } {global 0}  }
	{ tx_ibhconnTable_req_s_3 int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_ibhMetaFifo_V_op_s int 5 regular {fifo 1 volatile } {global 1}  }
	{ tx_ibhMetaFifo_V_par int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_ibhMetaFifo_V_des int 24 regular {fifo 1 volatile } {global 1}  }
	{ tx_ibhMetaFifo_V_psn int 24 regular {fifo 1 volatile } {global 1}  }
	{ tx_ibhMetaFifo_V_val int 1 regular {fifo 1 volatile } {global 1}  }
	{ tx_ibhMetaFifo_V_num int 22 regular {fifo 1 volatile } {global 1}  }
	{ tx_exhMetaFifo_V int 135 regular {fifo 1 volatile } {global 1}  }
	{ rx_readEvenFifo_V int 135 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo_V_op_s int 5 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo_V_qpn int 24 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo_V_add int 48 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo_V_len int 32 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo_V_psn int 24 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo_V_val int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_appMetaFifo_V_isN int 1 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ackEventFifo_V", "interface" : "fifo", "bitwidth" : 50, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhconnTable_req_s_3", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhMetaFifo_V_op_s", "interface" : "fifo", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhMetaFifo_V_par", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhMetaFifo_V_des", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhMetaFifo_V_psn", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhMetaFifo_V_val", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ibhMetaFifo_V_num", "interface" : "fifo", "bitwidth" : 22, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_exhMetaFifo_V", "interface" : "fifo", "bitwidth" : 135, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readEvenFifo_V", "interface" : "fifo", "bitwidth" : 135, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_op_s", "interface" : "fifo", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_qpn", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_add", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_len", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_psn", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_val", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_isN", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 58
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_ackEventFifo_V_dout sc_in sc_lv 50 signal 0 } 
	{ rx_ackEventFifo_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ackEventFifo_V_read sc_out sc_logic 1 signal 0 } 
	{ rx_readEvenFifo_V_dout sc_in sc_lv 135 signal 9 } 
	{ rx_readEvenFifo_V_empty_n sc_in sc_logic 1 signal 9 } 
	{ rx_readEvenFifo_V_read sc_out sc_logic 1 signal 9 } 
	{ tx_appMetaFifo_V_op_s_dout sc_in sc_lv 5 signal 10 } 
	{ tx_appMetaFifo_V_op_s_empty_n sc_in sc_logic 1 signal 10 } 
	{ tx_appMetaFifo_V_op_s_read sc_out sc_logic 1 signal 10 } 
	{ tx_appMetaFifo_V_qpn_dout sc_in sc_lv 24 signal 11 } 
	{ tx_appMetaFifo_V_qpn_empty_n sc_in sc_logic 1 signal 11 } 
	{ tx_appMetaFifo_V_qpn_read sc_out sc_logic 1 signal 11 } 
	{ tx_appMetaFifo_V_add_dout sc_in sc_lv 48 signal 12 } 
	{ tx_appMetaFifo_V_add_empty_n sc_in sc_logic 1 signal 12 } 
	{ tx_appMetaFifo_V_add_read sc_out sc_logic 1 signal 12 } 
	{ tx_appMetaFifo_V_len_dout sc_in sc_lv 32 signal 13 } 
	{ tx_appMetaFifo_V_len_empty_n sc_in sc_logic 1 signal 13 } 
	{ tx_appMetaFifo_V_len_read sc_out sc_logic 1 signal 13 } 
	{ tx_appMetaFifo_V_psn_dout sc_in sc_lv 24 signal 14 } 
	{ tx_appMetaFifo_V_psn_empty_n sc_in sc_logic 1 signal 14 } 
	{ tx_appMetaFifo_V_psn_read sc_out sc_logic 1 signal 14 } 
	{ tx_appMetaFifo_V_val_dout sc_in sc_lv 1 signal 15 } 
	{ tx_appMetaFifo_V_val_empty_n sc_in sc_logic 1 signal 15 } 
	{ tx_appMetaFifo_V_val_read sc_out sc_logic 1 signal 15 } 
	{ tx_appMetaFifo_V_isN_dout sc_in sc_lv 1 signal 16 } 
	{ tx_appMetaFifo_V_isN_empty_n sc_in sc_logic 1 signal 16 } 
	{ tx_appMetaFifo_V_isN_read sc_out sc_logic 1 signal 16 } 
	{ tx_ibhconnTable_req_s_3_din sc_out sc_lv 16 signal 1 } 
	{ tx_ibhconnTable_req_s_3_full_n sc_in sc_logic 1 signal 1 } 
	{ tx_ibhconnTable_req_s_3_write sc_out sc_logic 1 signal 1 } 
	{ tx_ibhMetaFifo_V_op_s_din sc_out sc_lv 5 signal 2 } 
	{ tx_ibhMetaFifo_V_op_s_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_ibhMetaFifo_V_op_s_write sc_out sc_logic 1 signal 2 } 
	{ tx_ibhMetaFifo_V_par_din sc_out sc_lv 16 signal 3 } 
	{ tx_ibhMetaFifo_V_par_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_ibhMetaFifo_V_par_write sc_out sc_logic 1 signal 3 } 
	{ tx_ibhMetaFifo_V_des_din sc_out sc_lv 24 signal 4 } 
	{ tx_ibhMetaFifo_V_des_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_ibhMetaFifo_V_des_write sc_out sc_logic 1 signal 4 } 
	{ tx_ibhMetaFifo_V_psn_din sc_out sc_lv 24 signal 5 } 
	{ tx_ibhMetaFifo_V_psn_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_ibhMetaFifo_V_psn_write sc_out sc_logic 1 signal 5 } 
	{ tx_ibhMetaFifo_V_val_din sc_out sc_lv 1 signal 6 } 
	{ tx_ibhMetaFifo_V_val_full_n sc_in sc_logic 1 signal 6 } 
	{ tx_ibhMetaFifo_V_val_write sc_out sc_logic 1 signal 6 } 
	{ tx_ibhMetaFifo_V_num_din sc_out sc_lv 22 signal 7 } 
	{ tx_ibhMetaFifo_V_num_full_n sc_in sc_logic 1 signal 7 } 
	{ tx_ibhMetaFifo_V_num_write sc_out sc_logic 1 signal 7 } 
	{ tx_exhMetaFifo_V_din sc_out sc_lv 135 signal 8 } 
	{ tx_exhMetaFifo_V_full_n sc_in sc_logic 1 signal 8 } 
	{ tx_exhMetaFifo_V_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_ackEventFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "rx_ackEventFifo_V", "role": "dout" }} , 
 	{ "name": "rx_ackEventFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo_V", "role": "empty_n" }} , 
 	{ "name": "rx_ackEventFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ackEventFifo_V", "role": "read" }} , 
 	{ "name": "rx_readEvenFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":135, "type": "signal", "bundle":{"name": "rx_readEvenFifo_V", "role": "dout" }} , 
 	{ "name": "rx_readEvenFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readEvenFifo_V", "role": "empty_n" }} , 
 	{ "name": "rx_readEvenFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readEvenFifo_V", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_V_op_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_op_s", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_V_op_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_op_s", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_V_op_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_op_s", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_V_qpn_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_qpn", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_V_qpn_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_qpn", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_V_qpn_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_qpn", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_V_add_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_add", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_V_add_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_add", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_V_add_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_add", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_V_len_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_len", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_V_len_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_len", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_V_len_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_len", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_V_psn_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_psn", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_V_psn_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_psn", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_V_psn_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_psn", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_V_val_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_val", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_V_val_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_val", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_V_val_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_val", "role": "read" }} , 
 	{ "name": "tx_appMetaFifo_V_isN_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_isN", "role": "dout" }} , 
 	{ "name": "tx_appMetaFifo_V_isN_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_isN", "role": "empty_n" }} , 
 	{ "name": "tx_appMetaFifo_V_isN_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_isN", "role": "read" }} , 
 	{ "name": "tx_ibhconnTable_req_s_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req_s_3", "role": "din" }} , 
 	{ "name": "tx_ibhconnTable_req_s_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req_s_3", "role": "full_n" }} , 
 	{ "name": "tx_ibhconnTable_req_s_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req_s_3", "role": "write" }} , 
 	{ "name": "tx_ibhMetaFifo_V_op_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_op_s", "role": "din" }} , 
 	{ "name": "tx_ibhMetaFifo_V_op_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_op_s", "role": "full_n" }} , 
 	{ "name": "tx_ibhMetaFifo_V_op_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_op_s", "role": "write" }} , 
 	{ "name": "tx_ibhMetaFifo_V_par_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_par", "role": "din" }} , 
 	{ "name": "tx_ibhMetaFifo_V_par_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_par", "role": "full_n" }} , 
 	{ "name": "tx_ibhMetaFifo_V_par_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_par", "role": "write" }} , 
 	{ "name": "tx_ibhMetaFifo_V_des_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_des", "role": "din" }} , 
 	{ "name": "tx_ibhMetaFifo_V_des_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_des", "role": "full_n" }} , 
 	{ "name": "tx_ibhMetaFifo_V_des_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_des", "role": "write" }} , 
 	{ "name": "tx_ibhMetaFifo_V_psn_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_psn", "role": "din" }} , 
 	{ "name": "tx_ibhMetaFifo_V_psn_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_psn", "role": "full_n" }} , 
 	{ "name": "tx_ibhMetaFifo_V_psn_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_psn", "role": "write" }} , 
 	{ "name": "tx_ibhMetaFifo_V_val_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_val", "role": "din" }} , 
 	{ "name": "tx_ibhMetaFifo_V_val_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_val", "role": "full_n" }} , 
 	{ "name": "tx_ibhMetaFifo_V_val_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_val", "role": "write" }} , 
 	{ "name": "tx_ibhMetaFifo_V_num_din", "direction": "out", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_num", "role": "din" }} , 
 	{ "name": "tx_ibhMetaFifo_V_num_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_num", "role": "full_n" }} , 
 	{ "name": "tx_ibhMetaFifo_V_num_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhMetaFifo_V_num", "role": "write" }} , 
 	{ "name": "tx_exhMetaFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":135, "type": "signal", "bundle":{"name": "tx_exhMetaFifo_V", "role": "din" }} , 
 	{ "name": "tx_exhMetaFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo_V", "role": "full_n" }} , 
 	{ "name": "tx_exhMetaFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "meta_merger",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "rx_ackEventFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ackEventFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhconnTable_req_s_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhconnTable_req_s_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhMetaFifo_V_op_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_V_op_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhMetaFifo_V_par", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_V_par_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhMetaFifo_V_des", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_V_des_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhMetaFifo_V_psn", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_V_psn_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhMetaFifo_V_val", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_V_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhMetaFifo_V_num", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhMetaFifo_V_num_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exhMetaFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exhMetaFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readEvenFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readEvenFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_op_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_op_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_qpn", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_qpn_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_add", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_add_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_len", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_len_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_psn", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_psn_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_isN", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_isN_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	meta_merger {
		rx_ackEventFifo_V {Type I LastRead 0 FirstWrite -1}
		tx_ibhconnTable_req_s_3 {Type O LastRead -1 FirstWrite 3}
		tx_ibhMetaFifo_V_op_s {Type O LastRead -1 FirstWrite 3}
		tx_ibhMetaFifo_V_par {Type O LastRead -1 FirstWrite 3}
		tx_ibhMetaFifo_V_des {Type O LastRead -1 FirstWrite 3}
		tx_ibhMetaFifo_V_psn {Type O LastRead -1 FirstWrite 3}
		tx_ibhMetaFifo_V_val {Type O LastRead -1 FirstWrite 3}
		tx_ibhMetaFifo_V_num {Type O LastRead -1 FirstWrite 3}
		tx_exhMetaFifo_V {Type O LastRead -1 FirstWrite 3}
		rx_readEvenFifo_V {Type I LastRead 1 FirstWrite -1}
		tx_appMetaFifo_V_op_s {Type I LastRead 2 FirstWrite -1}
		tx_appMetaFifo_V_qpn {Type I LastRead 2 FirstWrite -1}
		tx_appMetaFifo_V_add {Type I LastRead 2 FirstWrite -1}
		tx_appMetaFifo_V_len {Type I LastRead 2 FirstWrite -1}
		tx_appMetaFifo_V_psn {Type I LastRead 2 FirstWrite -1}
		tx_appMetaFifo_V_val {Type I LastRead 2 FirstWrite -1}
		tx_appMetaFifo_V_isN {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ackEventFifo_V { ap_fifo {  { rx_ackEventFifo_V_dout fifo_data 0 50 }  { rx_ackEventFifo_V_empty_n fifo_status 0 1 }  { rx_ackEventFifo_V_read fifo_update 1 1 } } }
	tx_ibhconnTable_req_s_3 { ap_fifo {  { tx_ibhconnTable_req_s_3_din fifo_data 1 16 }  { tx_ibhconnTable_req_s_3_full_n fifo_status 0 1 }  { tx_ibhconnTable_req_s_3_write fifo_update 1 1 } } }
	tx_ibhMetaFifo_V_op_s { ap_fifo {  { tx_ibhMetaFifo_V_op_s_din fifo_data 1 5 }  { tx_ibhMetaFifo_V_op_s_full_n fifo_status 0 1 }  { tx_ibhMetaFifo_V_op_s_write fifo_update 1 1 } } }
	tx_ibhMetaFifo_V_par { ap_fifo {  { tx_ibhMetaFifo_V_par_din fifo_data 1 16 }  { tx_ibhMetaFifo_V_par_full_n fifo_status 0 1 }  { tx_ibhMetaFifo_V_par_write fifo_update 1 1 } } }
	tx_ibhMetaFifo_V_des { ap_fifo {  { tx_ibhMetaFifo_V_des_din fifo_data 1 24 }  { tx_ibhMetaFifo_V_des_full_n fifo_status 0 1 }  { tx_ibhMetaFifo_V_des_write fifo_update 1 1 } } }
	tx_ibhMetaFifo_V_psn { ap_fifo {  { tx_ibhMetaFifo_V_psn_din fifo_data 1 24 }  { tx_ibhMetaFifo_V_psn_full_n fifo_status 0 1 }  { tx_ibhMetaFifo_V_psn_write fifo_update 1 1 } } }
	tx_ibhMetaFifo_V_val { ap_fifo {  { tx_ibhMetaFifo_V_val_din fifo_data 1 1 }  { tx_ibhMetaFifo_V_val_full_n fifo_status 0 1 }  { tx_ibhMetaFifo_V_val_write fifo_update 1 1 } } }
	tx_ibhMetaFifo_V_num { ap_fifo {  { tx_ibhMetaFifo_V_num_din fifo_data 1 22 }  { tx_ibhMetaFifo_V_num_full_n fifo_status 0 1 }  { tx_ibhMetaFifo_V_num_write fifo_update 1 1 } } }
	tx_exhMetaFifo_V { ap_fifo {  { tx_exhMetaFifo_V_din fifo_data 1 135 }  { tx_exhMetaFifo_V_full_n fifo_status 0 1 }  { tx_exhMetaFifo_V_write fifo_update 1 1 } } }
	rx_readEvenFifo_V { ap_fifo {  { rx_readEvenFifo_V_dout fifo_data 0 135 }  { rx_readEvenFifo_V_empty_n fifo_status 0 1 }  { rx_readEvenFifo_V_read fifo_update 1 1 } } }
	tx_appMetaFifo_V_op_s { ap_fifo {  { tx_appMetaFifo_V_op_s_dout fifo_data 0 5 }  { tx_appMetaFifo_V_op_s_empty_n fifo_status 0 1 }  { tx_appMetaFifo_V_op_s_read fifo_update 1 1 } } }
	tx_appMetaFifo_V_qpn { ap_fifo {  { tx_appMetaFifo_V_qpn_dout fifo_data 0 24 }  { tx_appMetaFifo_V_qpn_empty_n fifo_status 0 1 }  { tx_appMetaFifo_V_qpn_read fifo_update 1 1 } } }
	tx_appMetaFifo_V_add { ap_fifo {  { tx_appMetaFifo_V_add_dout fifo_data 0 48 }  { tx_appMetaFifo_V_add_empty_n fifo_status 0 1 }  { tx_appMetaFifo_V_add_read fifo_update 1 1 } } }
	tx_appMetaFifo_V_len { ap_fifo {  { tx_appMetaFifo_V_len_dout fifo_data 0 32 }  { tx_appMetaFifo_V_len_empty_n fifo_status 0 1 }  { tx_appMetaFifo_V_len_read fifo_update 1 1 } } }
	tx_appMetaFifo_V_psn { ap_fifo {  { tx_appMetaFifo_V_psn_dout fifo_data 0 24 }  { tx_appMetaFifo_V_psn_empty_n fifo_status 0 1 }  { tx_appMetaFifo_V_psn_read fifo_update 1 1 } } }
	tx_appMetaFifo_V_val { ap_fifo {  { tx_appMetaFifo_V_val_dout fifo_data 0 1 }  { tx_appMetaFifo_V_val_empty_n fifo_status 0 1 }  { tx_appMetaFifo_V_val_read fifo_update 1 1 } } }
	tx_appMetaFifo_V_isN { ap_fifo {  { tx_appMetaFifo_V_isN_dout fifo_data 0 1 }  { tx_appMetaFifo_V_isN_empty_n fifo_status 0 1 }  { tx_appMetaFifo_V_isN_read fifo_update 1 1 } } }
}
