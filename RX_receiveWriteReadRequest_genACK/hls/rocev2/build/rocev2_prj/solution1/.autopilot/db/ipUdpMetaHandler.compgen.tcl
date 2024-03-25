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
    id 138 \
    name rx_ipUdpMetaFifo_V_t_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_t_1 \
    op interface \
    ports { rx_ipUdpMetaFifo_V_t_1_dout { I 128 vector } rx_ipUdpMetaFifo_V_t_1_empty_n { I 1 bit } rx_ipUdpMetaFifo_V_t_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name rx_ipUdpMetaFifo_V_t \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_t \
    op interface \
    ports { rx_ipUdpMetaFifo_V_t_dout { I 16 vector } rx_ipUdpMetaFifo_V_t_empty_n { I 1 bit } rx_ipUdpMetaFifo_V_t_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name rx_ipUdpMetaFifo_V_m \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_m \
    op interface \
    ports { rx_ipUdpMetaFifo_V_m_dout { I 16 vector } rx_ipUdpMetaFifo_V_m_empty_n { I 1 bit } rx_ipUdpMetaFifo_V_m_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name rx_ipUdpMetaFifo_V_l \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ipUdpMetaFifo_V_l \
    op interface \
    ports { rx_ipUdpMetaFifo_V_l_dout { I 16 vector } rx_ipUdpMetaFifo_V_l_empty_n { I 1 bit } rx_ipUdpMetaFifo_V_l_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name rx_exh2drop_MetaFifo_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2drop_MetaFifo_1 \
    op interface \
    ports { rx_exh2drop_MetaFifo_1_dout { I 241 vector } rx_exh2drop_MetaFifo_1_empty_n { I 1 bit } rx_exh2drop_MetaFifo_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name rx_ibhDropMetaFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDropMetaFifo_V \
    op interface \
    ports { rx_ibhDropMetaFifo_V_dout { I 2 vector } rx_ibhDropMetaFifo_V_empty_n { I 1 bit } rx_ibhDropMetaFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name exh_lengthFifo_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_exh_lengthFifo_V_V \
    op interface \
    ports { exh_lengthFifo_V_V_din { O 16 vector } exh_lengthFifo_V_V_full_n { I 1 bit } exh_lengthFifo_V_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name rx_drop2exhFsm_MetaF_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_drop2exhFsm_MetaF_1 \
    op interface \
    ports { rx_drop2exhFsm_MetaF_1_din { O 241 vector } rx_drop2exhFsm_MetaF_1_full_n { I 1 bit } rx_drop2exhFsm_MetaF_1_write { O 1 bit } } \
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


