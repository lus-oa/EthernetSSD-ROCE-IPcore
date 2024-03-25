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
    id 92 \
    name rx_udp2ibFifo_V_data \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_udp2ibFifo_V_data \
    op interface \
    ports { rx_udp2ibFifo_V_data_dout { I 512 vector } rx_udp2ibFifo_V_data_empty_n { I 1 bit } rx_udp2ibFifo_V_data_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name rx_udp2ibFifo_V_keep \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_udp2ibFifo_V_keep \
    op interface \
    ports { rx_udp2ibFifo_V_keep_dout { I 64 vector } rx_udp2ibFifo_V_keep_empty_n { I 1 bit } rx_udp2ibFifo_V_keep_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name rx_udp2ibFifo_V_last \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_udp2ibFifo_V_last \
    op interface \
    ports { rx_udp2ibFifo_V_last_dout { I 1 vector } rx_udp2ibFifo_V_last_empty_n { I 1 bit } rx_udp2ibFifo_V_last_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name rx_ibh2shiftFifo_V_d \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2shiftFifo_V_d \
    op interface \
    ports { rx_ibh2shiftFifo_V_d_din { O 512 vector } rx_ibh2shiftFifo_V_d_full_n { I 1 bit } rx_ibh2shiftFifo_V_d_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name rx_ibh2shiftFifo_V_k \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2shiftFifo_V_k \
    op interface \
    ports { rx_ibh2shiftFifo_V_k_din { O 64 vector } rx_ibh2shiftFifo_V_k_full_n { I 1 bit } rx_ibh2shiftFifo_V_k_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name rx_ibh2shiftFifo_V_l \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2shiftFifo_V_l \
    op interface \
    ports { rx_ibh2shiftFifo_V_l_din { O 1 vector } rx_ibh2shiftFifo_V_l_full_n { I 1 bit } rx_ibh2shiftFifo_V_l_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name rx_ibh2fsm_MetaFifo_s_9 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2fsm_MetaFifo_s_9 \
    op interface \
    ports { rx_ibh2fsm_MetaFifo_s_9_din { O 92 vector } rx_ibh2fsm_MetaFifo_s_9_full_n { I 1 bit } rx_ibh2fsm_MetaFifo_s_9_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name rx_ibh2exh_MetaFifo_s_10 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibh2exh_MetaFifo_s_10 \
    op interface \
    ports { rx_ibh2exh_MetaFifo_s_10_din { O 5 vector } rx_ibh2exh_MetaFifo_s_10_full_n { I 1 bit } rx_ibh2exh_MetaFifo_s_10_write { O 1 bit } } \
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


