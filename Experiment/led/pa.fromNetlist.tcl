
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name led -dir "/home/yzy/code/ElectronicTestingandExperimentalTechnology/E8/Experiment/led/planAhead_run_2" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/yzy/code/ElectronicTestingandExperimentalTechnology/E8/Experiment/led/led.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/yzy/code/ElectronicTestingandExperimentalTechnology/E8/Experiment/led} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "led.ucf" [current_fileset -constrset]
add_files [list {led.ucf}] -fileset [get_property constrset [current_run]]
link_design
