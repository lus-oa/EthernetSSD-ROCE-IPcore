# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 212 \
    name s_axis_tx_meta_V \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { s_axis_tx_meta_V_TVALID { I 1 bit } s_axis_tx_meta_V_TDATA { I 160 vector } s_axis_tx_meta_V_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_tx_meta_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name tx_appMetaFifo_V_op_s \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_op_s \
    op interface \
    ports { tx_appMetaFifo_V_op_s_din { O 5 vector } tx_appMetaFifo_V_op_s_full_n { I 1 bit } tx_appMetaFifo_V_op_s_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name tx_appMetaFifo_V_qpn \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_qpn \
    op interface \
    ports { tx_appMetaFifo_V_qpn_din { O 24 vector } tx_appMetaFifo_V_qpn_full_n { I 1 bit } tx_appMetaFifo_V_qpn_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name tx_appMetaFifo_V_add \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_add \
    op interface \
    ports { tx_appMetaFifo_V_add_din { O 48 vector } tx_appMetaFifo_V_add_full_n { I 1 bit } tx_appMetaFifo_V_add_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name tx_appMetaFifo_V_len \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_len \
    op interface \
    ports { tx_appMetaFifo_V_len_din { O 32 vector } tx_appMetaFifo_V_len_full_n { I 1 bit } tx_appMetaFifo_V_len_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name tx_appMetaFifo_V_psn \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_psn \
    op interface \
    ports { tx_appMetaFifo_V_psn_din { O 24 vector } tx_appMetaFifo_V_psn_full_n { I 1 bit } tx_appMetaFifo_V_psn_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name tx_appMetaFifo_V_val \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_val \
    op interface \
    ports { tx_appMetaFifo_V_val_din { O 1 vector } tx_appMetaFifo_V_val_full_n { I 1 bit } tx_appMetaFifo_V_val_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name tx_appMetaFifo_V_isN \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_appMetaFifo_V_isN \
    op interface \
    ports { tx_appMetaFifo_V_isN_din { O 1 vector } tx_appMetaFifo_V_isN_full_n { I 1 bit } tx_appMetaFifo_V_isN_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name tx_readReqAddr_push_1_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqAddr_push_1_1 \
    op interface \
    ports { tx_readReqAddr_push_1_1_din { O 16 vector } tx_readReqAddr_push_1_1_full_n { I 1 bit } tx_readReqAddr_push_1_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name tx_readReqAddr_push_s_2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqAddr_push_s_2 \
    op interface \
    ports { tx_readReqAddr_push_s_2_din { O 64 vector } tx_readReqAddr_push_s_2_full_n { I 1 bit } tx_readReqAddr_push_s_2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name tx_localMemCmdFifo_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_localMemCmdFifo_V \
    op interface \
    ports { tx_localMemCmdFifo_V_din { O 113 vector } tx_localMemCmdFifo_V_full_n { I 1 bit } tx_localMemCmdFifo_V_write { O 1 bit } } \
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


