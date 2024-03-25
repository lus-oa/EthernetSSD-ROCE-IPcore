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
    id 62 \
    name tx_ipUdpMetaFifo_V_t_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ipUdpMetaFifo_V_t_1 \
    op interface \
    ports { tx_ipUdpMetaFifo_V_t_1_dout { I 128 vector } tx_ipUdpMetaFifo_V_t_1_empty_n { I 1 bit } tx_ipUdpMetaFifo_V_t_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name tx_ipUdpMetaFifo_V_t \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ipUdpMetaFifo_V_t \
    op interface \
    ports { tx_ipUdpMetaFifo_V_t_dout { I 16 vector } tx_ipUdpMetaFifo_V_t_empty_n { I 1 bit } tx_ipUdpMetaFifo_V_t_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name tx_ipUdpMetaFifo_V_m \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ipUdpMetaFifo_V_m \
    op interface \
    ports { tx_ipUdpMetaFifo_V_m_dout { I 16 vector } tx_ipUdpMetaFifo_V_m_empty_n { I 1 bit } tx_ipUdpMetaFifo_V_m_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name tx_ipUdpMetaFifo_V_l \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_ipUdpMetaFifo_V_l \
    op interface \
    ports { tx_ipUdpMetaFifo_V_l_dout { I 16 vector } tx_ipUdpMetaFifo_V_l_empty_n { I 1 bit } tx_ipUdpMetaFifo_V_l_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name tx_udp2ipMetaFifo_V_s \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udp2ipMetaFifo_V_s \
    op interface \
    ports { tx_udp2ipMetaFifo_V_s_din { O 32 vector } tx_udp2ipMetaFifo_V_s_full_n { I 1 bit } tx_udp2ipMetaFifo_V_s_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name tx_udp2ipMetaFifo_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udp2ipMetaFifo_V_1 \
    op interface \
    ports { tx_udp2ipMetaFifo_V_1_din { O 16 vector } tx_udp2ipMetaFifo_V_1_full_n { I 1 bit } tx_udp2ipMetaFifo_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name tx_udpMetaFifo_V_the \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_the \
    op interface \
    ports { tx_udpMetaFifo_V_the_din { O 16 vector } tx_udpMetaFifo_V_the_full_n { I 1 bit } tx_udpMetaFifo_V_the_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name tx_udpMetaFifo_V_my_s \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_my_s \
    op interface \
    ports { tx_udpMetaFifo_V_my_s_din { O 16 vector } tx_udpMetaFifo_V_my_s_full_n { I 1 bit } tx_udpMetaFifo_V_my_s_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name tx_udpMetaFifo_V_len \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_len \
    op interface \
    ports { tx_udpMetaFifo_V_len_din { O 16 vector } tx_udpMetaFifo_V_len_full_n { I 1 bit } tx_udpMetaFifo_V_len_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name tx_udpMetaFifo_V_val \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_val \
    op interface \
    ports { tx_udpMetaFifo_V_val_din { O 1 vector } tx_udpMetaFifo_V_val_full_n { I 1 bit } tx_udpMetaFifo_V_val_write { O 1 bit } } \
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


