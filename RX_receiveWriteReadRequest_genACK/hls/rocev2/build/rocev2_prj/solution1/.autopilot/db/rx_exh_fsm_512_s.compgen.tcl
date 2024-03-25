# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 146 \
    name memoryWriteCmd_V_dat \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_write_cmd} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_write_cmd_TDATA { O 96 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'memoryWriteCmd_V_dat'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 147 \
    name memoryWriteCmd_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_write_cmd} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_write_cmd_TREADY { I 1 bit } m_axis_mem_write_cmd_TVALID { O 1 bit } m_axis_mem_write_cmd_TDEST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'memoryWriteCmd_V_dest_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name rx_fsm2exh_MetaFifo_s_11 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_fsm2exh_MetaFifo_s_11 \
    op interface \
    ports { rx_fsm2exh_MetaFifo_s_11_dout { I 92 vector } rx_fsm2exh_MetaFifo_s_11_empty_n { I 1 bit } rx_fsm2exh_MetaFifo_s_11_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name rx_drop2exhFsm_MetaF_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_drop2exhFsm_MetaF_1 \
    op interface \
    ports { rx_drop2exhFsm_MetaF_1_dout { I 241 vector } rx_drop2exhFsm_MetaF_1_empty_n { I 1 bit } rx_drop2exhFsm_MetaF_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name rxExh2msnTable_upd_r_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rxExh2msnTable_upd_r_1 \
    op interface \
    ports { rxExh2msnTable_upd_r_1_din { O 137 vector } rxExh2msnTable_upd_r_1_full_n { I 1 bit } rxExh2msnTable_upd_r_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name rx_readReqAddr_pop_r_4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_r_4 \
    op interface \
    ports { rx_readReqAddr_pop_r_4_din { O 17 vector } rx_readReqAddr_pop_r_4_full_n { I 1 bit } rx_readReqAddr_pop_r_4_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name msnTable2rxExh_rsp_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_msnTable2rxExh_rsp_V \
    op interface \
    ports { msnTable2rxExh_rsp_V_dout { I 152 vector } msnTable2rxExh_rsp_V_empty_n { I 1 bit } msnTable2rxExh_rsp_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name exh_lengthFifo_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_exh_lengthFifo_V_V \
    op interface \
    ports { exh_lengthFifo_V_V_dout { I 16 vector } exh_lengthFifo_V_V_empty_n { I 1 bit } exh_lengthFifo_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name rx_readReqAddr_pop_r_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_r_1 \
    op interface \
    ports { rx_readReqAddr_pop_r_1_dout { I 64 vector } rx_readReqAddr_pop_r_1_empty_n { I 1 bit } rx_readReqAddr_pop_r_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name rx_exhEventMetaFifo_s_12 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhEventMetaFifo_s_12 \
    op interface \
    ports { rx_exhEventMetaFifo_s_12_din { O 50 vector } rx_exhEventMetaFifo_s_12_full_n { I 1 bit } rx_exhEventMetaFifo_s_12_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name rx_pkgSplitTypeFifo_s_7 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_pkgSplitTypeFifo_s_7 \
    op interface \
    ports { rx_pkgSplitTypeFifo_s_7_din { O 6 vector } rx_pkgSplitTypeFifo_s_7_full_n { I 1 bit } rx_pkgSplitTypeFifo_s_7_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name rx_pkgShiftTypeFifo_s_8 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_pkgShiftTypeFifo_s_8 \
    op interface \
    ports { rx_pkgShiftTypeFifo_s_8_din { O 2 vector } rx_pkgShiftTypeFifo_s_8_full_n { I 1 bit } rx_pkgShiftTypeFifo_s_8_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name rx_readRequestFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readRequestFifo_V \
    op interface \
    ports { rx_readRequestFifo_V_din { O 129 vector } rx_readRequestFifo_V_full_n { I 1 bit } rx_readRequestFifo_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name rx_readReqTable_upd_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqTable_upd_1 \
    op interface \
    ports { rx_readReqTable_upd_1_din { O 41 vector } rx_readReqTable_upd_1_full_n { I 1 bit } rx_readReqTable_upd_1_write { O 1 bit } } \
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


