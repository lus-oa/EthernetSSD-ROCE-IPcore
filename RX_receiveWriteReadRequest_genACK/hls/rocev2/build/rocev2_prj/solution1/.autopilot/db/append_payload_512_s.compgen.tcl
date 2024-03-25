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
    id 279 \
    name tx_packetInfoFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_packetInfoFifo_V \
    op interface \
    ports { tx_packetInfoFifo_V_dout { I 3 vector } tx_packetInfoFifo_V_empty_n { I 1 bit } tx_packetInfoFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 280 \
    name tx_exh2payFifo_V_dat \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2payFifo_V_dat \
    op interface \
    ports { tx_exh2payFifo_V_dat_dout { I 512 vector } tx_exh2payFifo_V_dat_empty_n { I 1 bit } tx_exh2payFifo_V_dat_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 281 \
    name tx_exh2payFifo_V_kee \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2payFifo_V_kee \
    op interface \
    ports { tx_exh2payFifo_V_kee_dout { I 64 vector } tx_exh2payFifo_V_kee_empty_n { I 1 bit } tx_exh2payFifo_V_kee_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 282 \
    name tx_exh2payFifo_V_las \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2payFifo_V_las \
    op interface \
    ports { tx_exh2payFifo_V_las_dout { I 1 vector } tx_exh2payFifo_V_las_empty_n { I 1 bit } tx_exh2payFifo_V_las_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 283 \
    name tx_exh2shiftFifo_V_d \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2shiftFifo_V_d \
    op interface \
    ports { tx_exh2shiftFifo_V_d_din { O 512 vector } tx_exh2shiftFifo_V_d_full_n { I 1 bit } tx_exh2shiftFifo_V_d_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 284 \
    name tx_exh2shiftFifo_V_k \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2shiftFifo_V_k \
    op interface \
    ports { tx_exh2shiftFifo_V_k_din { O 64 vector } tx_exh2shiftFifo_V_k_full_n { I 1 bit } tx_exh2shiftFifo_V_k_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 285 \
    name tx_exh2shiftFifo_V_l \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_exh2shiftFifo_V_l \
    op interface \
    ports { tx_exh2shiftFifo_V_l_din { O 1 vector } tx_exh2shiftFifo_V_l_full_n { I 1 bit } tx_exh2shiftFifo_V_l_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 286 \
    name tx_aethShift2payFifo_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_aethShift2payFifo_3 \
    op interface \
    ports { tx_aethShift2payFifo_3_dout { I 512 vector } tx_aethShift2payFifo_3_empty_n { I 1 bit } tx_aethShift2payFifo_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 287 \
    name tx_aethShift2payFifo_5 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_aethShift2payFifo_5 \
    op interface \
    ports { tx_aethShift2payFifo_5_dout { I 64 vector } tx_aethShift2payFifo_5_empty_n { I 1 bit } tx_aethShift2payFifo_5_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 288 \
    name tx_aethShift2payFifo_6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_aethShift2payFifo_6 \
    op interface \
    ports { tx_aethShift2payFifo_6_dout { I 1 vector } tx_aethShift2payFifo_6_empty_n { I 1 bit } tx_aethShift2payFifo_6_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 289 \
    name tx_rethShift2payFifo_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethShift2payFifo_3 \
    op interface \
    ports { tx_rethShift2payFifo_3_dout { I 512 vector } tx_rethShift2payFifo_3_empty_n { I 1 bit } tx_rethShift2payFifo_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 290 \
    name tx_rethShift2payFifo_5 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethShift2payFifo_5 \
    op interface \
    ports { tx_rethShift2payFifo_5_dout { I 64 vector } tx_rethShift2payFifo_5_empty_n { I 1 bit } tx_rethShift2payFifo_5_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 291 \
    name tx_rethShift2payFifo_6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethShift2payFifo_6 \
    op interface \
    ports { tx_rethShift2payFifo_6_dout { I 1 vector } tx_rethShift2payFifo_6_empty_n { I 1 bit } tx_rethShift2payFifo_6_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 292 \
    name tx_rawPayFifo_V_data \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rawPayFifo_V_data \
    op interface \
    ports { tx_rawPayFifo_V_data_dout { I 512 vector } tx_rawPayFifo_V_data_empty_n { I 1 bit } tx_rawPayFifo_V_data_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 293 \
    name tx_rawPayFifo_V_keep \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rawPayFifo_V_keep \
    op interface \
    ports { tx_rawPayFifo_V_keep_dout { I 64 vector } tx_rawPayFifo_V_keep_empty_n { I 1 bit } tx_rawPayFifo_V_keep_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 294 \
    name tx_rawPayFifo_V_last \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rawPayFifo_V_last \
    op interface \
    ports { tx_rawPayFifo_V_last_dout { I 1 vector } tx_rawPayFifo_V_last_empty_n { I 1 bit } tx_rawPayFifo_V_last_read { O 1 bit } } \
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


