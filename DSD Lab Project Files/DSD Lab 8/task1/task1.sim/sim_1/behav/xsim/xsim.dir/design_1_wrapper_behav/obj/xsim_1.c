/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_408(char*, char *);
extern void execute_78(char*, char *);
extern void execute_81(char*, char *);
extern void execute_398(char*, char *);
extern void execute_399(char*, char *);
extern void execute_396(char*, char *);
extern void execute_95(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_390(char*, char *);
extern void execute_385(char*, char *);
extern void execute_120(char*, char *);
extern void execute_141(char*, char *);
extern void execute_157(char*, char *);
extern void execute_173(char*, char *);
extern void execute_189(char*, char *);
extern void execute_206(char*, char *);
extern void execute_217(char*, char *);
extern void execute_234(char*, char *);
extern void execute_250(char*, char *);
extern void execute_266(char*, char *);
extern void execute_282(char*, char *);
extern void execute_299(char*, char *);
extern void execute_326(char*, char *);
extern void execute_307(char*, char *);
extern void execute_309(char*, char *);
extern void execute_312(char*, char *);
extern void execute_314(char*, char *);
extern void execute_316(char*, char *);
extern void execute_318(char*, char *);
extern void execute_320(char*, char *);
extern void execute_322(char*, char *);
extern void execute_324(char*, char *);
extern void execute_333(char*, char *);
extern void execute_341(char*, char *);
extern void execute_348(char*, char *);
extern void execute_356(char*, char *);
extern void execute_361(char*, char *);
extern void execute_368(char*, char *);
extern void execute_375(char*, char *);
extern void execute_382(char*, char *);
extern void execute_389(char*, char *);
extern void execute_127(char*, char *);
extern void execute_129(char*, char *);
extern void execute_131(char*, char *);
extern void execute_109(char*, char *);
extern void execute_110(char*, char *);
extern void execute_105(char*, char *);
extern void execute_108(char*, char *);
extern void execute_409(char*, char *);
extern void execute_405(char*, char *);
extern void execute_406(char*, char *);
extern void execute_407(char*, char *);
extern void execute_411(char*, char *);
extern void execute_412(char*, char *);
extern void execute_413(char*, char *);
extern void execute_414(char*, char *);
extern void execute_415(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[65] = {(funcp)execute_408, (funcp)execute_78, (funcp)execute_81, (funcp)execute_398, (funcp)execute_399, (funcp)execute_396, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_390, (funcp)execute_385, (funcp)execute_120, (funcp)execute_141, (funcp)execute_157, (funcp)execute_173, (funcp)execute_189, (funcp)execute_206, (funcp)execute_217, (funcp)execute_234, (funcp)execute_250, (funcp)execute_266, (funcp)execute_282, (funcp)execute_299, (funcp)execute_326, (funcp)execute_307, (funcp)execute_309, (funcp)execute_312, (funcp)execute_314, (funcp)execute_316, (funcp)execute_318, (funcp)execute_320, (funcp)execute_322, (funcp)execute_324, (funcp)execute_333, (funcp)execute_341, (funcp)execute_348, (funcp)execute_356, (funcp)execute_361, (funcp)execute_368, (funcp)execute_375, (funcp)execute_382, (funcp)execute_389, (funcp)execute_127, (funcp)execute_129, (funcp)execute_131, (funcp)execute_109, (funcp)execute_110, (funcp)execute_105, (funcp)execute_108, (funcp)execute_409, (funcp)execute_405, (funcp)execute_406, (funcp)execute_407, (funcp)execute_411, (funcp)execute_412, (funcp)execute_413, (funcp)execute_414, (funcp)execute_415, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_1, (funcp)transaction_2, (funcp)transaction_3, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 65;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/design_1_wrapper_behav/xsim.reloc",  (void **)funcTab, 65);
	iki_vhdl_file_variable_register(dp + 26856);
	iki_vhdl_file_variable_register(dp + 26912);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/design_1_wrapper_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/design_1_wrapper_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 39552, dp + 39096, 0, 7, 0, 7, 8, 1);
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/design_1_wrapper_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/design_1_wrapper_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/design_1_wrapper_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
