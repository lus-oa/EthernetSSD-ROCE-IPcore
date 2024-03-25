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
    id 182 \
    name rx_exh2rethShiftFifo_8 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_8 \
    op interface \
    ports { rx_exh2rethShiftFifo_8_dout { I 512 vector } rx_exh2rethShiftFifo_8_empty_n { I 1 bit } rx_exh2rethShiftFifo_8_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name rx_exh2rethShiftFifo_6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_6 \
    op interface \
    ports { rx_exh2rethShiftFifo_6_dout { I 64 vector } rx_exh2rethShiftFifo_6_empty_n { I 1 bit } rx_exh2rethShiftFifo_6_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name rx_exh2rethShiftFifo_7 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_7 \
    op interface \
    ports { rx_exh2rethShiftFifo_7_dout { I 1 vector } rx_exh2rethShiftFifo_7_empty_n { I 1 bit } rx_exh2rethShiftFifo_7_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name rx_exh2rethShiftFifo_4 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exh2rethShiftFifo_4 \
    op interface \
    ports { rx_exh2rethShiftFifo_4_dout { I 1 vector } rx_exh2rethShiftFifo_4_empty_n { I 1 bit } rx_exh2rethShiftFifo_4_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name rx_rethSift2mergerFi_8 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_8 \
    op interface \
    ports { rx_rethSift2mergerFi_8_din { O 512 vector } rx_rethSift2mergerFi_8_full_n { I 1 bit } rx_rethSift2mergerFi_8_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name rx_rethSift2mergerFi_6 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_6 \
    op interface \
    ports { rx_rethSift2mergerFi_6_din { O 64 vector } rx_rethSift2mergerFi_6_full_n { I 1 bit } rx_rethSift2mergerFi_6_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name rx_rethSift2mergerFi_7 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_7 \
    op interface \
    ports { rx_rethSift2mergerFi_7_din { O 1 vector } rx_rethSift2mergerFi_7_full_n { I 1 bit } rx_rethSift2mergerFi_7_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name rx_rethSift2mergerFi_4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_4 \
    op interface \
    ports { rx_rethSift2mergerFi_4_din { O 1 vector } rx_rethSift2mergerFi_4_full_n { I 1 bit } rx_rethSift2mergerFi_4_write { O 1 bit } } \
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


