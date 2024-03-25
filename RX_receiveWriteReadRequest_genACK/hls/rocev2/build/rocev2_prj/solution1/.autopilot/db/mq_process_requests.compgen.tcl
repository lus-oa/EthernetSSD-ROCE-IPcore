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
    id 382 \
    name tx_readReqAddr_push_1_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqAddr_push_1_1 \
    op interface \
    ports { tx_readReqAddr_push_1_1_dout { I 16 vector } tx_readReqAddr_push_1_1_empty_n { I 1 bit } tx_readReqAddr_push_1_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 383 \
    name tx_readReqAddr_push_s_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tx_readReqAddr_push_s_2 \
    op interface \
    ports { tx_readReqAddr_push_s_2_dout { I 64 vector } tx_readReqAddr_push_s_2_empty_n { I 1 bit } tx_readReqAddr_push_s_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 384 \
    name mq_freeListFifo_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_freeListFifo_V_V \
    op interface \
    ports { mq_freeListFifo_V_V_dout { I 16 vector } mq_freeListFifo_V_V_empty_n { I 1 bit } mq_freeListFifo_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 385 \
    name mq_pointerReqFifo_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerReqFifo_V_1 \
    op interface \
    ports { mq_pointerReqFifo_V_1_din { O 16 vector } mq_pointerReqFifo_V_1_full_n { I 1 bit } mq_pointerReqFifo_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 386 \
    name mq_pointerReqFifo_V_s \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerReqFifo_V_s \
    op interface \
    ports { mq_pointerReqFifo_V_s_din { O 1 vector } mq_pointerReqFifo_V_s_full_n { I 1 bit } mq_pointerReqFifo_V_s_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 387 \
    name rx_readReqAddr_pop_r_4 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_r_4 \
    op interface \
    ports { rx_readReqAddr_pop_r_4_dout { I 17 vector } rx_readReqAddr_pop_r_4_empty_n { I 1 bit } rx_readReqAddr_pop_r_4_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 388 \
    name mq_pointerRspFifo_V_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerRspFifo_V_1 \
    op interface \
    ports { mq_pointerRspFifo_V_1_dout { I 16 vector } mq_pointerRspFifo_V_1_empty_n { I 1 bit } mq_pointerRspFifo_V_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 389 \
    name mq_pointerRspFifo_V_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerRspFifo_V_2 \
    op interface \
    ports { mq_pointerRspFifo_V_2_dout { I 16 vector } mq_pointerRspFifo_V_2_empty_n { I 1 bit } mq_pointerRspFifo_V_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 390 \
    name mq_pointerRspFifo_V_s \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerRspFifo_V_s \
    op interface \
    ports { mq_pointerRspFifo_V_s_dout { I 1 vector } mq_pointerRspFifo_V_s_empty_n { I 1 bit } mq_pointerRspFifo_V_s_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 391 \
    name mq_metaReqFifo_V_idx \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo_V_idx \
    op interface \
    ports { mq_metaReqFifo_V_idx_din { O 16 vector } mq_metaReqFifo_V_idx_full_n { I 1 bit } mq_metaReqFifo_V_idx_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 392 \
    name mq_metaReqFifo_V_ent \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo_V_ent \
    op interface \
    ports { mq_metaReqFifo_V_ent_din { O 64 vector } mq_metaReqFifo_V_ent_full_n { I 1 bit } mq_metaReqFifo_V_ent_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 393 \
    name mq_metaReqFifo_V_ent_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo_V_ent_3 \
    op interface \
    ports { mq_metaReqFifo_V_ent_3_din { O 16 vector } mq_metaReqFifo_V_ent_3_full_n { I 1 bit } mq_metaReqFifo_V_ent_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 394 \
    name mq_metaReqFifo_V_ent_4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo_V_ent_4 \
    op interface \
    ports { mq_metaReqFifo_V_ent_4_din { O 1 vector } mq_metaReqFifo_V_ent_4_full_n { I 1 bit } mq_metaReqFifo_V_ent_4_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 395 \
    name mq_metaReqFifo_V_ent_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo_V_ent_1 \
    op interface \
    ports { mq_metaReqFifo_V_ent_1_din { O 1 vector } mq_metaReqFifo_V_ent_1_full_n { I 1 bit } mq_metaReqFifo_V_ent_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 396 \
    name mq_metaReqFifo_V_wri \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo_V_wri \
    op interface \
    ports { mq_metaReqFifo_V_wri_din { O 1 vector } mq_metaReqFifo_V_wri_full_n { I 1 bit } mq_metaReqFifo_V_wri_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 397 \
    name mq_metaReqFifo_V_app \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaReqFifo_V_app \
    op interface \
    ports { mq_metaReqFifo_V_app_din { O 1 vector } mq_metaReqFifo_V_app_full_n { I 1 bit } mq_metaReqFifo_V_app_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 398 \
    name mq_pointerUpdFifo_V_s \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerUpdFifo_V_s \
    op interface \
    ports { mq_pointerUpdFifo_V_s_din { O 16 vector } mq_pointerUpdFifo_V_s_full_n { I 1 bit } mq_pointerUpdFifo_V_s_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 399 \
    name mq_pointerUpdFifo_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerUpdFifo_V_1 \
    op interface \
    ports { mq_pointerUpdFifo_V_1_din { O 16 vector } mq_pointerUpdFifo_V_1_full_n { I 1 bit } mq_pointerUpdFifo_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 400 \
    name mq_pointerUpdFifo_V_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerUpdFifo_V_3 \
    op interface \
    ports { mq_pointerUpdFifo_V_3_din { O 16 vector } mq_pointerUpdFifo_V_3_full_n { I 1 bit } mq_pointerUpdFifo_V_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 401 \
    name mq_pointerUpdFifo_V_4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_pointerUpdFifo_V_4 \
    op interface \
    ports { mq_pointerUpdFifo_V_4_din { O 1 vector } mq_pointerUpdFifo_V_4_full_n { I 1 bit } mq_pointerUpdFifo_V_4_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 402 \
    name mq_metaRspFifo_V_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaRspFifo_V_val \
    op interface \
    ports { mq_metaRspFifo_V_val_dout { I 64 vector } mq_metaRspFifo_V_val_empty_n { I 1 bit } mq_metaRspFifo_V_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 403 \
    name mq_metaRspFifo_V_nex \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaRspFifo_V_nex \
    op interface \
    ports { mq_metaRspFifo_V_nex_dout { I 16 vector } mq_metaRspFifo_V_nex_empty_n { I 1 bit } mq_metaRspFifo_V_nex_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 404 \
    name mq_metaRspFifo_V_val_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaRspFifo_V_val_1 \
    op interface \
    ports { mq_metaRspFifo_V_val_1_dout { I 1 vector } mq_metaRspFifo_V_val_1_empty_n { I 1 bit } mq_metaRspFifo_V_val_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 405 \
    name mq_metaRspFifo_V_isT \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_metaRspFifo_V_isT \
    op interface \
    ports { mq_metaRspFifo_V_isT_dout { I 1 vector } mq_metaRspFifo_V_isT_empty_n { I 1 bit } mq_metaRspFifo_V_isT_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 406 \
    name rx_readReqAddr_pop_r_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rx_readReqAddr_pop_r_1 \
    op interface \
    ports { rx_readReqAddr_pop_r_1_din { O 64 vector } rx_readReqAddr_pop_r_1_full_n { I 1 bit } rx_readReqAddr_pop_r_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 407 \
    name mq_releaseFifo_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mq_releaseFifo_V_V \
    op interface \
    ports { mq_releaseFifo_V_V_din { O 16 vector } mq_releaseFifo_V_V_full_n { I 1 bit } mq_releaseFifo_V_V_write { O 1 bit } } \
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


