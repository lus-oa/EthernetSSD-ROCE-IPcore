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
    id 55 \
    name rx_ip2udpMetaFifo_V_s \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ip2udpMetaFifo_V_s \
    op interface \
    ports { rx_ip2udpMetaFifo_V_s_dout { I 32 vector } rx_ip2udpMetaFifo_V_s_empty_n { I 1 bit } rx_ip2udpMetaFifo_V_s_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name rx_ip2udpMetaFifo_V_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ip2udpMetaFifo_V_1 \
    op interface \
    ports { rx_ip2udpMetaFifo_V_1_dout { I 16 vector } rx_ip2udpMetaFifo_V_1_empty_n { I 1 bit } rx_ip2udpMetaFifo_V_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name rx_udpMetaFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_udpMetaFifo_V \
    op interface \
    ports { rx_udpMetaFifo_V_dout { I 49 vector } rx_udpMetaFifo_V_empty_n { I 1 bit } rx_udpMetaFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name rx_ipUdpMetaFifo_V_t_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_t_1 \
    op interface \
    ports { rx_ipUdpMetaFifo_V_t_1_din { O 128 vector } rx_ipUdpMetaFifo_V_t_1_full_n { I 1 bit } rx_ipUdpMetaFifo_V_t_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name rx_ipUdpMetaFifo_V_t \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_t \
    op interface \
    ports { rx_ipUdpMetaFifo_V_t_din { O 16 vector } rx_ipUdpMetaFifo_V_t_full_n { I 1 bit } rx_ipUdpMetaFifo_V_t_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name rx_ipUdpMetaFifo_V_m \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_m \
    op interface \
    ports { rx_ipUdpMetaFifo_V_m_din { O 16 vector } rx_ipUdpMetaFifo_V_m_full_n { I 1 bit } rx_ipUdpMetaFifo_V_m_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name rx_ipUdpMetaFifo_V_l \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_l \
    op interface \
    ports { rx_ipUdpMetaFifo_V_l_din { O 16 vector } rx_ipUdpMetaFifo_V_l_full_n { I 1 bit } rx_ipUdpMetaFifo_V_l_write { O 1 bit } } \
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


