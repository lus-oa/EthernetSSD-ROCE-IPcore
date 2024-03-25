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
    id 196 \
    name m_axis_mem_write_data_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_write_data} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_write_data_TDATA { O 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_mem_write_data_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 197 \
    name m_axis_mem_write_data_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_write_data} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_write_data_TKEEP { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_mem_write_data_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 198 \
    name m_axis_mem_write_data_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_write_data} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_write_data_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_mem_write_data_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 199 \
    name m_axis_mem_write_data_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_mem_write_data} \
    metadata {  } \
    op interface \
    ports { m_axis_mem_write_data_TREADY { I 1 bit } m_axis_mem_write_data_TVALID { O 1 bit } m_axis_mem_write_data_TDEST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_mem_write_data_V_dest_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name rx_pkgShiftTypeFifo_s_8 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_pkgShiftTypeFifo_s_8 \
    op interface \
    ports { rx_pkgShiftTypeFifo_s_8_dout { I 2 vector } rx_pkgShiftTypeFifo_s_8_empty_n { I 1 bit } rx_pkgShiftTypeFifo_s_8_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name rx_aethSift2mergerFi_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_aethSift2mergerFi_3 \
    op interface \
    ports { rx_aethSift2mergerFi_3_dout { I 512 vector } rx_aethSift2mergerFi_3_empty_n { I 1 bit } rx_aethSift2mergerFi_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name rx_aethSift2mergerFi_5 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_aethSift2mergerFi_5 \
    op interface \
    ports { rx_aethSift2mergerFi_5_dout { I 64 vector } rx_aethSift2mergerFi_5_empty_n { I 1 bit } rx_aethSift2mergerFi_5_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name rx_aethSift2mergerFi_6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_aethSift2mergerFi_6 \
    op interface \
    ports { rx_aethSift2mergerFi_6_dout { I 1 vector } rx_aethSift2mergerFi_6_empty_n { I 1 bit } rx_aethSift2mergerFi_6_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name rx_rethSift2mergerFi_8 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_8 \
    op interface \
    ports { rx_rethSift2mergerFi_8_dout { I 512 vector } rx_rethSift2mergerFi_8_empty_n { I 1 bit } rx_rethSift2mergerFi_8_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name rx_rethSift2mergerFi_6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_6 \
    op interface \
    ports { rx_rethSift2mergerFi_6_dout { I 64 vector } rx_rethSift2mergerFi_6_empty_n { I 1 bit } rx_rethSift2mergerFi_6_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name rx_rethSift2mergerFi_7 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_7 \
    op interface \
    ports { rx_rethSift2mergerFi_7_dout { I 1 vector } rx_rethSift2mergerFi_7_empty_n { I 1 bit } rx_rethSift2mergerFi_7_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name rx_rethSift2mergerFi_4 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_rethSift2mergerFi_4 \
    op interface \
    ports { rx_rethSift2mergerFi_4_dout { I 1 vector } rx_rethSift2mergerFi_4_empty_n { I 1 bit } rx_rethSift2mergerFi_4_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name rx_exhNoShiftFifo_V_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_1 \
    op interface \
    ports { rx_exhNoShiftFifo_V_1_dout { I 512 vector } rx_exhNoShiftFifo_V_1_empty_n { I 1 bit } rx_exhNoShiftFifo_V_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name rx_exhNoShiftFifo_V_4 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_4 \
    op interface \
    ports { rx_exhNoShiftFifo_V_4_dout { I 64 vector } rx_exhNoShiftFifo_V_4_empty_n { I 1 bit } rx_exhNoShiftFifo_V_4_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name rx_exhNoShiftFifo_V_s \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_s \
    op interface \
    ports { rx_exhNoShiftFifo_V_s_dout { I 1 vector } rx_exhNoShiftFifo_V_s_empty_n { I 1 bit } rx_exhNoShiftFifo_V_s_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name rx_exhNoShiftFifo_V_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_exhNoShiftFifo_V_3 \
    op interface \
    ports { rx_exhNoShiftFifo_V_3_dout { I 1 vector } rx_exhNoShiftFifo_V_3_empty_n { I 1 bit } rx_exhNoShiftFifo_V_3_read { O 1 bit } } \
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


