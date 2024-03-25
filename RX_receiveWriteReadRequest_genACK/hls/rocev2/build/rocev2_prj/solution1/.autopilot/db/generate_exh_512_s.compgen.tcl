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
    id 270 \
    name tx_exhMetaFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exhMetaFifo_V \
    op interface \
    ports { tx_exhMetaFifo_V_dout { I 135 vector } tx_exhMetaFifo_V_empty_n { I 1 bit } tx_exhMetaFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 271 \
    name txExh2msnTable_req_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_txExh2msnTable_req_V \
    op interface \
    ports { txExh2msnTable_req_V_din { O 16 vector } txExh2msnTable_req_V_full_n { I 1 bit } txExh2msnTable_req_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 272 \
    name msnTable2txExh_rsp_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_msnTable2txExh_rsp_V \
    op interface \
    ports { msnTable2txExh_rsp_V_dout { I 56 vector } msnTable2txExh_rsp_V_empty_n { I 1 bit } msnTable2txExh_rsp_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 273 \
    name tx_exh2payFifo_V_dat \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2payFifo_V_dat \
    op interface \
    ports { tx_exh2payFifo_V_dat_din { O 512 vector } tx_exh2payFifo_V_dat_full_n { I 1 bit } tx_exh2payFifo_V_dat_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 274 \
    name tx_exh2payFifo_V_kee \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2payFifo_V_kee \
    op interface \
    ports { tx_exh2payFifo_V_kee_din { O 64 vector } tx_exh2payFifo_V_kee_full_n { I 1 bit } tx_exh2payFifo_V_kee_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 275 \
    name tx_exh2payFifo_V_las \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2payFifo_V_las \
    op interface \
    ports { tx_exh2payFifo_V_las_din { O 1 vector } tx_exh2payFifo_V_las_full_n { I 1 bit } tx_exh2payFifo_V_las_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 276 \
    name tx_packetInfoFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_packetInfoFifo_V \
    op interface \
    ports { tx_packetInfoFifo_V_din { O 3 vector } tx_packetInfoFifo_V_full_n { I 1 bit } tx_packetInfoFifo_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 277 \
    name tx_lengthFifo_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_lengthFifo_V_V \
    op interface \
    ports { tx_lengthFifo_V_V_din { O 16 vector } tx_lengthFifo_V_V_full_n { I 1 bit } tx_lengthFifo_V_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 278 \
    name tx_readReqTable_upd_s_0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqTable_upd_s_0 \
    op interface \
    ports { tx_readReqTable_upd_s_0_din { O 40 vector } tx_readReqTable_upd_s_0_full_n { I 1 bit } tx_readReqTable_upd_s_0_write { O 1 bit } } \
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


