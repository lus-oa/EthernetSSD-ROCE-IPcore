set clock_constraint { \
    name clk \
    module rocev2_top \
    port ap_clk \
    period 8 \
    uncertainty 1 \
}

set all_path {}

set false_path {}
