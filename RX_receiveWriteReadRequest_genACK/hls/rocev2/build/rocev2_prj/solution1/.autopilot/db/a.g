#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build/rocev2_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
