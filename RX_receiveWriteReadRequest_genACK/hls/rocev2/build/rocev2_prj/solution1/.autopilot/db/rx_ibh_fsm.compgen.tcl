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
    id 122 \
    name regInvalidPsnDropCount_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_regInvalidPsnDropCount_V \
    op interface \
    ports { regInvalidPsnDropCount_V { O 32 vector } regInvalidPsnDropCount_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name rx_ibh2fsm_MetaFifo_s_9 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2fsm_MetaFifo_s_9 \
    op interface \
    ports { rx_ibh2fsm_MetaFifo_s_9_dout { I 92 vector } rx_ibh2fsm_MetaFifo_s_9_empty_n { I 1 bit } rx_ibh2fsm_MetaFifo_s_9_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name rx_exhMetaFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhMetaFifo_V \
    op interface \
    ports { rx_exhMetaFifo_V_dout { I 23 vector } rx_exhMetaFifo_V_empty_n { I 1 bit } rx_exhMetaFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name rxIbh2stateTable_upd_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxIbh2stateTable_upd_1 \
    op interface \
    ports { rxIbh2stateTable_upd_1_din { O 45 vector } rxIbh2stateTable_upd_1_full_n { I 1 bit } rxIbh2stateTable_upd_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name stateTable2rxIbh_rsp_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stateTable2rxIbh_rsp_1 \
    op interface \
    ports { stateTable2rxIbh_rsp_1_dout { I 75 vector } stateTable2rxIbh_rsp_1_empty_n { I 1 bit } stateTable2rxIbh_rsp_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name rx_ibhDropFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDropFifo_V \
    op interface \
    ports { rx_ibhDropFifo_V_din { O 1 vector } rx_ibhDropFifo_V_full_n { I 1 bit } rx_ibhDropFifo_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name rx_ibhDropMetaFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDropMetaFifo_V \
    op interface \
    ports { rx_ibhDropMetaFifo_V_din { O 2 vector } rx_ibhDropMetaFifo_V_full_n { I 1 bit } rx_ibhDropMetaFifo_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name rx_fsm2exh_MetaFifo_s_11 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_fsm2exh_MetaFifo_s_11 \
    op interface \
    ports { rx_fsm2exh_MetaFifo_s_11_din { O 92 vector } rx_fsm2exh_MetaFifo_s_11_full_n { I 1 bit } rx_fsm2exh_MetaFifo_s_11_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name rx_ibhEventFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhEventFifo_V \
    op interface \
    ports { rx_ibhEventFifo_V_din { O 50 vector } rx_ibhEventFifo_V_full_n { I 1 bit } rx_ibhEventFifo_V_write { O 1 bit } } \
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


