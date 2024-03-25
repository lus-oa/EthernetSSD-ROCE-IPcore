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
    id 301 \
    name tx_ibhMetaFifo_V_op_s \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_op_s \
    op interface \
    ports { tx_ibhMetaFifo_V_op_s_dout { I 5 vector } tx_ibhMetaFifo_V_op_s_empty_n { I 1 bit } tx_ibhMetaFifo_V_op_s_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 302 \
    name tx_ibhMetaFifo_V_par \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_par \
    op interface \
    ports { tx_ibhMetaFifo_V_par_dout { I 16 vector } tx_ibhMetaFifo_V_par_empty_n { I 1 bit } tx_ibhMetaFifo_V_par_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 303 \
    name tx_ibhMetaFifo_V_des \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_des \
    op interface \
    ports { tx_ibhMetaFifo_V_des_dout { I 24 vector } tx_ibhMetaFifo_V_des_empty_n { I 1 bit } tx_ibhMetaFifo_V_des_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 304 \
    name tx_ibhMetaFifo_V_psn \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_psn \
    op interface \
    ports { tx_ibhMetaFifo_V_psn_dout { I 24 vector } tx_ibhMetaFifo_V_psn_empty_n { I 1 bit } tx_ibhMetaFifo_V_psn_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 305 \
    name tx_ibhMetaFifo_V_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_val \
    op interface \
    ports { tx_ibhMetaFifo_V_val_dout { I 1 vector } tx_ibhMetaFifo_V_val_empty_n { I 1 bit } tx_ibhMetaFifo_V_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 306 \
    name tx_ibhMetaFifo_V_num \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhMetaFifo_V_num \
    op interface \
    ports { tx_ibhMetaFifo_V_num_dout { I 22 vector } tx_ibhMetaFifo_V_num_empty_n { I 1 bit } tx_ibhMetaFifo_V_num_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 307 \
    name tx_dstQpFifo_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_dstQpFifo_V_V \
    op interface \
    ports { tx_dstQpFifo_V_V_dout { I 24 vector } tx_dstQpFifo_V_V_empty_n { I 1 bit } tx_dstQpFifo_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 308 \
    name tx_ibhHeaderFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ibhHeaderFifo_V \
    op interface \
    ports { tx_ibhHeaderFifo_V_din { O 113 vector } tx_ibhHeaderFifo_V_full_n { I 1 bit } tx_ibhHeaderFifo_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 309 \
    name txIbh2stateTable_upd_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txIbh2stateTable_upd_1 \
    op interface \
    ports { txIbh2stateTable_upd_1_din { O 41 vector } txIbh2stateTable_upd_1_full_n { I 1 bit } txIbh2stateTable_upd_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 310 \
    name stateTable2txIbh_rsp_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stateTable2txIbh_rsp_1 \
    op interface \
    ports { stateTable2txIbh_rsp_1_dout { I 123 vector } stateTable2txIbh_rsp_1_empty_n { I 1 bit } stateTable2txIbh_rsp_1_read { O 1 bit } } \
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


