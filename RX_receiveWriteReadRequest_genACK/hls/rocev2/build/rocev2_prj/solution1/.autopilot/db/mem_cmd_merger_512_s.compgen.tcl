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
    id 325 \
    name out_V_data \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_read_cmd} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_read_cmd_TDATA { O 96 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_V_data'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 326 \
    name out_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_read_cmd} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_read_cmd_TREADY { I 1 bit } m_axis_mem_read_cmd_TVALID { O 1 bit } m_axis_mem_read_cmd_TDEST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_V_dest_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 327 \
    name rx_remoteMemCmd_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_remoteMemCmd_V \
    op interface \
    ports { rx_remoteMemCmd_V_dout { I 113 vector } rx_remoteMemCmd_V_empty_n { I 1 bit } rx_remoteMemCmd_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 328 \
    name tx_pkgInfoFifo_V_typ \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_pkgInfoFifo_V_typ \
    op interface \
    ports { tx_pkgInfoFifo_V_typ_din { O 1 vector } tx_pkgInfoFifo_V_typ_full_n { I 1 bit } tx_pkgInfoFifo_V_typ_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 329 \
    name tx_pkgInfoFifo_V_sou \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_pkgInfoFifo_V_sou \
    op interface \
    ports { tx_pkgInfoFifo_V_sou_din { O 1 vector } tx_pkgInfoFifo_V_sou_full_n { I 1 bit } tx_pkgInfoFifo_V_sou_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 330 \
    name tx_pkgInfoFifo_V_wor \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_pkgInfoFifo_V_wor \
    op interface \
    ports { tx_pkgInfoFifo_V_wor_din { O 29 vector } tx_pkgInfoFifo_V_wor_full_n { I 1 bit } tx_pkgInfoFifo_V_wor_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 331 \
    name tx_localMemCmdFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_localMemCmdFifo_V \
    op interface \
    ports { tx_localMemCmdFifo_V_dout { I 113 vector } tx_localMemCmdFifo_V_empty_n { I 1 bit } tx_localMemCmdFifo_V_read { O 1 bit } } \
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


