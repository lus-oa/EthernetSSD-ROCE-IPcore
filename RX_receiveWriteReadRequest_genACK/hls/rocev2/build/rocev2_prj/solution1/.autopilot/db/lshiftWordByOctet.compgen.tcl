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
    id 264 \
    name tx_rethShift2payFifo_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethShift2payFifo_3 \
    op interface \
    ports { tx_rethShift2payFifo_3_din { O 512 vector } tx_rethShift2payFifo_3_full_n { I 1 bit } tx_rethShift2payFifo_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 265 \
    name tx_rethShift2payFifo_5 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethShift2payFifo_5 \
    op interface \
    ports { tx_rethShift2payFifo_5_din { O 64 vector } tx_rethShift2payFifo_5_full_n { I 1 bit } tx_rethShift2payFifo_5_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 266 \
    name tx_rethShift2payFifo_6 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethShift2payFifo_6 \
    op interface \
    ports { tx_rethShift2payFifo_6_din { O 1 vector } tx_rethShift2payFifo_6_full_n { I 1 bit } tx_rethShift2payFifo_6_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 267 \
    name tx_rethMerge2rethShi_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethMerge2rethShi_3 \
    op interface \
    ports { tx_rethMerge2rethShi_3_dout { I 512 vector } tx_rethMerge2rethShi_3_empty_n { I 1 bit } tx_rethMerge2rethShi_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 268 \
    name tx_rethMerge2rethShi_5 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethMerge2rethShi_5 \
    op interface \
    ports { tx_rethMerge2rethShi_5_dout { I 64 vector } tx_rethMerge2rethShi_5_empty_n { I 1 bit } tx_rethMerge2rethShi_5_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 269 \
    name tx_rethMerge2rethShi_6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethMerge2rethShi_6 \
    op interface \
    ports { tx_rethMerge2rethShi_6_dout { I 1 vector } tx_rethMerge2rethShi_6_empty_n { I 1 bit } tx_rethMerge2rethShi_6_read { O 1 bit } } \
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


