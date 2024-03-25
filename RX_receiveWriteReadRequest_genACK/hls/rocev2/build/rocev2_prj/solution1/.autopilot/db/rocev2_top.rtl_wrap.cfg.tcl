set lang "C++"
set moduleName "rocev2_top"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "s_axis_rx_data"
set BitWidth0 "1024"
set ArrayOpt0 ""
set Const0 "0"
set Volatile0 "0"
set Pointer0 "2"
set Reference0 "1"
set Dims0 [list 0]
set Interface0 [list AP_STREAM 0] 
set structMem0 ""
set PortName00 "data"
set BitWidth00 "512"
set ArrayOpt00 ""
set Const00 "0"
set Volatile00 "0"
set Pointer00 "0"
set Reference00 "0"
set Dims00 [list 0]
set Interface00 "wire"
set DataType00 "[list ap_uint 512 ]"
set Port00 [list $PortName00 $Interface00 $DataType00 $Pointer00 $Dims00 $Const00 $Volatile00 $ArrayOpt00]
lappend structMem0 $Port00
set PortName01 "keep"
set BitWidth01 "64"
set ArrayOpt01 ""
set Const01 "0"
set Volatile01 "0"
set Pointer01 "0"
set Reference01 "0"
set Dims01 [list 0]
set Interface01 "wire"
set DataType01 "[list ap_uint 64 ]"
set Port01 [list $PortName01 $Interface01 $DataType01 $Pointer01 $Dims01 $Const01 $Volatile01 $ArrayOpt01]
lappend structMem0 $Port01
set PortName02 "last"
set BitWidth02 "8"
set ArrayOpt02 ""
set Const02 "0"
set Volatile02 "0"
set Pointer02 "0"
set Reference02 "0"
set Dims02 [list 0]
set Interface02 "wire"
set DataType02 "[list ap_uint 1 ]"
set Port02 [list $PortName02 $Interface02 $DataType02 $Pointer02 $Dims02 $Const02 $Volatile02 $ArrayOpt02]
lappend structMem0 $Port02
set DataType0tp0 "int"
set structParameter0 [list [list $DataType0tp0 D] ]
set structArgument0 [list 512 ]
set NameSpace0 [list ]
set structIsPacked0 "0"
set DataType0 [list "net_axis<512>" "struct net_axis" $structMem0 1 0 $structParameter0 $structArgument0 $NameSpace0 $structIsPacked0]
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "s_axis_tx_meta"
set BitWidth1 "256"
set ArrayOpt1 ""
set Const1 "0"
set Volatile1 "0"
set Pointer1 "2"
set Reference1 "1"
set Dims1 [list 0]
set Interface1 [list AP_STREAM 0] 
set structMem1 ""
set PortName10 "op_code"
set BitWidth10 "3"
set ArrayOpt10 ""
set Const10 "0"
set Volatile10 "0"
set Pointer10 "0"
set Reference10 "0"
set Dims10 [list 0]
set Interface10 "wire"
set DataType10 "[list appOpCode enum 0]"
set Port10 [list $PortName10 $Interface10 $DataType10 $Pointer10 $Dims10 $Const10 $Volatile10 $ArrayOpt10]
lappend structMem1 $Port10
set PortName11 "qpn"
set BitWidth11 "32"
set ArrayOpt11 ""
set Const11 "0"
set Volatile11 "0"
set Pointer11 "0"
set Reference11 "0"
set Dims11 [list 0]
set Interface11 "wire"
set DataType11 "[list ap_uint 24 ]"
set Port11 [list $PortName11 $Interface11 $DataType11 $Pointer11 $Dims11 $Const11 $Volatile11 $ArrayOpt11]
lappend structMem1 $Port11
set PortName12 "local_vaddr"
set BitWidth12 "64"
set ArrayOpt12 ""
set Const12 "0"
set Volatile12 "0"
set Pointer12 "0"
set Reference12 "0"
set Dims12 [list 0]
set Interface12 "wire"
set DataType12 "[list ap_uint 48 ]"
set Port12 [list $PortName12 $Interface12 $DataType12 $Pointer12 $Dims12 $Const12 $Volatile12 $ArrayOpt12]
lappend structMem1 $Port12
set PortName13 "remote_vaddr"
set BitWidth13 "64"
set ArrayOpt13 ""
set Const13 "0"
set Volatile13 "0"
set Pointer13 "0"
set Reference13 "0"
set Dims13 [list 0]
set Interface13 "wire"
set DataType13 "[list ap_uint 48 ]"
set Port13 [list $PortName13 $Interface13 $DataType13 $Pointer13 $Dims13 $Const13 $Volatile13 $ArrayOpt13]
lappend structMem1 $Port13
set PortName14 "length"
set BitWidth14 "32"
set ArrayOpt14 ""
set Const14 "0"
set Volatile14 "0"
set Pointer14 "0"
set Reference14 "0"
set Dims14 [list 0]
set Interface14 "wire"
set DataType14 "[list ap_uint 32 ]"
set Port14 [list $PortName14 $Interface14 $DataType14 $Pointer14 $Dims14 $Const14 $Volatile14 $ArrayOpt14]
lappend structMem1 $Port14
set structParameter1 [list ]
set structArgument1 [list ]
set NameSpace1 [list ]
set structIsPacked1 "0"
set DataType1 [list "txMeta" "struct txMeta" $structMem1 1 0 $structParameter1 $structArgument1 $NameSpace1 $structIsPacked1]
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set PortName2 "s_axis_tx_data"
set BitWidth2 "1024"
set ArrayOpt2 ""
set Const2 "0"
set Volatile2 "0"
set Pointer2 "2"
set Reference2 "1"
set Dims2 [list 0]
set Interface2 [list AP_STREAM 0] 
set structMem2 ""
set PortName20 "data"
set BitWidth20 "512"
set ArrayOpt20 ""
set Const20 "0"
set Volatile20 "0"
set Pointer20 "0"
set Reference20 "0"
set Dims20 [list 0]
set Interface20 "wire"
set DataType20 "[list ap_uint 512 ]"
set Port20 [list $PortName20 $Interface20 $DataType20 $Pointer20 $Dims20 $Const20 $Volatile20 $ArrayOpt20]
lappend structMem2 $Port20
set PortName21 "keep"
set BitWidth21 "64"
set ArrayOpt21 ""
set Const21 "0"
set Volatile21 "0"
set Pointer21 "0"
set Reference21 "0"
set Dims21 [list 0]
set Interface21 "wire"
set DataType21 "[list ap_uint 64 ]"
set Port21 [list $PortName21 $Interface21 $DataType21 $Pointer21 $Dims21 $Const21 $Volatile21 $ArrayOpt21]
lappend structMem2 $Port21
set PortName22 "last"
set BitWidth22 "8"
set ArrayOpt22 ""
set Const22 "0"
set Volatile22 "0"
set Pointer22 "0"
set Reference22 "0"
set Dims22 [list 0]
set Interface22 "wire"
set DataType22 "[list ap_uint 1 ]"
set Port22 [list $PortName22 $Interface22 $DataType22 $Pointer22 $Dims22 $Const22 $Volatile22 $ArrayOpt22]
lappend structMem2 $Port22
set DataType2tp0 "int"
set structParameter2 [list [list $DataType2tp0 D] ]
set structArgument2 [list 512 ]
set NameSpace2 [list ]
set structIsPacked2 "0"
set DataType2 [list "net_axis<512>" "struct net_axis" $structMem2 1 0 $structParameter2 $structArgument2 $NameSpace2 $structIsPacked2]
set Port2 [list $PortName2 $Interface2 $DataType2 $Pointer2 $Dims2 $Const2 $Volatile2 $ArrayOpt2]
lappend PortList $Port2
set PortName3 "m_axis_tx_data"
set BitWidth3 "1024"
set ArrayOpt3 ""
set Const3 "0"
set Volatile3 "0"
set Pointer3 "2"
set Reference3 "1"
set Dims3 [list 0]
set Interface3 [list AP_STREAM 0] 
set structMem3 ""
set PortName30 "data"
set BitWidth30 "512"
set ArrayOpt30 ""
set Const30 "0"
set Volatile30 "0"
set Pointer30 "0"
set Reference30 "0"
set Dims30 [list 0]
set Interface30 "wire"
set DataType30 "[list ap_uint 512 ]"
set Port30 [list $PortName30 $Interface30 $DataType30 $Pointer30 $Dims30 $Const30 $Volatile30 $ArrayOpt30]
lappend structMem3 $Port30
set PortName31 "keep"
set BitWidth31 "64"
set ArrayOpt31 ""
set Const31 "0"
set Volatile31 "0"
set Pointer31 "0"
set Reference31 "0"
set Dims31 [list 0]
set Interface31 "wire"
set DataType31 "[list ap_uint 64 ]"
set Port31 [list $PortName31 $Interface31 $DataType31 $Pointer31 $Dims31 $Const31 $Volatile31 $ArrayOpt31]
lappend structMem3 $Port31
set PortName32 "last"
set BitWidth32 "8"
set ArrayOpt32 ""
set Const32 "0"
set Volatile32 "0"
set Pointer32 "0"
set Reference32 "0"
set Dims32 [list 0]
set Interface32 "wire"
set DataType32 "[list ap_uint 1 ]"
set Port32 [list $PortName32 $Interface32 $DataType32 $Pointer32 $Dims32 $Const32 $Volatile32 $ArrayOpt32]
lappend structMem3 $Port32
set DataType3tp0 "int"
set structParameter3 [list [list $DataType3tp0 D] ]
set structArgument3 [list 512 ]
set NameSpace3 [list ]
set structIsPacked3 "0"
set DataType3 [list "net_axis<512>" "struct net_axis" $structMem3 1 0 $structParameter3 $structArgument3 $NameSpace3 $structIsPacked3]
set Port3 [list $PortName3 $Interface3 $DataType3 $Pointer3 $Dims3 $Const3 $Volatile3 $ArrayOpt3]
lappend PortList $Port3
set PortName4 "m_axis_mem_write_cmd"
set BitWidth4 "192"
set ArrayOpt4 ""
set Const4 "0"
set Volatile4 "0"
set Pointer4 "2"
set Reference4 "1"
set Dims4 [list 0]
set Interface4 [list AP_STREAM 0] 
set structMem4 ""
set PortName40 "data"
set BitWidth40 "128"
set ArrayOpt40 ""
set Const40 "0"
set Volatile40 "0"
set Pointer40 "0"
set Reference40 "0"
set Dims40 [list 0]
set Interface40 "wire"
set structMem40 ""
set PortName400 "addr"
set BitWidth400 "64"
set ArrayOpt400 ""
set Const400 "0"
set Volatile400 "0"
set Pointer400 "0"
set Reference400 "0"
set Dims400 [list 0]
set Interface400 "wire"
set DataType400 "[list ap_uint 64 ]"
set Port400 [list $PortName400 $Interface400 $DataType400 $Pointer400 $Dims400 $Const400 $Volatile400 $ArrayOpt400]
lappend structMem40 $Port400
set PortName401 "len"
set BitWidth401 "32"
set ArrayOpt401 ""
set Const401 "0"
set Volatile401 "0"
set Pointer401 "0"
set Reference401 "0"
set Dims401 [list 0]
set Interface401 "wire"
set DataType401 "[list ap_uint 32 ]"
set Port401 [list $PortName401 $Interface401 $DataType401 $Pointer401 $Dims401 $Const401 $Volatile401 $ArrayOpt401]
lappend structMem40 $Port401
set structParameter40 [list ]
set structArgument40 [list ]
set NameSpace40 [list ]
set structIsPacked40 "0"
set DataType40 [list "memCmd" "struct memCmd" $structMem40 1 0 $structParameter40 $structArgument40 $NameSpace40 $structIsPacked40]
set Port40 [list $PortName40 $Interface40 $DataType40 $Pointer40 $Dims40 $Const40 $Volatile40 $ArrayOpt40]
lappend structMem4 $Port40
set PortName41 "dest"
set BitWidth41 "8"
set ArrayOpt41 ""
set Const41 "0"
set Volatile41 "0"
set Pointer41 "0"
set Reference41 "0"
set Dims41 [list 0]
set Interface41 "wire"
set DataType41 "[list ap_uint 1 ]"
set Port41 [list $PortName41 $Interface41 $DataType41 $Pointer41 $Dims41 $Const41 $Volatile41 $ArrayOpt41]
lappend structMem4 $Port41
set structParameter4 [list ]
set structArgument4 [list ]
set NameSpace4 [list ]
set structIsPacked4 "0"
set DataType4 [list "routedMemCmd" "struct routedMemCmd" $structMem4 1 0 $structParameter4 $structArgument4 $NameSpace4 $structIsPacked4]
set Port4 [list $PortName4 $Interface4 $DataType4 $Pointer4 $Dims4 $Const4 $Volatile4 $ArrayOpt4]
lappend PortList $Port4
set PortName5 "m_axis_mem_read_cmd"
set BitWidth5 "192"
set ArrayOpt5 ""
set Const5 "0"
set Volatile5 "0"
set Pointer5 "2"
set Reference5 "1"
set Dims5 [list 0]
set Interface5 [list AP_STREAM 0] 
set structMem5 ""
set PortName50 "data"
set BitWidth50 "128"
set ArrayOpt50 ""
set Const50 "0"
set Volatile50 "0"
set Pointer50 "0"
set Reference50 "0"
set Dims50 [list 0]
set Interface50 "wire"
set structMem50 ""
set PortName500 "addr"
set BitWidth500 "64"
set ArrayOpt500 ""
set Const500 "0"
set Volatile500 "0"
set Pointer500 "0"
set Reference500 "0"
set Dims500 [list 0]
set Interface500 "wire"
set DataType500 "[list ap_uint 64 ]"
set Port500 [list $PortName500 $Interface500 $DataType500 $Pointer500 $Dims500 $Const500 $Volatile500 $ArrayOpt500]
lappend structMem50 $Port500
set PortName501 "len"
set BitWidth501 "32"
set ArrayOpt501 ""
set Const501 "0"
set Volatile501 "0"
set Pointer501 "0"
set Reference501 "0"
set Dims501 [list 0]
set Interface501 "wire"
set DataType501 "[list ap_uint 32 ]"
set Port501 [list $PortName501 $Interface501 $DataType501 $Pointer501 $Dims501 $Const501 $Volatile501 $ArrayOpt501]
lappend structMem50 $Port501
set structParameter50 [list ]
set structArgument50 [list ]
set NameSpace50 [list ]
set structIsPacked50 "0"
set DataType50 [list "memCmd" "struct memCmd" $structMem50 1 0 $structParameter50 $structArgument50 $NameSpace50 $structIsPacked50]
set Port50 [list $PortName50 $Interface50 $DataType50 $Pointer50 $Dims50 $Const50 $Volatile50 $ArrayOpt50]
lappend structMem5 $Port50
set PortName51 "dest"
set BitWidth51 "8"
set ArrayOpt51 ""
set Const51 "0"
set Volatile51 "0"
set Pointer51 "0"
set Reference51 "0"
set Dims51 [list 0]
set Interface51 "wire"
set DataType51 "[list ap_uint 1 ]"
set Port51 [list $PortName51 $Interface51 $DataType51 $Pointer51 $Dims51 $Const51 $Volatile51 $ArrayOpt51]
lappend structMem5 $Port51
set structParameter5 [list ]
set structArgument5 [list ]
set NameSpace5 [list ]
set structIsPacked5 "0"
set DataType5 [list "routedMemCmd" "struct routedMemCmd" $structMem5 1 0 $structParameter5 $structArgument5 $NameSpace5 $structIsPacked5]
set Port5 [list $PortName5 $Interface5 $DataType5 $Pointer5 $Dims5 $Const5 $Volatile5 $ArrayOpt5]
lappend PortList $Port5
set PortName6 "m_axis_mem_write_data"
set BitWidth6 "1024"
set ArrayOpt6 ""
set Const6 "0"
set Volatile6 "0"
set Pointer6 "2"
set Reference6 "1"
set Dims6 [list 0]
set Interface6 [list AP_STREAM 0] 
set structMem6 ""
set PortName60 "data"
set BitWidth60 "512"
set ArrayOpt60 ""
set Const60 "0"
set Volatile60 "0"
set Pointer60 "0"
set Reference60 "0"
set Dims60 [list 0]
set Interface60 "wire"
set DataType60 "[list ap_uint 512 ]"
set Port60 [list $PortName60 $Interface60 $DataType60 $Pointer60 $Dims60 $Const60 $Volatile60 $ArrayOpt60]
lappend structMem6 $Port60
set PortName61 "keep"
set BitWidth61 "64"
set ArrayOpt61 ""
set Const61 "0"
set Volatile61 "0"
set Pointer61 "0"
set Reference61 "0"
set Dims61 [list 0]
set Interface61 "wire"
set DataType61 "[list ap_uint 64 ]"
set Port61 [list $PortName61 $Interface61 $DataType61 $Pointer61 $Dims61 $Const61 $Volatile61 $ArrayOpt61]
lappend structMem6 $Port61
set PortName62 "last"
set BitWidth62 "8"
set ArrayOpt62 ""
set Const62 "0"
set Volatile62 "0"
set Pointer62 "0"
set Reference62 "0"
set Dims62 [list 0]
set Interface62 "wire"
set DataType62 "[list ap_uint 1 ]"
set Port62 [list $PortName62 $Interface62 $DataType62 $Pointer62 $Dims62 $Const62 $Volatile62 $ArrayOpt62]
lappend structMem6 $Port62
set PortName63 "dest"
set BitWidth63 "8"
set ArrayOpt63 ""
set Const63 "0"
set Volatile63 "0"
set Pointer63 "0"
set Reference63 "0"
set Dims63 [list 0]
set Interface63 "wire"
set DataType63 "[list ap_uint 1 ]"
set Port63 [list $PortName63 $Interface63 $DataType63 $Pointer63 $Dims63 $Const63 $Volatile63 $ArrayOpt63]
lappend structMem6 $Port63
set DataType6tp0 "int"
set DataType6tp1 "int"
set structParameter6 [list [list $DataType6tp0 D] [list $DataType6tp1 R] ]
set structArgument6 [list 512 1 ]
set NameSpace6 [list ]
set structIsPacked6 "0"
set DataType6 [list "routed_net_axis<512, 1>" "struct routed_net_axis" $structMem6 1 0 $structParameter6 $structArgument6 $NameSpace6 $structIsPacked6]
set Port6 [list $PortName6 $Interface6 $DataType6 $Pointer6 $Dims6 $Const6 $Volatile6 $ArrayOpt6]
lappend PortList $Port6
set PortName7 "s_axis_mem_read_data"
set BitWidth7 "1024"
set ArrayOpt7 ""
set Const7 "0"
set Volatile7 "0"
set Pointer7 "2"
set Reference7 "1"
set Dims7 [list 0]
set Interface7 [list AP_STREAM 0] 
set structMem7 ""
set PortName70 "data"
set BitWidth70 "512"
set ArrayOpt70 ""
set Const70 "0"
set Volatile70 "0"
set Pointer70 "0"
set Reference70 "0"
set Dims70 [list 0]
set Interface70 "wire"
set DataType70 "[list ap_uint 512 ]"
set Port70 [list $PortName70 $Interface70 $DataType70 $Pointer70 $Dims70 $Const70 $Volatile70 $ArrayOpt70]
lappend structMem7 $Port70
set PortName71 "keep"
set BitWidth71 "64"
set ArrayOpt71 ""
set Const71 "0"
set Volatile71 "0"
set Pointer71 "0"
set Reference71 "0"
set Dims71 [list 0]
set Interface71 "wire"
set DataType71 "[list ap_uint 64 ]"
set Port71 [list $PortName71 $Interface71 $DataType71 $Pointer71 $Dims71 $Const71 $Volatile71 $ArrayOpt71]
lappend structMem7 $Port71
set PortName72 "last"
set BitWidth72 "8"
set ArrayOpt72 ""
set Const72 "0"
set Volatile72 "0"
set Pointer72 "0"
set Reference72 "0"
set Dims72 [list 0]
set Interface72 "wire"
set DataType72 "[list ap_uint 1 ]"
set Port72 [list $PortName72 $Interface72 $DataType72 $Pointer72 $Dims72 $Const72 $Volatile72 $ArrayOpt72]
lappend structMem7 $Port72
set DataType7tp0 "int"
set structParameter7 [list [list $DataType7tp0 D] ]
set structArgument7 [list 512 ]
set NameSpace7 [list ]
set structIsPacked7 "0"
set DataType7 [list "net_axis<512>" "struct net_axis" $structMem7 1 0 $structParameter7 $structArgument7 $NameSpace7 $structIsPacked7]
set Port7 [list $PortName7 $Interface7 $DataType7 $Pointer7 $Dims7 $Const7 $Volatile7 $ArrayOpt7]
lappend PortList $Port7
set PortName8 "s_axis_qp_interface"
set BitWidth8 "256"
set ArrayOpt8 ""
set Const8 "0"
set Volatile8 "0"
set Pointer8 "2"
set Reference8 "1"
set Dims8 [list 0]
set Interface8 [list AP_STREAM 0] 
set structMem8 ""
set PortName80 "newState"
set BitWidth80 "3"
set ArrayOpt80 ""
set Const80 "0"
set Volatile80 "0"
set Pointer80 "0"
set Reference80 "0"
set Dims80 [list 0]
set Interface80 "wire"
set DataType80 "[list qpState enum 0]"
set Port80 [list $PortName80 $Interface80 $DataType80 $Pointer80 $Dims80 $Const80 $Volatile80 $ArrayOpt80]
lappend structMem8 $Port80
set PortName81 "qp_num"
set BitWidth81 "32"
set ArrayOpt81 ""
set Const81 "0"
set Volatile81 "0"
set Pointer81 "0"
set Reference81 "0"
set Dims81 [list 0]
set Interface81 "wire"
set DataType81 "[list ap_uint 24 ]"
set Port81 [list $PortName81 $Interface81 $DataType81 $Pointer81 $Dims81 $Const81 $Volatile81 $ArrayOpt81]
lappend structMem8 $Port81
set PortName82 "remote_psn"
set BitWidth82 "32"
set ArrayOpt82 ""
set Const82 "0"
set Volatile82 "0"
set Pointer82 "0"
set Reference82 "0"
set Dims82 [list 0]
set Interface82 "wire"
set DataType82 "[list ap_uint 24 ]"
set Port82 [list $PortName82 $Interface82 $DataType82 $Pointer82 $Dims82 $Const82 $Volatile82 $ArrayOpt82]
lappend structMem8 $Port82
set PortName83 "local_psn"
set BitWidth83 "32"
set ArrayOpt83 ""
set Const83 "0"
set Volatile83 "0"
set Pointer83 "0"
set Reference83 "0"
set Dims83 [list 0]
set Interface83 "wire"
set DataType83 "[list ap_uint 24 ]"
set Port83 [list $PortName83 $Interface83 $DataType83 $Pointer83 $Dims83 $Const83 $Volatile83 $ArrayOpt83]
lappend structMem8 $Port83
set PortName84 "r_key"
set BitWidth84 "16"
set ArrayOpt84 ""
set Const84 "0"
set Volatile84 "0"
set Pointer84 "0"
set Reference84 "0"
set Dims84 [list 0]
set Interface84 "wire"
set DataType84 "[list ap_uint 16 ]"
set Port84 [list $PortName84 $Interface84 $DataType84 $Pointer84 $Dims84 $Const84 $Volatile84 $ArrayOpt84]
lappend structMem8 $Port84
set PortName85 "virtual_address"
set BitWidth85 "64"
set ArrayOpt85 ""
set Const85 "0"
set Volatile85 "0"
set Pointer85 "0"
set Reference85 "0"
set Dims85 [list 0]
set Interface85 "wire"
set DataType85 "[list ap_uint 48 ]"
set Port85 [list $PortName85 $Interface85 $DataType85 $Pointer85 $Dims85 $Const85 $Volatile85 $ArrayOpt85]
lappend structMem8 $Port85
set structParameter8 [list ]
set structArgument8 [list ]
set NameSpace8 [list ]
set structIsPacked8 "0"
set DataType8 [list "qpContext" "struct qpContext" $structMem8 1 0 $structParameter8 $structArgument8 $NameSpace8 $structIsPacked8]
set Port8 [list $PortName8 $Interface8 $DataType8 $Pointer8 $Dims8 $Const8 $Volatile8 $ArrayOpt8]
lappend PortList $Port8
set PortName9 "s_axis_qp_conn_interface"
set BitWidth9 "384"
set ArrayOpt9 ""
set Const9 "0"
set Volatile9 "0"
set Pointer9 "2"
set Reference9 "1"
set Dims9 [list 0]
set Interface9 [list AP_STREAM 0] 
set structMem9 ""
set PortName90 "qpn"
set BitWidth90 "16"
set ArrayOpt90 ""
set Const90 "0"
set Volatile90 "0"
set Pointer90 "0"
set Reference90 "0"
set Dims90 [list 0]
set Interface90 "wire"
set DataType90 "[list ap_uint 16 ]"
set Port90 [list $PortName90 $Interface90 $DataType90 $Pointer90 $Dims90 $Const90 $Volatile90 $ArrayOpt90]
lappend structMem9 $Port90
set PortName91 "remote_qpn"
set BitWidth91 "32"
set ArrayOpt91 ""
set Const91 "0"
set Volatile91 "0"
set Pointer91 "0"
set Reference91 "0"
set Dims91 [list 0]
set Interface91 "wire"
set DataType91 "[list ap_uint 24 ]"
set Port91 [list $PortName91 $Interface91 $DataType91 $Pointer91 $Dims91 $Const91 $Volatile91 $ArrayOpt91]
lappend structMem9 $Port91
set PortName92 "remote_ip_address"
set BitWidth92 "128"
set ArrayOpt92 ""
set Const92 "0"
set Volatile92 "0"
set Pointer92 "0"
set Reference92 "0"
set Dims92 [list 0]
set Interface92 "wire"
set DataType92 "[list ap_uint 128 ]"
set Port92 [list $PortName92 $Interface92 $DataType92 $Pointer92 $Dims92 $Const92 $Volatile92 $ArrayOpt92]
lappend structMem9 $Port92
set PortName93 "remote_udp_port"
set BitWidth93 "16"
set ArrayOpt93 ""
set Const93 "0"
set Volatile93 "0"
set Pointer93 "0"
set Reference93 "0"
set Dims93 [list 0]
set Interface93 "wire"
set DataType93 "[list ap_uint 16 ]"
set Port93 [list $PortName93 $Interface93 $DataType93 $Pointer93 $Dims93 $Const93 $Volatile93 $ArrayOpt93]
lappend structMem9 $Port93
set structParameter9 [list ]
set structArgument9 [list ]
set NameSpace9 [list ]
set structIsPacked9 "0"
set DataType9 [list "ifConnReq" "struct ifConnReq" $structMem9 1 0 $structParameter9 $structArgument9 $NameSpace9 $structIsPacked9]
set Port9 [list $PortName9 $Interface9 $DataType9 $Pointer9 $Dims9 $Const9 $Volatile9 $ArrayOpt9]
lappend PortList $Port9
set PortName10 "local_ip_address"
set BitWidth10 "128"
set ArrayOpt10 ""
set Const10 "0"
set Volatile10 "0"
set Pointer10 "0"
set Reference10 "0"
set Dims10 [list 0]
set Interface10 "wire"
set DataType10 "[list ap_uint 128 ]"
set Port10 [list $PortName10 $Interface10 $DataType10 $Pointer10 $Dims10 $Const10 $Volatile10 $ArrayOpt10]
lappend PortList $Port10
set PortName11 "regCrcDropPkgCount"
set BitWidth11 "32"
set ArrayOpt11 ""
set Const11 "0"
set Volatile11 "0"
set Pointer11 "2"
set Reference11 "1"
set Dims11 [list 0]
set Interface11 "wire"
set DataType11 "[list ap_uint 32 ]"
set Port11 [list $PortName11 $Interface11 $DataType11 $Pointer11 $Dims11 $Const11 $Volatile11 $ArrayOpt11]
lappend PortList $Port11
set PortName12 "regInvalidPsnDropCount"
set BitWidth12 "32"
set ArrayOpt12 ""
set Const12 "0"
set Volatile12 "0"
set Pointer12 "2"
set Reference12 "1"
set Dims12 [list 0]
set Interface12 "wire"
set DataType12 "[list ap_uint 32 ]"
set Port12 [list $PortName12 $Interface12 $DataType12 $Pointer12 $Dims12 $Const12 $Volatile12 $ArrayOpt12]
lappend PortList $Port12
set globalAPint "" 
set returnAPInt "" 
set hasCPPAPInt 1 
set argAPInt "" 
set hasCPPAPFix 0 
set hasSCFix 0 
set hasCBool 0 
set hasCPPComplex 0 
set isTemplateTop 0
set hasHalf 0 
set dataPackList ""
set module [list $moduleName $PortList $rawDecl $argAPInt $returnAPInt $dataPackList]
