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
    id 131 \
    name rx_ibhDropFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDropFifo_V \
    op interface \
    ports { rx_ibhDropFifo_V_dout { I 1 vector } rx_ibhDropFifo_V_empty_n { I 1 bit } rx_ibhDropFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name rx_exh2dropFifo_V_da \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2dropFifo_V_da \
    op interface \
    ports { rx_exh2dropFifo_V_da_dout { I 512 vector } rx_exh2dropFifo_V_da_empty_n { I 1 bit } rx_exh2dropFifo_V_da_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name rx_exh2dropFifo_V_ke \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2dropFifo_V_ke \
    op interface \
    ports { rx_exh2dropFifo_V_ke_dout { I 64 vector } rx_exh2dropFifo_V_ke_empty_n { I 1 bit } rx_exh2dropFifo_V_ke_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name rx_exh2dropFifo_V_la \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2dropFifo_V_la \
    op interface \
    ports { rx_exh2dropFifo_V_la_dout { I 1 vector } rx_exh2dropFifo_V_la_empty_n { I 1 bit } rx_exh2dropFifo_V_la_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name rx_ibhDrop2exhFifo_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDrop2exhFifo_V_1 \
    op interface \
    ports { rx_ibhDrop2exhFifo_V_1_din { O 512 vector } rx_ibhDrop2exhFifo_V_1_full_n { I 1 bit } rx_ibhDrop2exhFifo_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name rx_ibhDrop2exhFifo_V_2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDrop2exhFifo_V_2 \
    op interface \
    ports { rx_ibhDrop2exhFifo_V_2_din { O 64 vector } rx_ibhDrop2exhFifo_V_2_full_n { I 1 bit } rx_ibhDrop2exhFifo_V_2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name rx_ibhDrop2exhFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDrop2exhFifo_V \
    op interface \
    ports { rx_ibhDrop2exhFifo_V_din { O 1 vector } rx_ibhDrop2exhFifo_V_full_n { I 1 bit } rx_ibhDrop2exhFifo_V_write { O 1 bit } } \
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


