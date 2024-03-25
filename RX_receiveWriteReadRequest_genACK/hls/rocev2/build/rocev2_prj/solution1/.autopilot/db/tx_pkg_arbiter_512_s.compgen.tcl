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
    id 223 \
    name s_axis_tx_data_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_tx_data} \
    metadata {  } \
    op interface \
    ports { s_axis_tx_data_TVALID { I 1 bit } s_axis_tx_data_TDATA { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_tx_data_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 224 \
    name s_axis_tx_data_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_tx_data} \
    metadata {  } \
    op interface \
    ports { s_axis_tx_data_TKEEP { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_tx_data_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 225 \
    name s_axis_tx_data_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_tx_data} \
    metadata {  } \
    op interface \
    ports { s_axis_tx_data_TREADY { O 1 bit } s_axis_tx_data_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_tx_data_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 226 \
    name s_axis_mem_read_data_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_mem_read_data} \
    metadata {  } \
    op interface \
    ports { s_axis_mem_read_data_TVALID { I 1 bit } s_axis_mem_read_data_TDATA { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_mem_read_data_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 227 \
    name s_axis_mem_read_data_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_mem_read_data} \
    metadata {  } \
    op interface \
    ports { s_axis_mem_read_data_TKEEP { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_mem_read_data_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 228 \
    name s_axis_mem_read_data_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {s_axis_mem_read_data} \
    metadata {  } \
    op interface \
    ports { s_axis_mem_read_data_TREADY { O 1 bit } s_axis_mem_read_data_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_mem_read_data_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 229 \
    name tx_pkgInfoFifo_V_typ \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_pkgInfoFifo_V_typ \
    op interface \
    ports { tx_pkgInfoFifo_V_typ_dout { I 1 vector } tx_pkgInfoFifo_V_typ_empty_n { I 1 bit } tx_pkgInfoFifo_V_typ_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name tx_pkgInfoFifo_V_sou \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_pkgInfoFifo_V_sou \
    op interface \
    ports { tx_pkgInfoFifo_V_sou_dout { I 1 vector } tx_pkgInfoFifo_V_sou_empty_n { I 1 bit } tx_pkgInfoFifo_V_sou_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name tx_pkgInfoFifo_V_wor \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_pkgInfoFifo_V_wor \
    op interface \
    ports { tx_pkgInfoFifo_V_wor_dout { I 29 vector } tx_pkgInfoFifo_V_wor_empty_n { I 1 bit } tx_pkgInfoFifo_V_wor_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name tx_split2aethShift_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_split2aethShift_V_1 \
    op interface \
    ports { tx_split2aethShift_V_1_din { O 512 vector } tx_split2aethShift_V_1_full_n { I 1 bit } tx_split2aethShift_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name tx_split2aethShift_V_2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_split2aethShift_V_2 \
    op interface \
    ports { tx_split2aethShift_V_2_din { O 64 vector } tx_split2aethShift_V_2_full_n { I 1 bit } tx_split2aethShift_V_2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name tx_split2aethShift_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_split2aethShift_V \
    op interface \
    ports { tx_split2aethShift_V_din { O 1 vector } tx_split2aethShift_V_full_n { I 1 bit } tx_split2aethShift_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 235 \
    name tx_rethMerge2rethShi_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethMerge2rethShi_3 \
    op interface \
    ports { tx_rethMerge2rethShi_3_din { O 512 vector } tx_rethMerge2rethShi_3_full_n { I 1 bit } tx_rethMerge2rethShi_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name tx_rethMerge2rethShi_5 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethMerge2rethShi_5 \
    op interface \
    ports { tx_rethMerge2rethShi_5_din { O 64 vector } tx_rethMerge2rethShi_5_full_n { I 1 bit } tx_rethMerge2rethShi_5_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name tx_rethMerge2rethShi_6 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rethMerge2rethShi_6 \
    op interface \
    ports { tx_rethMerge2rethShi_6_din { O 1 vector } tx_rethMerge2rethShi_6_full_n { I 1 bit } tx_rethMerge2rethShi_6_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name tx_rawPayFifo_V_data \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rawPayFifo_V_data \
    op interface \
    ports { tx_rawPayFifo_V_data_din { O 512 vector } tx_rawPayFifo_V_data_full_n { I 1 bit } tx_rawPayFifo_V_data_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 239 \
    name tx_rawPayFifo_V_keep \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rawPayFifo_V_keep \
    op interface \
    ports { tx_rawPayFifo_V_keep_din { O 64 vector } tx_rawPayFifo_V_keep_full_n { I 1 bit } tx_rawPayFifo_V_keep_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
    name tx_rawPayFifo_V_last \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_rawPayFifo_V_last \
    op interface \
    ports { tx_rawPayFifo_V_last_din { O 1 vector } tx_rawPayFifo_V_last_full_n { I 1 bit } tx_rawPayFifo_V_last_write { O 1 bit } } \
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


