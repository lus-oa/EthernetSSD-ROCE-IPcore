# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 241 \
    name rx_ackEventFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ackEventFifo_V \
    op interface \
    ports { rx_ackEventFifo_V_dout { I 50 vector } rx_ackEventFifo_V_empty_n { I 1 bit } rx_ackEventFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 242 \
    name tx_ibhconnTable_req_s_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhconnTable_req_s_3 \
    op interface \
    ports { tx_ibhconnTable_req_s_3_din { O 16 vector } tx_ibhconnTable_req_s_3_full_n { I 1 bit } tx_ibhconnTable_req_s_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 243 \
    name tx_ibhMetaFifo_V_op_s \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_op_s \
    op interface \
    ports { tx_ibhMetaFifo_V_op_s_din { O 5 vector } tx_ibhMetaFifo_V_op_s_full_n { I 1 bit } tx_ibhMetaFifo_V_op_s_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name tx_ibhMetaFifo_V_par \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_par \
    op interface \
    ports { tx_ibhMetaFifo_V_par_din { O 16 vector } tx_ibhMetaFifo_V_par_full_n { I 1 bit } tx_ibhMetaFifo_V_par_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 245 \
    name tx_ibhMetaFifo_V_des \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_des \
    op interface \
    ports { tx_ibhMetaFifo_V_des_din { O 24 vector } tx_ibhMetaFifo_V_des_full_n { I 1 bit } tx_ibhMetaFifo_V_des_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 246 \
    name tx_ibhMetaFifo_V_psn \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_psn \
    op interface \
    ports { tx_ibhMetaFifo_V_psn_din { O 24 vector } tx_ibhMetaFifo_V_psn_full_n { I 1 bit } tx_ibhMetaFifo_V_psn_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 247 \
    name tx_ibhMetaFifo_V_val \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_val \
    op interface \
    ports { tx_ibhMetaFifo_V_val_din { O 1 vector } tx_ibhMetaFifo_V_val_full_n { I 1 bit } tx_ibhMetaFifo_V_val_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 248 \
    name tx_ibhMetaFifo_V_num \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_num \
    op interface \
    ports { tx_ibhMetaFifo_V_num_din { O 22 vector } tx_ibhMetaFifo_V_num_full_n { I 1 bit } tx_ibhMetaFifo_V_num_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 249 \
    name tx_exhMetaFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exhMetaFifo_V \
    op interface \
    ports { tx_exhMetaFifo_V_din { O 135 vector } tx_exhMetaFifo_V_full_n { I 1 bit } tx_exhMetaFifo_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 250 \
    name rx_readEvenFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readEvenFifo_V \
    op interface \
    ports { rx_readEvenFifo_V_dout { I 135 vector } rx_readEvenFifo_V_empty_n { I 1 bit } rx_readEvenFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 251 \
    name tx_appMetaFifo_V_op_s \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_op_s \
    op interface \
    ports { tx_appMetaFifo_V_op_s_dout { I 5 vector } tx_appMetaFifo_V_op_s_empty_n { I 1 bit } tx_appMetaFifo_V_op_s_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 252 \
    name tx_appMetaFifo_V_qpn \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_qpn \
    op interface \
    ports { tx_appMetaFifo_V_qpn_dout { I 24 vector } tx_appMetaFifo_V_qpn_empty_n { I 1 bit } tx_appMetaFifo_V_qpn_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 253 \
    name tx_appMetaFifo_V_add \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_add \
    op interface \
    ports { tx_appMetaFifo_V_add_dout { I 48 vector } tx_appMetaFifo_V_add_empty_n { I 1 bit } tx_appMetaFifo_V_add_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 254 \
    name tx_appMetaFifo_V_len \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_len \
    op interface \
    ports { tx_appMetaFifo_V_len_dout { I 32 vector } tx_appMetaFifo_V_len_empty_n { I 1 bit } tx_appMetaFifo_V_len_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 255 \
    name tx_appMetaFifo_V_psn \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_psn \
    op interface \
    ports { tx_appMetaFifo_V_psn_dout { I 24 vector } tx_appMetaFifo_V_psn_empty_n { I 1 bit } tx_appMetaFifo_V_psn_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 256 \
    name tx_appMetaFifo_V_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_val \
    op interface \
    ports { tx_appMetaFifo_V_val_dout { I 1 vector } tx_appMetaFifo_V_val_empty_n { I 1 bit } tx_appMetaFifo_V_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 257 \
    name tx_appMetaFifo_V_isN \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_isN \
    op interface \
    ports { tx_appMetaFifo_V_isN_dout { I 1 vector } tx_appMetaFifo_V_isN_empty_n { I 1 bit } tx_appMetaFifo_V_isN_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


