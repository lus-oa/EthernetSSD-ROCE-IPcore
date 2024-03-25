set proj_name "network_stack_example_prj"
set root_dir [pwd]
set proj_dir $root_dir/$proj_name
set src_dir $root_dir/../hdl
set ip_dir $root_dir/../ip
set ip_repo $root_dir/../iprepo
set constraints_dir $root_dir/../constraints

#Check if iprepo is available
if { [file isdirectory $ip_repo] } {
	set lib_dir "$ip_repo"
} else {
	puts "iprepo directory could not be found."
	exit 1
}
# Create project
create_project -force $proj_name $proj_dir

# Set project properties
set obj [get_projects $proj_name]
set_property part {xcvu9p-flga2104-2L-e} $obj
set_property "target_language" "Verilog" $obj

set_property IP_REPO_PATHS $lib_dir [current_fileset]
update_ip_catalog

# Add sources
add_files $src_dir/common
add_files -norecurse $src_dir/ultraplus
add_files $src_dir/ultraplus/
set_property top tcp_ip_top [current_fileset]

add_files $ip_dir/SmartCamCtl.dcp
add_files -fileset constrs_1 $constraints_dir/.xdc

#create ip directory
file mkdir $ip_dir/

set device_ip_dir $ip_dir/


#Create IPs

#Network interface
source /home/embed/Desktop/vitis-roce/scripts/network_ultraplus.tcl

#AXI Infrastructure: FIFOs, Register slices, Interconnect
source /home/embed/Desktop/vitis-roce/scripts/axi_infrastructure.tcl

#Network stack
source /home/embed/Desktop/vitis-roce/scripts/network_stack.tcl

#VIOs
source /home/embed/Desktop/vitis-roce/scripts/common.tcl

#Memory interface
source /home/embed/Desktop/vitis-roce/scripts/dram_ultraplus.tcl


start_gui
