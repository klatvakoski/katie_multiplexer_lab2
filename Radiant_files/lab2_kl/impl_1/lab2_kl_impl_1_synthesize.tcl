if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2026.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) "1"
set para(prj_dir) "C:/Users/klatvakoski/Documents/GitHub/katie_multiplexer_lab2/Radiant_files/lab2_kl"
if {![file exists {C:/Users/klatvakoski/Documents/GitHub/katie_multiplexer_lab2/Radiant_files/lab2_kl/impl_1}]} {
  file mkdir {C:/Users/klatvakoski/Documents/GitHub/katie_multiplexer_lab2/Radiant_files/lab2_kl/impl_1}
}
cd {C:/Users/klatvakoski/Documents/GitHub/katie_multiplexer_lab2/Radiant_files/lab2_kl/impl_1}
# synthesize IPs
# synthesize VMs
# synthesize top design
::radiant::runengine::run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o lab2_kl_impl_1_syn.udb lab2_kl_impl_1.vm] [list lab2_kl_impl_1.ldc]

} out]} {
   ::radiant::runengine::runtime_log $out
   exit 1
}
