// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __read_req_table_req_table_max_fwd_re_H__
#define __read_req_table_req_table_max_fwd_re_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct read_req_table_req_table_max_fwd_re_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 24;
  static const unsigned AddressRange = 500;
  static const unsigned AddressWidth = 9;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in <sc_logic> ce1;
sc_core::sc_in<sc_logic> we1;
sc_core::sc_in<sc_lv<DataWidth> > d1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(read_req_table_req_table_max_fwd_re_ram) {
        for (unsigned i = 0; i < 500; i = i + 1) {
            ram[i] = 0;
        }
   }


}; //endmodule


SC_MODULE(read_req_table_req_table_max_fwd_re) {


static const unsigned DataWidth = 24;
static const unsigned AddressRange = 500;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in<sc_logic> ce1;
sc_core::sc_in<sc_logic> we1;
sc_core::sc_in<sc_lv<DataWidth> > d1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


read_req_table_req_table_max_fwd_re_ram* meminst;


SC_CTOR(read_req_table_req_table_max_fwd_re) {
meminst = new read_req_table_req_table_max_fwd_re_ram("read_req_table_req_table_max_fwd_re_ram");

meminst->address1(address1);
meminst->ce1(ce1);
meminst->we1(we1);
meminst->d1(d1);

meminst->reset(reset);
meminst->clk(clk);
}
~read_req_table_req_table_max_fwd_re() {
    delete meminst;
}


};//endmodule
#endif
