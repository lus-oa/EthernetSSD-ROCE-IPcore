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
    id 161 \
    name rx_pkgSplitTypeFifo_s_7 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_pkgSplitTypeFifo_s_7 \
    op interface \
    ports { rx_pkgSplitTypeFifo_s_7_dout { I 6 vector } rx_pkgSplitTypeFifo_s_7_empty_n { I 1 bit } rx_pkgSplitTypeFifo_s_7_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name rx_ibhDrop2exhFifo_V_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDrop2exhFifo_V_1 \
    op interface \
    ports { rx_ibhDrop2exhFifo_V_1_dout { I 512 vector } rx_ibhDrop2exhFifo_V_1_empty_n { I 1 bit } rx_ibhDrop2exhFifo_V_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name rx_ibhDrop2exhFifo_V_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDrop2exhFifo_V_2 \
    op interface \
    ports { rx_ibhDrop2exhFifo_V_2_dout { I 64 vector } rx_ibhDrop2exhFifo_V_2_empty_n { I 1 bit } rx_ibhDrop2exhFifo_V_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name rx_ibhDrop2exhFifo_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_ibhDrop2exhFifo_V \
    op interface \
    ports { rx_ibhDrop2exhFifo_V_dout { I 1 vector } rx_ibhDrop2exhFifo_V_empty_n { I 1 bit } rx_ibhDrop2exhFifo_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name rx_exh2rethShiftFifo_8 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_8 \
    op interface \
    ports { rx_exh2rethShiftFifo_8_din { O 512 vector } rx_exh2rethShiftFifo_8_full_n { I 1 bit } rx_exh2rethShiftFifo_8_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name rx_exh2rethShiftFifo_6 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_6 \
    op interface \
    ports { rx_exh2rethShiftFifo_6_din { O 64 vector } rx_exh2rethShiftFifo_6_full_n { I 1 bit } rx_exh2rethShiftFifo_6_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name rx_exh2rethShiftFifo_7 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_7 \
    op interface \
    ports { rx_exh2rethShiftFifo_7_din { O 1 vector } rx_exh2rethShiftFifo_7_full_n { I 1 bit } rx_exh2rethShiftFifo_7_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name rx_exh2rethShiftFifo_4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_4 \
    op interface \
    ports { rx_exh2rethShiftFifo_4_din { O 1 vector } rx_exh2rethShiftFifo_4_full_n { I 1 bit } rx_exh2rethShiftFifo_4_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 169 \
    name rx_exh2aethShiftFifo_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2aethShiftFifo_3 \
    op interface \
    ports { rx_exh2aethShiftFifo_3_din { O 512 vector } rx_exh2aethShiftFifo_3_full_n { I 1 bit } rx_exh2aethShiftFifo_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name rx_exh2aethShiftFifo_5 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2aethShiftFifo_5 \
    op interface \
    ports { rx_exh2aethShiftFifo_5_din { O 64 vector } rx_exh2aethShiftFifo_5_full_n { I 1 bit } rx_exh2aethShiftFifo_5_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name rx_exh2aethShiftFifo_6 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2aethShiftFifo_6 \
    op interface \
    ports { rx_exh2aethShiftFifo_6_din { O 1 vector } rx_exh2aethShiftFifo_6_full_n { I 1 bit } rx_exh2aethShiftFifo_6_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name rx_exhNoShiftFifo_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_1 \
    op interface \
    ports { rx_exhNoShiftFifo_V_1_din { O 512 vector } rx_exhNoShiftFifo_V_1_full_n { I 1 bit } rx_exhNoShiftFifo_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name rx_exhNoShiftFifo_V_4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_4 \
    op interface \
    ports { rx_exhNoShiftFifo_V_4_din { O 64 vector } rx_exhNoShiftFifo_V_4_full_n { I 1 bit } rx_exhNoShiftFifo_V_4_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name rx_exhNoShiftFifo_V_s \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_s \
    op interface \
    ports { rx_exhNoShiftFifo_V_s_din { O 1 vector } rx_exhNoShiftFifo_V_s_full_n { I 1 bit } rx_exhNoShiftFifo_V_s_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name rx_exhNoShiftFifo_V_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_3 \
    op interface \
    ports { rx_exhNoShiftFifo_V_3_din { O 1 vector } rx_exhNoShiftFifo_V_3_full_n { I 1 bit } rx_exhNoShiftFifo_V_3_write { O 1 bit } } \
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


