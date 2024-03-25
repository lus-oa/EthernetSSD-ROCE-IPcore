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
    id 78 \
    name tx_udpMetaFifo_V_the \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_the \
    op interface \
    ports { tx_udpMetaFifo_V_the_dout { I 16 vector } tx_udpMetaFifo_V_the_empty_n { I 1 bit } tx_udpMetaFifo_V_the_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name tx_udpMetaFifo_V_my_s \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_my_s \
    op interface \
    ports { tx_udpMetaFifo_V_my_s_dout { I 16 vector } tx_udpMetaFifo_V_my_s_empty_n { I 1 bit } tx_udpMetaFifo_V_my_s_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name tx_udpMetaFifo_V_len \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_len \
    op interface \
    ports { tx_udpMetaFifo_V_len_dout { I 16 vector } tx_udpMetaFifo_V_len_empty_n { I 1 bit } tx_udpMetaFifo_V_len_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name tx_udpMetaFifo_V_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udpMetaFifo_V_val \
    op interface \
    ports { tx_udpMetaFifo_V_val_dout { I 1 vector } tx_udpMetaFifo_V_val_empty_n { I 1 bit } tx_udpMetaFifo_V_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name tx_shift2udpFifo_V_d \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_shift2udpFifo_V_d \
    op interface \
    ports { tx_shift2udpFifo_V_d_dout { I 512 vector } tx_shift2udpFifo_V_d_empty_n { I 1 bit } tx_shift2udpFifo_V_d_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name tx_shift2udpFifo_V_k \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_shift2udpFifo_V_k \
    op interface \
    ports { tx_shift2udpFifo_V_k_dout { I 64 vector } tx_shift2udpFifo_V_k_empty_n { I 1 bit } tx_shift2udpFifo_V_k_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name tx_shift2udpFifo_V_l \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_shift2udpFifo_V_l \
    op interface \
    ports { tx_shift2udpFifo_V_l_dout { I 1 vector } tx_shift2udpFifo_V_l_empty_n { I 1 bit } tx_shift2udpFifo_V_l_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name tx_udp2ipFifo_V_data \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udp2ipFifo_V_data \
    op interface \
    ports { tx_udp2ipFifo_V_data_din { O 512 vector } tx_udp2ipFifo_V_data_full_n { I 1 bit } tx_udp2ipFifo_V_data_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name tx_udp2ipFifo_V_keep \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udp2ipFifo_V_keep \
    op interface \
    ports { tx_udp2ipFifo_V_keep_din { O 64 vector } tx_udp2ipFifo_V_keep_full_n { I 1 bit } tx_udp2ipFifo_V_keep_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name tx_udp2ipFifo_V_last \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_udp2ipFifo_V_last \
    op interface \
    ports { tx_udp2ipFifo_V_last_din { O 1 vector } tx_udp2ipFifo_V_last_full_n { I 1 bit } tx_udp2ipFifo_V_last_write { O 1 bit } } \
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


