; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 1h 38m 27s; total estimated time: 1h 38m 47s
; total layer number: 50
; total filament length [mm] : 5367.39,3918.93
; total filament volume [cm^3] : 12910.08,9426.13
; total filament weight [g] : 16.27,12.07
; model label id: 47,58
; object max height: 10.00,10.00
; filament_density: 1.26,1.28
; filament_diameter: 1.75,1.75
; max_z_height: 10.00
; filament: 1,2
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 70,0
; additional_fan_full_speed_layer = 0,0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200
; close_additional_fan_first_x_layers = 1,3
; close_fan_the_first_x_layers = 1,3
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70,70
; cool_plate_temp = 35,0
; cool_plate_temp_initial_layer = 35,0
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10,10
; cooling_slowdown_logic = uniform_cooling,uniform_cooling
; counter_coef_1 = 0,0
; counter_coef_2 = 0.008,0.008
; counter_coef_3 = -0.041,-0.041
; counter_limit_max = 0.033,0.033
; counter_limit_min = -0.035,-0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50
; different_settings_to_system = ;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,70
; eng_plate_temp_initial_layer = 0,70
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100,20
; fan_direction = left
; fan_max_speed = 100,40
; fan_min_speed = 100,20
; farthest_point_timelapse = 1
; filament_adaptive_volumetric_speed = 0,0
; filament_adhesiveness_category = 100,300
; filament_bridge_speed = 25,25
; filament_change_length = 5,12
; filament_change_length_nc = 10
; filament_colour = #00AE42;#F72323
; filament_cooling_before_tower = 0,0
; filament_cost = 19.99,19.99
; filament_density = 1.26,1.28
; filament_dev_ams_drying_ams_limitations = 1;1
; filament_dev_ams_drying_heat_distortion_temperature = 45,75
; filament_dev_ams_drying_temperature = 45,65
; filament_dev_ams_drying_time = 12,12
; filament_dev_chamber_drying_bed_temperature = 70,80
; filament_dev_chamber_drying_time = 12,12
; filament_dev_drying_cooling_temperature = 45,55
; filament_dev_drying_softening_temperature = 50,60
; filament_diameter = 1.75,1.75
; filament_enable_overhang_speed = 1,1
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_compatibility = 0,0
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.95
; filament_flush_temp = 0,0
; filament_flush_temp_fast = 0,0
; filament_flush_volumetric_speed = 0,0
; filament_ids = GFA00;GFG02
; filament_is_mixed = 0
; filament_is_support = 0,0
; filament_long_retractions_when_cut = 1,1
; filament_map = 1,1
; filament_map_2 = 0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21,21
; filament_metal_stickiness = None,High
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0,0
; filament_overhang_1_4_speed = 0,0
; filament_overhang_2_4_speed = 50,50
; filament_overhang_3_4_speed = 30,30
; filament_overhang_4_4_speed = 10,10
; filament_overhang_totally_speed = 10,10
; filament_pre_cooling_temperature = 0,0
; filament_pre_cooling_temperature_nc = 0,0
; filament_preheat_temperature_delta = 0,0
; filament_prime_volume = 30,30
; filament_prime_volume_nc = 60,60
; filament_printable = 3,3
; filament_ramming_travel_time = 0,0
; filament_ramming_travel_time_nc = 0,0
; filament_ramming_volumetric_speed = -1,-1
; filament_ramming_volumetric_speed_nc = -1,-1
; filament_retract_length_nc = 14,14
; filament_retraction_distances_when_cut = 18,18
; filament_scarf_gap = 0%,0%
; filament_scarf_height = 10%,10%
; filament_scarf_length = 10,10
; filament_scarf_seam_type = none,none
; filament_self_index = 1,2
; filament_settings_id = "Bambu PLA Basic @BBL X1C (flat)";"Bambu PETG HF @BBL X1C (flat)"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10,10
; filament_tower_interface_pre_extrusion_length = 0,0
; filament_tower_interface_print_temp = -1,-1
; filament_tower_interface_purge_volume = 20,20
; filament_tower_ironing_area = 4,4
; filament_type = PLA;PETG
; filament_velocity_adaptation_factor = 1,1
; filament_vendor = "Bambu Lab";"Bambu Lab"
; filament_volume_map = 0,0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0,265,375,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0
; hole_coef_2 = -0.008,-0.008
; hole_coef_3 = 0.23415,0.23415
; hole_limit_max = 0.22,0.22
; hole_limit_min = 0.088,0.088
; hot_plate_temp = 55,70
; hot_plate_temp_initial_layer = 55,70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8,10.6
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of \"timelapse_record_flag\"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_force_Y = 0
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = G0 Z20 F9000\nG92 E0; G1 E-10 F1200\nG28\nM970 Q1 A10 B10 C130 K0\nM970 Q1 A10 B131 C250 K1\nM974 Q1 S1 P0\nM970 Q0 A10 B10 C130 H20 K0\nM970 Q0 A10 B131 C250 K1\nM974 Q0 S1 P0\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nG29 ;Home\nG90;\nG92 E0 ;Reset Extruder \nG1 Z2.0 F3000 ;Move Z Axis up \nG1 X10.1 Y20 Z0.28 F5000.0 ;Move to start position\nM109 S205;\nG1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line\nG1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little\nG1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line\nG92 E0 ;Reset Extruder \nG1 X110 Y110 Z2.0 F3000 ;Move Z Axis up
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220,245
; nozzle_temperature_initial_layer = 220,230
; nozzle_temperature_range_high = 240,270
; nozzle_temperature_range_low = 190,230
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,10%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0,0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 4,10
; slow_down_min_speed = 20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,70
; supertack_plate_temp_initial_layer = 45,70
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,70
; template_custom_gcode = 
; textured_plate_temp = 55,70
; textured_plate_temp_initial_layer = 55,70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 217.697
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R98
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
M190 S55 ; set bed temperature and wait for it to be reached
; FEATURE: Custom
G0 Z20 F9000
G92 E0; G1 E-10 F1200
G28
M970 Q1 A10 B10 C130 K0
M970 Q1 A10 B131 C250 K1
M974 Q1 S1 P0
M970 Q0 A10 B10 C130 H20 K0
M970 Q0 A10 B131 C250 K1
M974 Q0 S1 P0
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
G29 ;Home
G90;
G92 E0 ;Reset Extruder 
G1 Z2.0 F3000 ;Move Z Axis up 
G1 X10.1 Y20 Z0.28 F5000.0 ;Move to start position
M109 S205;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder 
G1 X110 Y110 Z2.0 F3000 ;Move Z Axis up
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.6 F30000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/50
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G1 X137.143 Y124.143 F30000
M204 S6000
G1 Z1
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X118.857 Y124.143 E.68108
G1 X118.857 Y105.857 E.68108
G1 X137.143 Y105.857 E.68108
G1 X137.143 Y124.083 E.67884
M204 S6000
G1 X137.6 Y124.6 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X118.4 Y124.6 E.71513
G1 X118.4 Y105.4 E.71513
G1 X137.6 Y105.4 E.71513
G1 X137.6 Y124.54 E.71289
; WIPE_START
G1 X135.6 Y124.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.776 Y116.916 Z.6 F30000
G1 X136.026 Y106.04 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50487
G1 F6300
M204 S500
G1 X136.754 Y106.769 E.03879
G1 X136.754 Y107.422 E.02459
G1 X135.578 Y106.246 E.06262
G1 X134.925 Y106.246 E.02459
G1 X136.754 Y108.075 E.0974
G1 X136.754 Y108.728 E.02459
G1 X134.272 Y106.246 E.13217
G1 X133.618 Y106.246 E.02459
G1 X136.754 Y109.382 E.16695
G1 X136.754 Y110.035 E.02459
G1 X132.965 Y106.246 E.20173
G1 X132.312 Y106.246 E.02459
G1 X136.754 Y110.688 E.23651
G1 X136.754 Y111.342 E.02459
G1 X131.658 Y106.246 E.27129
G1 X131.005 Y106.246 E.02459
G1 X136.754 Y111.995 E.30607
G1 X136.754 Y112.648 E.02459
G1 X130.352 Y106.246 E.34084
G1 X129.699 Y106.246 E.02459
G1 X136.754 Y113.302 E.37562
G1 X136.754 Y113.955 E.02459
G1 X129.045 Y106.246 E.4104
G1 X128.392 Y106.246 E.02459
G1 X136.754 Y114.608 E.44518
G1 X136.754 Y115.261 E.02459
G1 X127.739 Y106.246 E.47996
G1 X127.085 Y106.246 E.02459
G1 X136.754 Y115.915 E.51474
G1 X136.754 Y116.568 E.02459
G1 X126.432 Y106.246 E.54952
G1 X125.779 Y106.246 E.02459
G1 X136.754 Y117.221 E.58429
G1 X136.754 Y117.875 E.02459
G1 X125.125 Y106.246 E.61907
G1 X124.472 Y106.246 E.02459
G1 X136.754 Y118.528 E.65385
G1 X136.754 Y119.181 E.02459
G1 X123.819 Y106.246 E.68863
G1 X123.166 Y106.246 E.02459
G1 X136.754 Y119.834 E.72341
G1 X136.754 Y120.488 E.02459
G1 X122.512 Y106.246 E.75819
G1 X121.859 Y106.246 E.02459
G1 X136.754 Y121.141 E.79296
G1 X136.754 Y121.794 E.02459
G1 X121.206 Y106.246 E.82774
G1 X120.552 Y106.246 E.02459
G1 X136.754 Y122.448 E.86252
G1 X136.754 Y123.101 E.02459
G1 X119.899 Y106.246 E.8973
G1 X119.246 Y106.246 E.02459
G1 X136.754 Y123.754 E.93208
G1 X136.101 Y123.754 E.02458
G1 X119.246 Y106.899 E.89732
G1 X119.246 Y107.552 E.02459
G1 X135.448 Y123.754 E.86254
G1 X134.795 Y123.754 E.02459
G1 X119.246 Y108.205 E.82777
G1 X119.246 Y108.859 E.02459
G1 X134.141 Y123.754 E.79299
G1 X133.488 Y123.754 E.02459
G1 X119.246 Y109.512 E.75821
G1 X119.246 Y110.165 E.02459
G1 X132.835 Y123.754 E.72343
G1 X132.182 Y123.754 E.02459
G1 X119.246 Y110.818 E.68865
G1 X119.246 Y111.472 E.02459
G1 X131.528 Y123.754 E.65387
G1 X130.875 Y123.754 E.02459
G1 X119.246 Y112.125 E.61909
G1 X119.246 Y112.778 E.02459
G1 X130.222 Y123.754 E.58432
G1 X129.568 Y123.754 E.02459
G1 X119.246 Y113.432 E.54954
G1 X119.246 Y114.085 E.02459
G1 X128.915 Y123.754 E.51476
G1 X128.262 Y123.754 E.02459
G1 X119.246 Y114.738 E.47998
G1 X119.246 Y115.392 E.02459
G1 X127.609 Y123.754 E.4452
G1 X126.955 Y123.754 E.02459
G1 X119.246 Y116.045 E.41042
G1 X119.246 Y116.698 E.02459
G1 X126.302 Y123.754 E.37565
G1 X125.649 Y123.754 E.02459
G1 X119.246 Y117.351 E.34087
G1 X119.246 Y118.005 E.02459
G1 X124.995 Y123.754 E.30609
G1 X124.342 Y123.754 E.02459
G1 X119.246 Y118.658 E.27131
G1 X119.246 Y119.311 E.02459
G1 X123.689 Y123.754 E.23653
G1 X123.035 Y123.754 E.02459
G1 X119.246 Y119.965 E.20175
G1 X119.246 Y120.618 E.02459
G1 X122.382 Y123.754 E.16697
G1 X121.729 Y123.754 E.02459
G1 X119.246 Y121.271 E.1322
G1 X119.246 Y121.925 E.02459
G1 X121.076 Y123.754 E.09742
G1 X120.422 Y123.754 E.02459
G1 X119.246 Y122.578 E.06264
G1 X119.246 Y123.231 E.02459
G1 X119.975 Y123.96 E.03881
; WIPE_START
M204 S500
G1 X119.246 Y123.231 E-.39179
G1 X119.246 Y122.578 E-.24825
G1 X119.469 Y122.801 E-.11996
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
M204 S6000
G17
G3 Z.6 I-1.043 J.627 P1  F30000
G1 X190.026 Y240.229 Z.6
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X190.526 Y240.729  
M204 S500
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F3000
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
M204 S6000
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
M204 S500
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F3000
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
M204 S6000
G1  X192.353 Y239.516  
M204 S500
G3  X189.132 Y242.765   I-19.285 J-15.896 E0.1741
G3  X185.367 Y241.988   I-1.473 J-2.374 E0.1612
G2  X182.857 Y241.186   I-2.527 J3.578 E0.1017
G2  X174.357 Y241.199   I-4.105 J94.816 E0.3232
G2  X170.922 Y242.989   I0.974 J6.061 E0.1498
G3  X168.142 Y242.523   I-1.061 J-2.191 E0.1142
G3  X164.972 Y239.243   I16.257 J-18.888 E0.1736
G3  X165.789 Y235.632   I2.317 J-1.373 E0.1551
G2  X166.569 Y233.263   I-3.258 J-2.385 E0.0964
G2  X166.556 Y224.874   I-91.154 J-4.057 E0.3190
G2  X164.807 Y221.636   I-5.577 J0.921 E0.1425
G3  X165.199 Y218.942   I2.094 J-1.071 E0.1103
G3  X168.420 Y215.693   I19.280 J15.892 E0.1741
G3  X172.185 Y216.470   I1.473 J2.374 E0.1612
G2  X174.695 Y217.272   I2.527 J-3.578 E0.1017
G2  X183.195 Y217.259   I4.105 J-94.816 E0.3232
G2  X186.630 Y215.469   I-0.974 J-6.061 E0.1498
G3  X187.913 Y215.228   I1.077 J2.203 E0.0502
G3  X189.410 Y215.935   I-0.227 J2.419 E0.0642
G3  X192.580 Y219.215   I-16.251 J18.882 E0.1736
G3  X191.763 Y222.826   I-2.317 J1.373 E0.1551
G2  X190.983 Y225.195   I3.257 J2.385 E0.0964
G2  X190.996 Y233.584   I91.154 J4.057 E0.3190
G2  X192.745 Y236.822   I5.577 J-0.921 E0.1425
G3  X192.353 Y239.516   I-2.094 J1.071 E0.1103
M204 S6000
G1  X192.686 Y239.829  
M204 S500
G3  X189.405 Y243.132   I-19.515 J-16.105 E0.1772
G3  X185.101 Y242.361   I-1.758 J-2.583 E0.1841
G2  X182.853 Y241.643   I-2.259 J3.199 E0.0911
G2  X174.392 Y241.655   I-4.098 J94.851 E0.3217
G2  X171.125 Y243.399   I1.420 J6.594 E0.1426
G3  X167.822 Y242.849   I-1.263 J-2.608 E0.1357
G3  X164.599 Y239.508   I16.468 J-19.111 E0.1767
G3  X165.503 Y235.246   I2.834 J-1.625 E0.1812
G2  X166.112 Y233.259   I-2.927 J-1.984 E0.0802
G2  X166.101 Y224.910   I-91.222 J-4.050 E0.3174
G2  X164.402 Y221.848   I-6.021 J1.337 E0.1350
G3  X164.866 Y218.629   I2.506 J-1.281 E0.1318
G1  X167.822 Y215.609   E0.1606
G3  X172.451 Y216.097   I2.099 J2.283 E0.2001
G2  X174.699 Y216.815   I2.260 J-3.199 E0.0911
G2  X183.160 Y216.803   I4.098 J-94.855 E0.3217
G2  X186.427 Y215.059   I-1.420 J-6.595 E0.1426
G3  X189.730 Y215.609   I1.263 J2.608 E0.1357
G3  X192.953 Y218.950   I-16.463 J19.107 E0.1767
G3  X192.049 Y223.212   I-2.834 J1.625 E0.1812
G2  X191.440 Y225.199   I2.927 J1.984 E0.0802
M73 P0 R97
G2  X191.451 Y233.548   I91.222 J4.050 E0.3174
G2  X193.150 Y236.610   I6.021 J-1.337 E0.1350
G3  X192.686 Y239.829   I-2.506 J1.281 E0.1318
M204 S6000
G1  X193.019 Y240.142  
M204 S500
G3  X189.678 Y243.499   I-19.773 J-16.340 E0.1802
G3  X184.727 Y242.658   I-2.019 J-3.108 E0.2097
G2  X182.848 Y242.100   I-1.871 J2.859 E0.0755
G2  X174.428 Y242.111   I-4.092 J95.022 E0.3201
G2  X171.328 Y243.808   I1.816 J6.993 E0.1357
G3  X167.501 Y243.175   I-1.465 J-3.024 E0.1571
G3  X164.226 Y239.773   I16.708 J-19.364 E0.1798
G3  X165.125 Y234.989   I2.992 J-1.914 E0.2038
G2  X165.655 Y233.254   I-2.548 J-1.727 E0.0700
G2  X165.645 Y224.947   I-91.529 J-4.044 E0.3158
G2  X163.997 Y222.060   I-6.331 J1.700 E0.1277
G3  X164.533 Y218.316   I2.918 J-1.492 E0.1532
G3  X167.874 Y214.959   I19.769 J16.336 E0.1802
G3  X172.825 Y215.800   I2.019 J3.108 E0.2097
G2  X174.704 Y216.358   I1.872 J-2.859 E0.0755
G2  X183.124 Y216.347   I4.092 J-95.022 E0.3201
G2  X186.224 Y214.650   I-1.816 J-6.993 E0.1357
G3  X187.995 Y214.317   I1.488 J3.042 E0.0693
G3  X190.051 Y215.283   I-0.312 J3.336 E0.0881
G3  X193.326 Y218.685   I-16.704 J19.360 E0.1798
G3  X192.427 Y223.469   I-2.992 J1.914 E0.2038
G2  X191.897 Y225.204   I2.548 J1.727 E0.0700
G2  X191.907 Y233.511   I91.534 J4.044 E0.3158
G2  X193.555 Y236.398   I6.331 J-1.700 E0.1277
G3  X193.019 Y240.142   I-2.918 J1.492 E0.1532
M204 S6000
G1  X193.352 Y240.456  
M204 S500
G3  X189.951 Y243.866   I-20.046 J-16.589 E0.1833
G3  X184.380 Y242.980   I-2.281 J-3.612 E0.2342
G2  X182.844 Y242.557   I-1.537 J2.583 E0.0613
G2  X174.463 Y242.566   I-4.086 J95.391 E0.3186
G2  X171.792 Y244.076   I0.827 J4.582 E0.1188
G3  X167.181 Y243.501   I-1.936 J-3.251 E0.1901
G3  X163.853 Y240.038   I16.967 J-19.635 E0.1828
G3  X164.803 Y234.646   I3.462 J-2.170 E0.2280
G2  X165.198 Y233.249   I-2.266 J-1.395 E0.0559
G2  X165.189 Y224.983   I-91.952 J-4.037 E0.3143
G2  X163.736 Y222.523   I-4.133 J0.783 E0.1108
G3  X164.200 Y218.002   I3.139 J-1.962 E0.1860
G3  X167.601 Y214.592   I20.043 J16.586 E0.1833
G3  X173.173 Y215.478   I2.281 J3.613 E0.2342
G2  X174.708 Y215.901   I1.536 J-2.583 E0.0612
G2  X183.089 Y215.892   I4.086 J-95.391 E0.3186
G2  X185.760 Y214.382   I-0.827 J-4.582 E0.1188
G3  X188.035 Y213.862   I1.995 J3.488 E0.0900
G3  X190.371 Y214.957   I-0.355 J3.795 E0.1000
G3  X193.699 Y218.420   I-16.963 J19.631 E0.1828
G3  X192.749 Y223.812   I-3.462 J2.170 E0.2280
G2  X192.354 Y225.209   I2.266 J1.395 E0.0559
G2  X192.363 Y233.475   I91.952 J4.037 E0.3143
G2  X193.816 Y235.935   I4.133 J-0.783 E0.1108
G3  X193.352 Y240.456   I-3.139 J1.962 E0.1860
M204 S6000
G1  X193.685 Y240.769  
M204 S500
G3  X190.223 Y244.233   I-20.329 J-16.849 E0.1864
G3  X184.144 Y243.371   I-2.571 J-3.734 E0.2564
G2  X182.840 Y243.014   I-1.299 J2.183 E0.0520
G2  X174.498 Y243.022   I-4.080 J96.018 E0.3171
G2  X172.026 Y244.469   I1.118 J4.747 E0.1105
G3  X166.861 Y243.827   I-2.170 J-3.645 E0.2130
G3  X163.480 Y240.303   I17.242 J-19.921 E0.1859
G3  X164.459 Y234.330   I3.945 J-2.420 E0.2507
G2  X164.741 Y233.245   I-1.886 J-1.068 E0.0431
G2  X164.733 Y225.019   I-92.937 J-4.030 E0.3127
G2  X163.348 Y222.766   I-4.236 J1.052 E0.1021
G3  X163.867 Y217.689   I3.528 J-2.205 E0.2088
G1  X166.861 Y214.631   E0.1626
G3  X173.409 Y215.087   I3.063 J3.261 E0.2801
G2  X174.712 Y215.444   I1.298 J-2.184 E0.0520
G2  X183.054 Y215.436   I4.080 J-96.024 E0.3171
G2  X185.526 Y213.989   I-1.118 J-4.747 E0.1105
G3  X190.691 Y214.631   I2.170 J3.645 E0.2130
G3  X194.072 Y218.155   I-17.238 J19.918 E0.1859
G3  X193.093 Y224.128   I-3.945 J2.420 E0.2507
G2  X192.811 Y225.213   I1.886 J1.068 E0.0431
G2  X192.819 Y233.439   I92.937 J4.030 E0.3127
G2  X194.204 Y235.692   I4.236 J-1.052 E0.1021
G3  X193.685 Y240.769   I-3.528 J2.205 E0.2088
M204 S6000
G1  X194.017 Y241.082  
M204 S500
G3  X190.496 Y244.601   I-20.628 J-17.124 E0.1895
G3  X183.840 Y243.724   I-2.835 J-4.181 E0.2791
G2  X182.836 Y243.471   I-0.985 J1.797 E0.0398
G2  X174.534 Y243.478   I-4.073 J97.078 E0.3156
G2  X172.261 Y244.861   I1.329 J4.742 E0.1024
G3  X166.540 Y244.154   I-2.405 J-4.038 E0.2358
G3  X163.107 Y240.567   I17.523 J-20.213 E0.1890
G3  X164.094 Y234.045   I4.187 J-2.703 E0.2740
G2  X164.284 Y233.240   I-1.558 J-0.792 E0.0317
G2  X164.278 Y225.056   I-94.437 J-4.024 E0.3112
G2  X162.961 Y223.009   I-4.181 J1.244 E0.0937
G3  X163.535 Y217.376   I3.916 J-2.447 E0.2317
G3  X167.056 Y213.857   I20.628 J17.124 E0.1895
G3  X173.712 Y214.734   I2.835 J4.180 E0.2791
G2  X174.716 Y214.987   I0.985 J-1.797 E0.0398
G2  X183.018 Y214.980   I4.073 J-97.078 E0.3156
G2  X185.291 Y213.597   I-1.329 J-4.742 E0.1024
G3  X188.117 Y212.950   I2.478 J4.333 E0.1118
G3  X191.012 Y214.304   I-0.440 J4.712 E0.1239
G3  X194.445 Y217.891   I-17.521 J20.212 E0.1890
G3  X193.458 Y224.413   I-4.187 J2.703 E0.2740
G2  X193.268 Y225.218   I1.557 J0.792 E0.0317
G2  X193.274 Y233.402   I94.437 J4.024 E0.3112
G2  X194.591 Y235.449   I4.181 J-1.244 E0.0937
G3  X194.018 Y241.082   I-3.916 J2.447 E0.2317
M204 S6000
G1  X194.350 Y241.396  
M204 S500
G3  X190.769 Y244.968   I-20.933 J-17.406 E0.1925
G3  X183.510 Y244.069   I-3.104 J-4.694 E0.3026
G2  X182.831 Y243.928   I-0.657 J1.459 E0.0266
G2  X174.569 Y243.934   I-4.067 J98.915 E0.3141
M73 P1 R97
G2  X172.496 Y245.254   I1.691 J4.943 E0.0943
G3  X166.220 Y244.480   I-2.639 J-4.432 E0.2587
G3  X162.734 Y240.832   I17.813 J-20.515 E0.1920
G3  X163.729 Y233.746   I4.718 J-2.950 E0.2954
G2  X163.827 Y233.236   I-1.204 J-0.494 E0.0199
G2  X163.822 Y225.092   I-97.433 J-4.017 E0.3096
G2  X162.573 Y223.253   I-4.316 J1.586 E0.0853
G3  X163.202 Y217.062   I4.304 J-2.690 E0.2545
G3  X166.783 Y213.490   I20.933 J17.406 E0.1925
G3  X174.042 Y214.388   I3.104 J4.693 E0.3026
G2  X174.721 Y214.530   I0.657 J-1.459 E0.0266
G2  X182.983 Y214.524   I4.067 J-98.915 E0.3141
G2  X185.056 Y213.204   I-1.688 J-4.939 E0.0943
G3  X188.158 Y212.495   I2.720 J4.756 E0.1227
G3  X191.332 Y213.978   I-0.483 J5.171 E0.1358
G3  X194.818 Y217.626   I-17.811 J20.513 E0.1920
G3  X193.822 Y224.713   I-4.719 J2.950 E0.2954
G2  X193.725 Y225.222   I1.205 J0.493 E0.0199
G2  X193.730 Y233.366   I97.444 J4.017 E0.3096
G2  X194.979 Y235.205   I4.316 J-1.586 E0.0853
G3  X194.350 Y241.396   I-4.304 J2.690 E0.2545
; WIPE_TOWER_END
G1  X167.526 Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S500
G1  Y229.479  E0.4086 F3000
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
M204 S6000
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #2
M204 S500
G1  Y229.979  E0.0190
G1  X189.526  E0.7981
G1  Y230.492  E0.0195
G1  X168.026  E0.8171
G1  Y231.005  E0.0195
G1  X189.526  E0.8171
G1  Y231.518  E0.0195
G1  X168.026  E0.8171
G1  Y232.032  E0.0195
G1  X189.526  E0.8171
G1  Y232.545  E0.0195
G1  X168.026  E0.8171
G1  Y233.058  E0.0195
G1  X189.526  E0.8171
G1  Y233.571  E0.0195
G1  X168.026  E0.8171
G1  Y234.084  E0.0195
G1  X189.526  E0.8171
G1  Y234.597  E0.0195
G1  X168.026  E0.8171
G1  Y235.111  E0.0195
G1  X189.526  E0.8171
G1  Y235.624  E0.0195
G1  X168.026  E0.8171
G1  Y236.137  E0.0195
G1  X189.526  E0.8171
G1  Y236.650  E0.0195
G1  X168.026  E0.8171
G1  Y237.163  E0.0195
G1  X189.526  E0.8171
G1  Y237.676  E0.0195
G1  X168.026  E0.8171
G1  Y238.190  E0.0195
G1  X189.526  E0.8171
G1  Y238.703  E0.0195
G1  X168.026  E0.8171
G1  Y239.216  E0.0195
G1  X189.526  E0.8171
G1  Y239.729  E0.0195
G1  X168.026  E0.8171
G1  Y240.229  E0.0190
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z3.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E49
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
G1 E7.21903 F523
M73 P1 R96
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M73 P2 R96
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S230
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z3.2 F3000

M204 S500


M621 S1A
M106 S0
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z.2
G1 X159.798 Y247.983 Z.6
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL1
; LINE_WIDTH: 0.500000
M204 S500
G1  X170.526 Y218.229  E0.1140 F990
G1 E-0.8000 F1800
M204 S6000
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
M204 S500
G1  X190.026  E0.7411 F990
G1  Y218.729  E0.0190
G1  X167.526  E0.8551 F1125
G1  Y219.229  E0.0190
G1  X190.026  E0.8551 F1374
G1  Y219.729  E0.0190
G1  X167.526  E0.8551 F2625
G1  Y220.229  E0.0190
G1  X190.026  E0.8551 F2675
G1  Y220.729  E0.0190
G1  X167.526  E0.8551
G1  Y221.229  E0.0190
G1  X190.026  E0.8551
G1  Y221.729  E0.0190
G1  X167.526  E0.8551
G1  Y222.229  E0.0190
G1  X190.026  E0.8551
G1  Y222.729  E0.0190
G1  X167.526  E0.8551
G1  Y223.229  E0.0190
G1  X190.026  E0.8551
G1  Y223.729  E0.0190
G1  X167.526  E0.8551
G1  Y224.229  E0.0190
G1  X190.026  E0.8551
G1  Y224.729  E0.0190
G1  X167.526  E0.8551
G1  Y225.229  E0.0190
G1  X190.026  E0.8551
G1  Y225.729  E0.0190
G1  X167.526  E0.8551
G1  Y226.229  E0.0190
G1  X190.026  E0.8551
G1  Y226.729  E0.0190
G1  X167.526  E0.8551
G1  Y227.229  E0.0190
G1  X190.026  E0.8551
G1  Y227.729  E0.0190
G1  X167.526  E0.8551
G1  Y228.229  E0.0190
G1  X190.026  E0.8551
G1  Y228.729  E0.0190
G1  X167.526  E0.8551
; LINE_WIDTH: 0.500000
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F6300
M204 S500
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S6000
G1 X137.143 Y146.143
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X118.857 Y146.143 E.66023
G1 X118.857 Y127.857 E.66023
G1 X137.143 Y127.857 E.66023
G1 X137.143 Y146.083 E.65806
M204 S6000
G1 X137.6 Y146.6 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X118.4 Y146.6 E.69324
G1 X118.4 Y127.4 E.69324
G1 X137.6 Y127.4 E.69324
G1 X137.6 Y146.54 E.69107
; object ids of layer 1 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer1 end: 47,58
M625
; WIPE_START
G1 X135.6 Y146.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.776 Y138.916 Z.6 F30000
G1 X136.026 Y128.04 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50487
G1 F6300
M204 S500
G1 X136.754 Y128.768 E.0376
G1 X136.754 Y129.422 E.02384
G1 X135.578 Y128.246 E.0607
G1 X134.925 Y128.246 E.02384
G1 X136.754 Y130.075 E.09441
G1 X136.754 Y130.728 E.02384
G1 X134.272 Y128.246 E.12813
G1 X133.618 Y128.246 E.02384
G1 X136.754 Y131.382 E.16184
G1 X136.754 Y132.035 E.02384
G1 X132.965 Y128.246 E.19556
G1 X132.312 Y128.246 E.02384
G1 X136.754 Y132.688 E.22927
G1 X136.754 Y133.342 E.02384
G1 X131.658 Y128.246 E.26298
G1 X131.005 Y128.246 E.02384
G1 X136.754 Y133.995 E.2967
G1 X136.754 Y134.648 E.02384
G1 X130.352 Y128.246 E.33041
G1 X129.699 Y128.246 E.02384
G1 X136.754 Y135.301 E.36412
G1 X136.754 Y135.955 E.02384
G1 X129.045 Y128.246 E.39784
G1 X128.392 Y128.246 E.02384
G1 X136.754 Y136.608 E.43155
G1 X136.754 Y137.261 E.02384
G1 X127.739 Y128.246 E.46527
G1 X127.085 Y128.246 E.02384
G1 X136.754 Y137.915 E.49898
G1 X136.754 Y138.568 E.02384
G1 X126.432 Y128.246 E.53269
G1 X125.779 Y128.246 E.02384
G1 X136.754 Y139.221 E.56641
G1 X136.754 Y139.875 E.02384
G1 X125.125 Y128.246 E.60012
G1 X124.472 Y128.246 E.02384
G1 X136.754 Y140.528 E.63383
G1 X136.754 Y141.181 E.02384
G1 X123.819 Y128.246 E.66755
G1 X123.166 Y128.246 E.02384
G1 X136.754 Y141.834 E.70126
G1 X136.754 Y142.488 E.02384
G1 X122.512 Y128.246 E.73498
G1 X121.859 Y128.246 E.02384
G1 X136.754 Y143.141 E.76869
G1 X136.754 Y143.794 E.02384
G1 X121.206 Y128.246 E.8024
G1 X120.552 Y128.246 E.02384
G1 X136.754 Y144.448 E.83612
M73 P2 R95
G1 X136.754 Y145.101 E.02384
G1 X119.899 Y128.246 E.86983
G1 X119.246 Y128.246 E.02384
G1 X136.754 Y145.754 E.90354
G1 X136.101 Y145.754 E.02383
G1 X119.246 Y128.899 E.86985
G1 X119.246 Y129.552 E.02384
G1 X135.448 Y145.754 E.83614
G1 X134.795 Y145.754 E.02384
G1 X119.246 Y130.205 E.80243
G1 X119.246 Y130.859 E.02384
G1 X134.141 Y145.754 E.76871
G1 X133.488 Y145.754 E.02384
G1 X119.246 Y131.512 E.735
G1 X119.246 Y132.165 E.02384
G1 X132.835 Y145.754 E.70128
G1 X132.182 Y145.754 E.02384
G1 X119.246 Y132.818 E.66757
G1 X119.246 Y133.472 E.02384
G1 X131.528 Y145.754 E.63386
G1 X130.875 Y145.754 E.02384
G1 X119.246 Y134.125 E.60014
G1 X119.246 Y134.778 E.02384
G1 X130.222 Y145.754 E.56643
G1 X129.568 Y145.754 E.02384
G1 X119.246 Y135.432 E.53272
G1 X119.246 Y136.085 E.02384
G1 X128.915 Y145.754 E.499
G1 X128.262 Y145.754 E.02384
G1 X119.246 Y136.738 E.46529
G1 X119.246 Y137.391 E.02384
G1 X127.609 Y145.754 E.43157
G1 X126.955 Y145.754 E.02384
G1 X119.246 Y138.045 E.39786
G1 X119.246 Y138.698 E.02384
G1 X126.302 Y145.754 E.36415
G1 X125.649 Y145.754 E.02384
G1 X119.246 Y139.351 E.33043
G1 X119.246 Y140.005 E.02384
G1 X124.995 Y145.754 E.29672
G1 X124.342 Y145.754 E.02384
G1 X119.246 Y140.658 E.263
G1 X119.246 Y141.311 E.02384
G1 X123.689 Y145.754 E.22929
G1 X123.035 Y145.754 E.02384
G1 X119.246 Y141.965 E.19558
G1 X119.246 Y142.618 E.02384
G1 X122.382 Y145.754 E.16186
G1 X121.729 Y145.754 E.02384
G1 X119.246 Y143.271 E.12815
G1 X119.246 Y143.924 E.02384
G1 X121.076 Y145.754 E.09444
G1 X120.422 Y145.754 E.02384
G1 X119.246 Y144.578 E.06072
G1 X119.246 Y145.231 E.02384
G1 X119.975 Y145.96 E.03762
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P3 R95
G1 F6300
G1 X119.246 Y145.231 E-.39179
G1 X119.246 Y144.578 E-.24825
G1 X119.469 Y144.801 E-.11996
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 2/50
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S245 ; set nozzle temperature
M140 S70 ; set bed temperature
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.108 J1.212 P1  F30000
G1 X137.398 Y146.398 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 2 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer2 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.467 Y146.234 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X137.065 Y145.637 E.02531
G1 X137.065 Y145.101 E.01607
G1 X136.101 Y146.065 E.04085
G1 X135.564 Y146.065 E.01607
G1 X137.065 Y144.564 E.06358
G1 X137.065 Y144.028 E.01607
G1 X135.028 Y146.065 E.08631
G1 X134.491 Y146.065 E.01607
G1 X137.065 Y143.491 E.10904
G1 X137.065 Y142.955 E.01607
G1 X133.955 Y146.065 E.13177
G1 X133.419 Y146.065 E.01607
G1 X137.065 Y142.419 E.15449
G1 X137.065 Y141.882 E.01607
G1 X132.882 Y146.065 E.17722
G1 X132.346 Y146.065 E.01607
G1 X137.065 Y141.346 E.19995
G1 X137.065 Y140.809 E.01607
G1 X131.809 Y146.065 E.22268
G1 X131.273 Y146.065 E.01607
G1 X137.065 Y140.273 E.24541
G1 X137.065 Y139.737 E.01607
G1 X130.737 Y146.065 E.26814
G1 X130.2 Y146.065 E.01607
G1 X137.065 Y139.2 E.29087
G1 X137.065 Y138.664 E.01607
G1 X129.664 Y146.065 E.3136
G1 X129.127 Y146.065 E.01607
G1 X137.065 Y138.127 E.33633
G1 X137.065 Y137.591 E.01607
G1 X128.591 Y146.065 E.35906
G1 X128.054 Y146.065 E.01607
G1 X137.065 Y137.054 E.38179
G1 X137.065 Y136.518 E.01607
G1 X127.518 Y146.065 E.40452
G1 X126.982 Y146.065 E.01607
G1 X137.065 Y135.982 E.42724
G1 X137.065 Y135.445 E.01607
G1 X126.445 Y146.065 E.44997
G1 X125.909 Y146.065 E.01607
G1 X137.065 Y134.909 E.4727
G1 X137.065 Y134.372 E.01607
G1 X125.372 Y146.065 E.49543
G1 X124.836 Y146.065 E.01607
G1 X137.065 Y133.836 E.51816
G1 X137.065 Y133.3 E.01607
G1 X124.3 Y146.065 E.54089
G1 X123.763 Y146.065 E.01607
G1 X137.065 Y132.763 E.56362
G1 X137.065 Y132.227 E.01607
G1 X123.227 Y146.065 E.58635
G1 X122.69 Y146.065 E.01607
G1 X137.065 Y131.69 E.60908
G1 X137.065 Y131.154 E.01607
G1 X122.154 Y146.065 E.63181
G1 X121.618 Y146.065 E.01607
G1 X137.065 Y130.618 E.65454
G1 X137.065 Y130.081 E.01607
G1 X121.081 Y146.065 E.67727
G1 X120.545 Y146.065 E.01607
G1 X137.065 Y129.545 E.69999
G1 X137.065 Y129.008 E.01607
G1 X120.008 Y146.065 E.72272
G1 X119.472 Y146.065 E.01607
G1 X137.065 Y128.472 E.74545
G1 X137.065 Y127.935 E.01607
G1 X118.935 Y146.065 E.76819
G1 X118.935 Y145.528 E.01607
G1 X136.528 Y127.935 E.74547
G1 X135.992 Y127.935 E.01607
G1 X118.935 Y144.992 E.72274
G1 X118.935 Y144.456 E.01607
G1 X135.456 Y127.935 E.70001
G1 X134.919 Y127.935 E.01607
G1 X118.935 Y143.919 E.67728
G1 X118.935 Y143.383 E.01607
G1 X134.383 Y127.935 E.65455
G1 X133.846 Y127.935 E.01607
G1 X118.935 Y142.846 E.63182
G1 X118.935 Y142.31 E.01607
G1 X133.31 Y127.935 E.60909
G1 X132.774 Y127.935 E.01607
G1 X118.935 Y141.774 E.58636
G1 X118.935 Y141.237 E.01607
G1 X132.237 Y127.935 E.56363
G1 X131.701 Y127.935 E.01607
G1 X118.935 Y140.701 E.5409
G1 X118.935 Y140.164 E.01607
G1 X131.164 Y127.935 E.51818
G1 X130.628 Y127.935 E.01607
G1 X118.935 Y139.628 E.49545
G1 X118.935 Y139.091 E.01607
G1 X130.092 Y127.935 E.47272
G1 X129.555 Y127.935 E.01607
G1 X118.935 Y138.555 E.44999
G1 X118.935 Y138.019 E.01607
G1 X129.019 Y127.935 E.42726
G1 X128.482 Y127.935 E.01607
G1 X118.935 Y137.482 E.40453
G1 X118.935 Y136.946 E.01607
G1 X127.946 Y127.935 E.3818
G1 X127.409 Y127.935 E.01607
G1 X118.935 Y136.409 E.35907
G1 X118.935 Y135.873 E.01607
G1 X126.873 Y127.935 E.33634
G1 X126.337 Y127.935 E.01607
G1 X118.935 Y135.337 E.31361
G1 X118.935 Y134.8 E.01607
G1 X125.8 Y127.935 E.29088
G1 X125.264 Y127.935 E.01607
G1 X118.935 Y134.264 E.26815
G1 X118.935 Y133.727 E.01607
G1 X124.727 Y127.935 E.24543
G1 X124.191 Y127.935 E.01607
G1 X118.935 Y133.191 E.2227
G1 X118.935 Y132.655 E.01607
G1 X123.655 Y127.935 E.19997
G1 X123.118 Y127.935 E.01607
G1 X118.935 Y132.118 E.17724
G1 X118.935 Y131.582 E.01607
G1 X122.582 Y127.935 E.15451
G1 X122.045 Y127.935 E.01607
G1 X118.935 Y131.045 E.13178
G1 X118.935 Y130.509 E.01607
G1 X121.509 Y127.935 E.10905
G1 X120.973 Y127.935 E.01607
G1 X118.935 Y129.972 E.08632
G1 X118.935 Y129.436 E.01607
G1 X120.436 Y127.935 E.06359
G1 X119.9 Y127.935 E.01607
G1 X118.935 Y128.9 E.04086
G1 X118.935 Y128.363 E.01607
G1 X119.533 Y127.766 E.02532
; WIPE_START
M204 S10000
G1 X118.935 Y128.363 E-.32117
G1 X118.935 Y128.9 E-.20384
G1 X119.373 Y128.462 E-.235
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z.8 I-1.098 J.526 P1  F30000
G1 X167.526 Y228.979 Z.8
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #3
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z3.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

; get travel path for change filament
M620.1 X54 Y0 F21000 P0
M620.1 X54 Y0 F21000 P1
M620.1 X54 Y245 F21000 P2

M620.1 E F523 T270
T0
M73 E48
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P4 R94
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P4 R93
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z3.4 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z.4
G1 X189.022 Y247.983 Z.8
G1 X197.753 Y247.983 Z.8
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
M73 P5 R93
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G1  X168.142 Y242.523  
G3  X164.972 Y239.243   I16.257 J-18.888 E0.1736
G3  X165.789 Y235.632   I2.317 J-1.373 E0.1551
G2  X166.569 Y233.263   I-3.258 J-2.385 E0.0964
G2  X166.556 Y224.874   I-91.154 J-4.057 E0.3190
G2  X164.807 Y221.636   I-5.577 J0.921 E0.1425
G3  X165.199 Y218.942   I2.094 J-1.071 E0.1103
G3  X168.420 Y215.693   I19.280 J15.892 E0.1741
G3  X172.185 Y216.470   I1.473 J2.374 E0.1612
G2  X174.695 Y217.272   I2.527 J-3.578 E0.1017
G2  X183.195 Y217.259   I4.105 J-94.816 E0.3232
G2  X186.630 Y215.469   I-0.974 J-6.061 E0.1498
G3  X187.913 Y215.228   I1.077 J2.203 E0.0502
G3  X189.410 Y215.935   I-0.227 J2.419 E0.0642
G3  X192.580 Y219.215   I-16.251 J18.882 E0.1736
G3  X191.763 Y222.826   I-2.317 J1.373 E0.1551
G2  X190.983 Y225.195   I3.257 J2.385 E0.0964
G2  X190.996 Y233.584   I91.154 J4.057 E0.3190
G2  X192.745 Y236.822   I5.577 J-0.921 E0.1425
G3  X192.353 Y239.516   I-2.094 J1.071 E0.1103
G3  X189.132 Y242.765   I-19.285 J-15.896 E0.1741
G3  X185.367 Y241.988   I-1.473 J-2.374 E0.1612
G2  X182.857 Y241.186   I-2.527 J3.578 E0.1017
G2  X174.357 Y241.199   I-4.105 J94.816 E0.3232
G2  X170.922 Y242.989   I0.974 J6.061 E0.1498
G3  X168.142 Y242.523   I-1.061 J-2.191 E0.1142
G1  X167.822 Y242.849  
G3  X164.599 Y239.508   I16.468 J-19.111 E0.1767
G3  X165.503 Y235.246   I2.834 J-1.625 E0.1812
G2  X166.112 Y233.259   I-2.927 J-1.984 E0.0802
G2  X166.101 Y224.910   I-91.222 J-4.050 E0.3174
G2  X164.402 Y221.848   I-6.021 J1.337 E0.1350
G3  X164.866 Y218.629   I2.506 J-1.281 E0.1318
G3  X168.147 Y215.326   I19.511 J16.101 E0.1772
G3  X172.451 Y216.097   I1.758 J2.583 E0.1841
G2  X174.699 Y216.815   I2.260 J-3.199 E0.0911
G2  X183.160 Y216.803   I4.098 J-94.855 E0.3217
G2  X186.427 Y215.059   I-1.420 J-6.595 E0.1426
G3  X187.954 Y214.773   I1.282 J2.622 E0.0598
G3  X189.730 Y215.609   I-0.269 J2.878 E0.0761
G3  X192.953 Y218.950   I-16.463 J19.107 E0.1767
G3  X192.049 Y223.212   I-2.834 J1.625 E0.1812
G2  X191.440 Y225.199   I2.927 J1.984 E0.0802
G2  X191.451 Y233.548   I91.222 J4.050 E0.3174
G2  X193.150 Y236.610   I6.021 J-1.337 E0.1350
G3  X192.686 Y239.829   I-2.506 J1.281 E0.1318
G3  X189.405 Y243.132   I-19.511 J-16.101 E0.1772
G3  X185.101 Y242.361   I-1.758 J-2.583 E0.1841
G2  X182.853 Y241.643   I-2.259 J3.199 E0.0911
G2  X174.392 Y241.655   I-4.098 J94.851 E0.3217
G2  X171.125 Y243.399   I1.420 J6.594 E0.1426
G3  X167.822 Y242.849   I-1.263 J-2.608 E0.1357
G1  X167.501 Y243.175  
G3  X164.226 Y239.773   I16.708 J-19.364 E0.1798
G3  X165.125 Y234.989   I2.992 J-1.914 E0.2038
G2  X165.655 Y233.254   I-2.548 J-1.727 E0.0700
G2  X165.645 Y224.947   I-91.529 J-4.044 E0.3158
G2  X163.997 Y222.060   I-6.331 J1.700 E0.1277
G3  X164.533 Y218.316   I2.918 J-1.492 E0.1532
G3  X167.874 Y214.959   I19.769 J16.336 E0.1802
G3  X172.825 Y215.800   I2.019 J3.108 E0.2097
G2  X174.704 Y216.358   I1.872 J-2.859 E0.0755
G2  X183.124 Y216.347   I4.092 J-95.022 E0.3201
G2  X186.224 Y214.650   I-1.816 J-6.993 E0.1357
G3  X187.995 Y214.317   I1.488 J3.042 E0.0693
G3  X190.051 Y215.283   I-0.312 J3.336 E0.0881
G3  X193.326 Y218.685   I-16.704 J19.360 E0.1798
G3  X192.427 Y223.469   I-2.992 J1.914 E0.2038
G2  X191.897 Y225.204   I2.548 J1.727 E0.0700
G2  X191.907 Y233.511   I91.534 J4.044 E0.3158
G2  X193.555 Y236.398   I6.331 J-1.700 E0.1277
G3  X193.019 Y240.142   I-2.918 J1.492 E0.1532
G3  X189.678 Y243.499   I-19.769 J-16.336 E0.1803
G3  X184.727 Y242.658   I-2.019 J-3.108 E0.2097
G2  X182.848 Y242.100   I-1.871 J2.859 E0.0755
G2  X174.428 Y242.111   I-4.092 J95.022 E0.3201
G2  X171.328 Y243.808   I1.816 J6.993 E0.1357
G3  X167.501 Y243.175   I-1.465 J-3.024 E0.1571
G1  X167.181 Y243.501  
G3  X163.853 Y240.038   I16.967 J-19.635 E0.1828
G3  X164.803 Y234.646   I3.462 J-2.170 E0.2280
G2  X165.198 Y233.249   I-2.266 J-1.395 E0.0559
G2  X165.189 Y224.983   I-91.952 J-4.037 E0.3143
G2  X163.736 Y222.523   I-4.133 J0.783 E0.1108
G3  X164.200 Y218.002   I3.139 J-1.962 E0.1860
G3  X167.601 Y214.592   I20.043 J16.586 E0.1833
G3  X173.173 Y215.478   I2.281 J3.613 E0.2342
G2  X174.708 Y215.901   I1.536 J-2.583 E0.0612
G2  X183.089 Y215.892   I4.086 J-95.391 E0.3186
G2  X185.760 Y214.382   I-0.827 J-4.582 E0.1188
G3  X188.035 Y213.862   I1.995 J3.488 E0.0900
G3  X190.371 Y214.957   I-0.355 J3.795 E0.1000
G3  X193.699 Y218.420   I-16.963 J19.631 E0.1828
G3  X192.749 Y223.812   I-3.462 J2.170 E0.2280
G2  X192.354 Y225.209   I2.266 J1.395 E0.0559
G2  X192.363 Y233.475   I91.952 J4.037 E0.3143
G2  X193.816 Y235.935   I4.133 J-0.783 E0.1108
G3  X193.352 Y240.456   I-3.139 J1.962 E0.1860
G3  X189.951 Y243.866   I-20.049 J-16.592 E0.1833
G3  X184.380 Y242.980   I-2.281 J-3.612 E0.2342
G2  X182.844 Y242.557   I-1.537 J2.583 E0.0613
G2  X174.463 Y242.566   I-4.086 J95.391 E0.3186
G2  X171.792 Y244.076   I0.827 J4.582 E0.1188
G3  X167.181 Y243.501   I-1.936 J-3.251 E0.1901
G1  X166.861 Y243.827  
G3  X163.480 Y240.303   I17.242 J-19.921 E0.1859
G3  X164.459 Y234.330   I3.945 J-2.420 E0.2507
G2  X164.741 Y233.245   I-1.886 J-1.068 E0.0431
G2  X164.733 Y225.019   I-92.937 J-4.030 E0.3127
G2  X163.348 Y222.766   I-4.236 J1.052 E0.1021
G3  X163.867 Y217.689   I3.528 J-2.205 E0.2088
G3  X167.329 Y214.225   I20.329 J16.849 E0.1864
G3  X173.409 Y215.087   I2.571 J3.735 E0.2564
G2  X174.712 Y215.444   I1.298 J-2.184 E0.0520
G2  X183.054 Y215.436   I4.080 J-96.024 E0.3171
G2  X185.526 Y213.989   I-1.118 J-4.747 E0.1105
G3  X188.076 Y213.406   I2.236 J3.910 E0.1009
G3  X190.691 Y214.631   I-0.397 J4.254 E0.1120
G3  X194.072 Y218.155   I-17.238 J19.918 E0.1859
G3  X193.093 Y224.128   I-3.945 J2.420 E0.2507
G2  X192.811 Y225.213   I1.886 J1.068 E0.0431
G2  X192.819 Y233.439   I92.937 J4.030 E0.3127
G2  X194.204 Y235.692   I4.236 J-1.052 E0.1021
G3  X193.685 Y240.769   I-3.528 J2.205 E0.2088
G3  X190.223 Y244.233   I-20.337 J-16.857 E0.1864
G3  X184.144 Y243.371   I-2.571 J-3.734 E0.2564
G2  X182.840 Y243.014   I-1.299 J2.183 E0.0520
G2  X174.498 Y243.022   I-4.080 J96.018 E0.3171
G2  X172.026 Y244.469   I1.118 J4.747 E0.1105
G3  X166.861 Y243.827   I-2.170 J-3.645 E0.2130
; WIPE_TOWER_END

; WIPE_START
G1 F15000
G1 X167.069 Y244.024 E-.10924
G1 X167.328 Y244.233 E-.12629
G1 X167.603 Y244.421 E-.1263
G1 X167.891 Y244.586 E-.12631
G1 X168.191 Y244.729 E-.12634
G1 X168.502 Y244.847 E-.12631
G1 X168.55 Y244.861 E-.01921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.467 Y124.234 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X137.065 Y123.637 E.02611
G1 X137.065 Y123.101 E.01658
G1 X136.101 Y124.065 E.04214
G1 X135.564 Y124.065 E.01658
G1 X137.065 Y122.564 E.06559
G1 X137.065 Y122.028 E.01658
G1 X135.028 Y124.065 E.08903
G1 X134.491 Y124.065 E.01658
G1 X137.065 Y121.491 E.11248
G1 X137.065 Y120.955 E.01658
G1 X133.955 Y124.065 E.13593
G1 X133.419 Y124.065 E.01658
G1 X137.065 Y120.419 E.15937
G1 X137.065 Y119.882 E.01658
G1 X132.882 Y124.065 E.18282
G1 X132.346 Y124.065 E.01658
G1 X137.065 Y119.346 E.20627
G1 X137.065 Y118.809 E.01658
G1 X131.809 Y124.065 E.22971
G1 X131.273 Y124.065 E.01658
G1 X137.065 Y118.273 E.25316
G1 X137.065 Y117.737 E.01658
G1 X130.737 Y124.065 E.27661
G1 X130.2 Y124.065 E.01658
G1 X137.065 Y117.2 E.30005
G1 X137.065 Y116.664 E.01658
G1 X129.664 Y124.065 E.3235
G1 X129.127 Y124.065 E.01658
G1 X137.065 Y116.127 E.34695
G1 X137.065 Y115.591 E.01658
G1 X128.591 Y124.065 E.3704
G1 X128.054 Y124.065 E.01658
G1 X137.065 Y115.055 E.39384
G1 X137.065 Y114.518 E.01658
G1 X127.518 Y124.065 E.41729
G1 X126.982 Y124.065 E.01658
G1 X137.065 Y113.982 E.44074
G1 X137.065 Y113.445 E.01658
G1 X126.445 Y124.065 E.46418
G1 X125.909 Y124.065 E.01658
G1 X137.065 Y112.909 E.48763
G1 X137.065 Y112.372 E.01658
G1 X125.372 Y124.065 E.51108
G1 X124.836 Y124.065 E.01658
G1 X137.065 Y111.836 E.53452
G1 X137.065 Y111.3 E.01658
G1 X124.3 Y124.065 E.55797
G1 X123.763 Y124.065 E.01658
G1 X137.065 Y110.763 E.58142
G1 X137.065 Y110.227 E.01658
G1 X123.227 Y124.065 E.60487
G1 X122.69 Y124.065 E.01658
G1 X137.065 Y109.69 E.62831
G1 X137.065 Y109.154 E.01658
G1 X122.154 Y124.065 E.65176
G1 X121.618 Y124.065 E.01658
G1 X137.065 Y108.618 E.67521
G1 X137.065 Y108.081 E.01658
G1 X121.081 Y124.065 E.69865
G1 X120.545 Y124.065 E.01658
G1 X137.065 Y107.545 E.7221
G1 X137.065 Y107.008 E.01658
G1 X120.008 Y124.065 E.74555
G1 X119.472 Y124.065 E.01658
G1 X137.065 Y106.472 E.76899
G1 X137.065 Y105.936 E.01658
G1 X118.935 Y124.065 E.79244
G1 X118.935 Y123.528 E.01657
G1 X136.528 Y105.935 E.76901
G1 X135.992 Y105.935 E.01658
G1 X118.935 Y122.992 E.74556
G1 X118.935 Y122.456 E.01658
G1 X135.456 Y105.935 E.72211
G1 X134.919 Y105.935 E.01658
G1 X118.935 Y121.919 E.69867
G1 X118.935 Y121.383 E.01658
G1 X134.383 Y105.935 E.67522
G1 X133.846 Y105.935 E.01658
G1 X118.935 Y120.846 E.65177
G1 X118.935 Y120.31 E.01658
G1 X133.31 Y105.935 E.62833
G1 X132.774 Y105.935 E.01658
G1 X118.935 Y119.774 E.60488
G1 X118.935 Y119.237 E.01658
G1 X132.237 Y105.935 E.58143
G1 X131.701 Y105.935 E.01658
G1 X118.935 Y118.701 E.55799
G1 X118.935 Y118.164 E.01658
G1 X131.164 Y105.935 E.53454
G1 X130.628 Y105.935 E.01658
G1 X118.935 Y117.628 E.51109
G1 X118.935 Y117.092 E.01658
G1 X130.092 Y105.935 E.48765
G1 X129.555 Y105.935 E.01658
G1 X118.935 Y116.555 E.4642
G1 X118.935 Y116.019 E.01658
G1 X129.019 Y105.935 E.44075
G1 X128.482 Y105.935 E.01658
G1 X118.935 Y115.482 E.4173
G1 X118.935 Y114.946 E.01658
G1 X127.946 Y105.935 E.39386
G1 X127.409 Y105.935 E.01658
G1 X118.935 Y114.409 E.37041
G1 X118.935 Y113.873 E.01658
G1 X126.873 Y105.935 E.34696
G1 X126.337 Y105.935 E.01658
G1 X118.935 Y113.337 E.32352
G1 X118.935 Y112.8 E.01658
G1 X125.8 Y105.935 E.30007
G1 X125.264 Y105.935 E.01658
G1 X118.935 Y112.264 E.27662
G1 X118.935 Y111.727 E.01658
G1 X124.727 Y105.935 E.25318
G1 X124.191 Y105.935 E.01658
G1 X118.935 Y111.191 E.22973
G1 X118.935 Y110.655 E.01658
G1 X123.655 Y105.935 E.20628
G1 X123.118 Y105.935 E.01658
G1 X118.935 Y110.118 E.18283
G1 X118.935 Y109.582 E.01658
G1 X122.582 Y105.935 E.15939
G1 X122.045 Y105.935 E.01658
G1 X118.935 Y109.045 E.13594
G1 X118.935 Y108.509 E.01658
G1 X121.509 Y105.935 E.11249
G1 X120.973 Y105.935 E.01658
G1 X118.935 Y107.973 E.08905
G1 X118.935 Y107.436 E.01658
G1 X120.436 Y105.935 E.0656
G1 X119.9 Y105.935 E.01658
G1 X118.935 Y106.9 E.04215
G1 X118.935 Y106.363 E.01658
G1 X119.533 Y105.766 E.02612
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.935 Y106.363 E-.32117
G1 X118.935 Y106.9 E-.20384
G1 X119.373 Y106.462 E-.235
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 3/50
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z.8 I-.858 J.863 P1  F30000
G1 X137.398 Y124.398 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.394 Y117.128 Z1 F30000
G1 X137.234 Y106.533 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X136.637 Y105.935 E.02611
G1 X136.101 Y105.935 E.01658
G1 X137.065 Y106.899 E.04214
G1 X137.065 Y107.436 E.01658
G1 X135.564 Y105.935 E.06559
G1 X135.028 Y105.935 E.01658
G1 X137.065 Y107.972 E.08903
G1 X137.065 Y108.509 E.01658
G1 X134.491 Y105.935 E.11248
G1 X133.955 Y105.935 E.01658
G1 X137.065 Y109.045 E.13593
G1 X137.065 Y109.581 E.01658
G1 X133.419 Y105.935 E.15937
G1 X132.882 Y105.935 E.01658
G1 X137.065 Y110.118 E.18282
G1 X137.065 Y110.654 E.01658
G1 X132.346 Y105.935 E.20627
G1 X131.809 Y105.935 E.01658
G1 X137.065 Y111.191 E.22971
G1 X137.065 Y111.727 E.01658
G1 X131.273 Y105.935 E.25316
G1 X130.737 Y105.935 E.01658
G1 X137.065 Y112.264 E.27661
G1 X137.065 Y112.8 E.01658
G1 X130.2 Y105.935 E.30006
G1 X129.664 Y105.935 E.01658
G1 X137.065 Y113.336 E.3235
G1 X137.065 Y113.873 E.01658
G1 X129.127 Y105.935 E.34695
G1 X128.591 Y105.935 E.01658
G1 X137.065 Y114.409 E.3704
G1 X137.065 Y114.946 E.01658
G1 X128.054 Y105.935 E.39384
G1 X127.518 Y105.935 E.01658
G1 X137.065 Y115.482 E.41729
G1 X137.065 Y116.018 E.01658
G1 X126.982 Y105.935 E.44074
G1 X126.445 Y105.935 E.01658
G1 X137.065 Y116.555 E.46418
G1 X137.065 Y117.091 E.01658
G1 X125.909 Y105.935 E.48763
G1 X125.372 Y105.935 E.01658
G1 X137.065 Y117.628 E.51108
G1 X137.065 Y118.164 E.01658
G1 X124.836 Y105.935 E.53452
G1 X124.3 Y105.935 E.01658
G1 X137.065 Y118.7 E.55797
G1 X137.065 Y119.237 E.01658
G1 X123.763 Y105.935 E.58142
G1 X123.227 Y105.935 E.01658
G1 X137.065 Y119.773 E.60486
G1 X137.065 Y120.31 E.01658
G1 X122.69 Y105.935 E.62831
G1 X122.154 Y105.935 E.01658
G1 X137.065 Y120.846 E.65176
G1 X137.065 Y121.382 E.01658
G1 X121.618 Y105.935 E.67521
G1 X121.081 Y105.935 E.01658
G1 X137.065 Y121.919 E.69865
G1 X137.065 Y122.455 E.01658
G1 X120.545 Y105.935 E.7221
G1 X120.008 Y105.935 E.01658
G1 X137.065 Y122.992 E.74555
G1 X137.065 Y123.528 E.01658
G1 X119.472 Y105.935 E.76899
G1 X118.936 Y105.935 E.01658
G1 X137.065 Y124.065 E.79244
G1 X136.528 Y124.065 E.01657
G1 X118.935 Y106.472 E.76901
G1 X118.935 Y107.008 E.01658
G1 X135.992 Y124.065 E.74556
G1 X135.456 Y124.065 E.01658
G1 X118.935 Y107.544 E.72211
G1 X118.935 Y108.081 E.01658
G1 X134.919 Y124.065 E.69867
G1 X134.383 Y124.065 E.01658
G1 X118.935 Y108.617 E.67522
G1 X118.935 Y109.154 E.01658
G1 X133.846 Y124.065 E.65177
G1 X133.31 Y124.065 E.01658
G1 X118.935 Y109.69 E.62833
G1 X118.935 Y110.226 E.01658
G1 X132.774 Y124.065 E.60488
G1 X132.237 Y124.065 E.01658
G1 X118.935 Y110.763 E.58143
G1 X118.935 Y111.299 E.01658
G1 X131.701 Y124.065 E.55799
G1 X131.164 Y124.065 E.01658
G1 X118.935 Y111.836 E.53454
G1 X118.935 Y112.372 E.01658
G1 X130.628 Y124.065 E.51109
G1 X130.092 Y124.065 E.01658
G1 X118.935 Y112.909 E.48764
G1 X118.935 Y113.445 E.01658
G1 X129.555 Y124.065 E.4642
G1 X129.019 Y124.065 E.01658
G1 X118.935 Y113.981 E.44075
G1 X118.935 Y114.518 E.01658
G1 X128.482 Y124.065 E.4173
G1 X127.946 Y124.065 E.01658
G1 X118.935 Y115.054 E.39386
G1 X118.935 Y115.591 E.01658
G1 X127.409 Y124.065 E.37041
G1 X126.873 Y124.065 E.01658
G1 X118.935 Y116.127 E.34696
G1 X118.935 Y116.663 E.01658
G1 X126.337 Y124.065 E.32352
G1 X125.8 Y124.065 E.01658
G1 X118.935 Y117.2 E.30007
G1 X118.935 Y117.736 E.01658
G1 X125.264 Y124.065 E.27662
G1 X124.727 Y124.065 E.01658
G1 X118.935 Y118.273 E.25318
G1 X118.935 Y118.809 E.01658
G1 X124.191 Y124.065 E.22973
G1 X123.655 Y124.065 E.01658
G1 X118.935 Y119.345 E.20628
G1 X118.935 Y119.882 E.01658
G1 X123.118 Y124.065 E.18284
G1 X122.582 Y124.065 E.01658
G1 X118.935 Y120.418 E.15939
G1 X118.935 Y120.955 E.01658
G1 X122.045 Y124.065 E.13594
G1 X121.509 Y124.065 E.01658
G1 X118.935 Y121.491 E.11249
G1 X118.935 Y122.028 E.01658
G1 X120.973 Y124.065 E.08905
G1 X120.436 Y124.065 E.01658
G1 X118.935 Y122.564 E.0656
G1 X118.935 Y123.1 E.01658
G1 X119.9 Y124.065 E.04215
G1 X119.363 Y124.065 E.01658
G1 X118.766 Y123.467 E.02612
; WIPE_START
M204 S10000
G1 X119.363 Y124.065 E-.32117
G1 X119.9 Y124.065 E-.20384
G1 X119.462 Y123.627 E-.23499
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z1 I-1.125 J.464 P1  F30000
G1 X167.526 Y240.229 Z1
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G1  X168.142 Y242.523  
G3  X164.972 Y239.243   I16.257 J-18.888 E0.1736
G3  X165.789 Y235.632   I2.317 J-1.373 E0.1551
G2  X166.569 Y233.263   I-3.258 J-2.385 E0.0964
G2  X166.556 Y224.874   I-91.154 J-4.057 E0.3190
G2  X164.807 Y221.636   I-5.577 J0.921 E0.1425
G3  X165.199 Y218.942   I2.094 J-1.071 E0.1103
G3  X168.420 Y215.693   I19.280 J15.892 E0.1741
G3  X172.185 Y216.470   I1.473 J2.374 E0.1612
G2  X174.695 Y217.272   I2.527 J-3.578 E0.1017
G2  X183.195 Y217.259   I4.105 J-94.816 E0.3232
G2  X186.630 Y215.469   I-0.974 J-6.061 E0.1498
G3  X187.913 Y215.228   I1.077 J2.203 E0.0502
G3  X189.410 Y215.935   I-0.227 J2.419 E0.0642
G3  X192.580 Y219.215   I-16.256 J18.887 E0.1736
G3  X191.763 Y222.826   I-2.317 J1.373 E0.1551
G2  X190.983 Y225.195   I3.257 J2.385 E0.0964
G2  X190.996 Y233.584   I91.154 J4.057 E0.3190
G2  X192.745 Y236.822   I5.577 J-0.921 E0.1425
G3  X192.353 Y239.516   I-2.094 J1.071 E0.1103
G3  X189.132 Y242.765   I-19.285 J-15.896 E0.1741
G3  X185.367 Y241.988   I-1.473 J-2.374 E0.1612
G2  X182.857 Y241.186   I-2.527 J3.578 E0.1017
G2  X174.357 Y241.199   I-4.105 J94.816 E0.3232
G2  X170.922 Y242.989   I0.974 J6.061 E0.1498
G3  X168.142 Y242.523   I-1.061 J-2.191 E0.1142
G1  X167.822 Y242.849  
G3  X164.599 Y239.508   I16.468 J-19.111 E0.1767
G3  X165.503 Y235.246   I2.834 J-1.625 E0.1812
G2  X166.112 Y233.259   I-2.927 J-1.984 E0.0802
G2  X166.101 Y224.910   I-91.222 J-4.050 E0.3174
G2  X164.402 Y221.848   I-6.021 J1.337 E0.1350
G3  X164.866 Y218.629   I2.506 J-1.281 E0.1318
G3  X168.147 Y215.326   I19.511 J16.101 E0.1772
G3  X172.451 Y216.097   I1.758 J2.583 E0.1841
G2  X174.699 Y216.815   I2.260 J-3.199 E0.0911
G2  X183.160 Y216.803   I4.098 J-94.855 E0.3217
G2  X186.427 Y215.059   I-1.420 J-6.595 E0.1426
G3  X187.954 Y214.773   I1.282 J2.622 E0.0598
G3  X189.730 Y215.609   I-0.269 J2.878 E0.0761
G3  X192.953 Y218.950   I-16.462 J19.106 E0.1767
G3  X192.049 Y223.212   I-2.834 J1.625 E0.1812
G2  X191.440 Y225.199   I2.927 J1.984 E0.0802
G2  X191.451 Y233.548   I91.222 J4.050 E0.3174
G2  X193.150 Y236.610   I6.021 J-1.337 E0.1350
G3  X192.686 Y239.829   I-2.506 J1.281 E0.1318
G3  X189.405 Y243.132   I-19.515 J-16.105 E0.1772
G3  X185.101 Y242.361   I-1.758 J-2.583 E0.1841
G2  X182.853 Y241.643   I-2.259 J3.199 E0.0911
G2  X174.392 Y241.655   I-4.098 J94.851 E0.3217
G2  X171.125 Y243.399   I1.420 J6.594 E0.1426
G3  X167.822 Y242.849   I-1.263 J-2.608 E0.1357
G1  X167.501 Y243.175  
G3  X164.226 Y239.773   I16.708 J-19.364 E0.1798
G3  X165.125 Y234.989   I2.992 J-1.914 E0.2038
G2  X165.655 Y233.254   I-2.548 J-1.727 E0.0700
G2  X165.645 Y224.947   I-91.529 J-4.044 E0.3158
G2  X163.997 Y222.060   I-6.331 J1.700 E0.1277
G3  X164.533 Y218.316   I2.918 J-1.492 E0.1532
G3  X167.874 Y214.959   I19.769 J16.336 E0.1802
G3  X172.825 Y215.800   I2.019 J3.108 E0.2097
G2  X174.704 Y216.358   I1.872 J-2.859 E0.0755
G2  X183.124 Y216.347   I4.092 J-95.022 E0.3201
G2  X186.224 Y214.650   I-1.816 J-6.993 E0.1357
G3  X187.995 Y214.317   I1.488 J3.042 E0.0693
G3  X190.051 Y215.283   I-0.312 J3.336 E0.0881
G3  X193.326 Y218.685   I-16.703 J19.359 E0.1798
G3  X192.427 Y223.469   I-2.992 J1.914 E0.2038
G2  X191.897 Y225.204   I2.548 J1.727 E0.0700
G2  X191.907 Y233.511   I91.534 J4.044 E0.3158
G2  X193.555 Y236.398   I6.331 J-1.700 E0.1277
G3  X193.019 Y240.142   I-2.918 J1.492 E0.1532
G3  X189.678 Y243.499   I-19.773 J-16.340 E0.1802
G3  X184.727 Y242.658   I-2.019 J-3.108 E0.2097
G2  X182.848 Y242.100   I-1.871 J2.859 E0.0755
G2  X174.428 Y242.111   I-4.092 J95.022 E0.3201
G2  X171.328 Y243.808   I1.816 J6.993 E0.1357
G3  X167.501 Y243.175   I-1.465 J-3.024 E0.1571
G1  X167.181 Y243.501  
G3  X163.853 Y240.038   I16.967 J-19.635 E0.1828
G3  X164.803 Y234.646   I3.462 J-2.170 E0.2280
G2  X165.198 Y233.249   I-2.266 J-1.395 E0.0559
G2  X165.189 Y224.983   I-91.952 J-4.037 E0.3143
G2  X163.736 Y222.523   I-4.133 J0.783 E0.1108
G3  X164.200 Y218.002   I3.139 J-1.962 E0.1860
G3  X167.601 Y214.592   I20.043 J16.586 E0.1833
G3  X173.173 Y215.478   I2.281 J3.613 E0.2342
G2  X174.708 Y215.901   I1.536 J-2.583 E0.0612
G2  X183.089 Y215.892   I4.086 J-95.391 E0.3186
G2  X185.760 Y214.382   I-0.827 J-4.582 E0.1188
G3  X188.035 Y213.862   I1.995 J3.488 E0.0900
G3  X190.371 Y214.957   I-0.355 J3.795 E0.1000
G3  X193.699 Y218.420   I-16.962 J19.630 E0.1828
G3  X192.749 Y223.812   I-3.462 J2.170 E0.2280
G2  X192.354 Y225.209   I2.266 J1.395 E0.0559
G2  X192.363 Y233.475   I91.952 J4.037 E0.3143
G2  X193.816 Y235.935   I4.133 J-0.783 E0.1108
G3  X193.352 Y240.456   I-3.139 J1.962 E0.1860
G3  X189.951 Y243.866   I-20.046 J-16.589 E0.1833
G3  X184.380 Y242.980   I-2.281 J-3.612 E0.2342
G2  X182.844 Y242.557   I-1.537 J2.583 E0.0613
G2  X174.463 Y242.566   I-4.086 J95.391 E0.3186
G2  X171.792 Y244.076   I0.827 J4.582 E0.1188
G3  X167.181 Y243.501   I-1.936 J-3.251 E0.1901
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #4
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #3
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z3.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E47
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P6 R92
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
M73 P6 R91
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
M73 P7 R91
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z3.6 F3000

M204 S10000


M621 S1A
M106 S0
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z.6
G1 X179.584 Y247.983 Z1
G1 X197.753 Y247.983 Z1
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15000
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 3 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer3 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.394 Y139.128 Z1 F30000
G1 X137.234 Y128.533 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X136.637 Y127.935 E.02531
G1 X136.101 Y127.935 E.01607
G1 X137.065 Y128.899 E.04085
G1 X137.065 Y129.436 E.01607
G1 X135.564 Y127.935 E.06358
G1 X135.028 Y127.935 E.01607
G1 X137.065 Y129.972 E.08631
G1 X137.065 Y130.509 E.01607
G1 X134.491 Y127.935 E.10904
G1 X133.955 Y127.935 E.01607
G1 X137.065 Y131.045 E.13177
G1 X137.065 Y131.581 E.01607
G1 X133.419 Y127.935 E.15449
G1 X132.882 Y127.935 E.01607
G1 X137.065 Y132.118 E.17722
G1 X137.065 Y132.654 E.01607
G1 X132.346 Y127.935 E.19995
G1 X131.809 Y127.935 E.01607
G1 X137.065 Y133.191 E.22268
G1 X137.065 Y133.727 E.01607
G1 X131.273 Y127.935 E.24541
G1 X130.737 Y127.935 E.01607
G1 X137.065 Y134.263 E.26814
G1 X137.065 Y134.8 E.01607
G1 X130.2 Y127.935 E.29087
G1 X129.664 Y127.935 E.01607
G1 X137.065 Y135.336 E.3136
G1 X137.065 Y135.873 E.01607
G1 X129.127 Y127.935 E.33633
G1 X128.591 Y127.935 E.01607
G1 X137.065 Y136.409 E.35906
G1 X137.065 Y136.946 E.01607
G1 X128.054 Y127.935 E.38179
G1 X127.518 Y127.935 E.01607
G1 X137.065 Y137.482 E.40452
G1 X137.065 Y138.018 E.01607
G1 X126.982 Y127.935 E.42724
G1 X126.445 Y127.935 E.01607
G1 X137.065 Y138.555 E.44997
G1 X137.065 Y139.091 E.01607
G1 X125.909 Y127.935 E.4727
G1 X125.372 Y127.935 E.01607
G1 X137.065 Y139.628 E.49543
G1 X137.065 Y140.164 E.01607
G1 X124.836 Y127.935 E.51816
G1 X124.3 Y127.935 E.01607
G1 X137.065 Y140.7 E.54089
G1 X137.065 Y141.237 E.01607
G1 X123.763 Y127.935 E.56362
G1 X123.227 Y127.935 E.01607
G1 X137.065 Y141.773 E.58635
G1 X137.065 Y142.31 E.01607
G1 X122.69 Y127.935 E.60908
G1 X122.154 Y127.935 E.01607
G1 X137.065 Y142.846 E.63181
G1 X137.065 Y143.382 E.01607
G1 X121.618 Y127.935 E.65454
G1 X121.081 Y127.935 E.01607
G1 X137.065 Y143.919 E.67727
G1 X137.065 Y144.455 E.01607
G1 X120.545 Y127.935 E.69999
G1 X120.008 Y127.935 E.01607
G1 X137.065 Y144.992 E.72272
G1 X137.065 Y145.528 E.01607
G1 X119.472 Y127.935 E.74545
G1 X118.936 Y127.935 E.01607
G1 X137.065 Y146.065 E.76819
G1 X136.528 Y146.065 E.01607
G1 X118.935 Y128.472 E.74547
G1 X118.935 Y129.008 E.01607
G1 X135.992 Y146.065 E.72274
G1 X135.456 Y146.065 E.01607
G1 X118.935 Y129.544 E.70001
G1 X118.935 Y130.081 E.01607
G1 X134.919 Y146.065 E.67728
G1 X134.383 Y146.065 E.01607
G1 X118.935 Y130.617 E.65455
G1 X118.935 Y131.154 E.01607
G1 X133.846 Y146.065 E.63182
G1 X133.31 Y146.065 E.01607
G1 X118.935 Y131.69 E.60909
G1 X118.935 Y132.226 E.01607
G1 X132.774 Y146.065 E.58636
G1 X132.237 Y146.065 E.01607
G1 X118.935 Y132.763 E.56363
G1 X118.935 Y133.299 E.01607
G1 X131.701 Y146.065 E.5409
G1 X131.164 Y146.065 E.01607
G1 X118.935 Y133.836 E.51818
G1 X118.935 Y134.372 E.01607
G1 X130.628 Y146.065 E.49545
G1 X130.092 Y146.065 E.01607
G1 X118.935 Y134.908 E.47272
G1 X118.935 Y135.445 E.01607
G1 X129.555 Y146.065 E.44999
G1 X129.019 Y146.065 E.01607
G1 X118.935 Y135.981 E.42726
G1 X118.935 Y136.518 E.01607
G1 X128.482 Y146.065 E.40453
G1 X127.946 Y146.065 E.01607
G1 X118.935 Y137.054 E.3818
G1 X118.935 Y137.591 E.01607
G1 X127.409 Y146.065 E.35907
G1 X126.873 Y146.065 E.01607
G1 X118.935 Y138.127 E.33634
G1 X118.935 Y138.663 E.01607
G1 X126.337 Y146.065 E.31361
G1 X125.8 Y146.065 E.01607
G1 X118.935 Y139.2 E.29088
G1 X118.935 Y139.736 E.01607
G1 X125.264 Y146.065 E.26815
G1 X124.727 Y146.065 E.01607
G1 X118.935 Y140.273 E.24543
G1 X118.935 Y140.809 E.01607
G1 X124.191 Y146.065 E.2227
G1 X123.655 Y146.065 E.01607
G1 X118.935 Y141.345 E.19997
G1 X118.935 Y141.882 E.01607
G1 X123.118 Y146.065 E.17724
G1 X122.582 Y146.065 E.01607
G1 X118.935 Y142.418 E.15451
G1 X118.935 Y142.955 E.01607
G1 X122.045 Y146.065 E.13178
G1 X121.509 Y146.065 E.01607
G1 X118.935 Y143.491 E.10905
G1 X118.935 Y144.027 E.01607
G1 X120.973 Y146.065 E.08632
G1 X120.436 Y146.065 E.01607
G1 X118.935 Y144.564 E.06359
G1 X118.935 Y145.1 E.01607
G1 X119.9 Y146.065 E.04086
G1 X119.363 Y146.065 E.01607
G1 X118.766 Y145.467 E.02532
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.363 Y146.065 E-.32117
G1 X119.9 Y146.065 E-.20384
G1 X119.462 Y145.627 E-.23499
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 4/50
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S51
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z1 I-.052 J1.216 P1  F30000
G1 X137.398 Y146.398 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 4 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer4 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z1.2 F30000
G1 X137.05 Y132.326 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z1.2 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z1.2
G1 Z.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #5
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z3.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E46
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P8 R90
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
M73 P8 R89
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
M73 P9 R89
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z3.8 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z.8
G1 X159.798 Y247.983 Z1.2
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G1  X192.353 Y239.516  
G3  X189.132 Y242.765   I-19.285 J-15.896 E0.1741
G3  X185.367 Y241.988   I-1.473 J-2.374 E0.1612
G2  X182.857 Y241.186   I-2.527 J3.578 E0.1017
G2  X174.357 Y241.199   I-4.105 J94.816 E0.3232
G2  X170.922 Y242.989   I0.974 J6.061 E0.1498
G3  X168.142 Y242.523   I-1.061 J-2.191 E0.1142
G3  X164.972 Y239.243   I16.259 J-18.889 E0.1736
G3  X165.789 Y235.632   I2.317 J-1.373 E0.1551
G2  X166.569 Y233.263   I-3.258 J-2.385 E0.0964
G2  X166.556 Y224.874   I-91.154 J-4.057 E0.3190
G2  X164.807 Y221.636   I-5.577 J0.921 E0.1425
G3  X165.199 Y218.942   I2.094 J-1.071 E0.1103
G3  X168.420 Y215.693   I19.280 J15.892 E0.1741
G3  X172.185 Y216.470   I1.473 J2.374 E0.1612
G2  X174.695 Y217.272   I2.527 J-3.578 E0.1017
G2  X183.195 Y217.259   I4.105 J-94.816 E0.3232
G2  X186.630 Y215.469   I-0.974 J-6.061 E0.1498
G3  X187.913 Y215.228   I1.077 J2.203 E0.0502
G3  X189.410 Y215.935   I-0.227 J2.419 E0.0642
G3  X192.580 Y219.215   I-16.251 J18.882 E0.1736
G3  X191.763 Y222.826   I-2.317 J1.373 E0.1551
G2  X190.983 Y225.195   I3.257 J2.385 E0.0964
G2  X190.996 Y233.584   I91.154 J4.057 E0.3190
G2  X192.745 Y236.822   I5.577 J-0.921 E0.1425
G3  X192.353 Y239.516   I-2.094 J1.071 E0.1103
G1  X192.686 Y239.829  
G3  X189.405 Y243.132   I-19.515 J-16.105 E0.1772
G3  X185.101 Y242.361   I-1.758 J-2.583 E0.1841
G2  X182.853 Y241.643   I-2.259 J3.199 E0.0911
G2  X174.392 Y241.655   I-4.098 J94.851 E0.3217
G2  X171.125 Y243.399   I1.420 J6.594 E0.1426
G3  X167.822 Y242.849   I-1.263 J-2.608 E0.1357
G3  X164.599 Y239.508   I16.466 J-19.110 E0.1767
G3  X165.503 Y235.246   I2.834 J-1.625 E0.1812
G2  X166.112 Y233.259   I-2.927 J-1.984 E0.0802
G2  X166.101 Y224.910   I-91.222 J-4.050 E0.3174
G2  X164.402 Y221.848   I-6.021 J1.337 E0.1350
G3  X164.866 Y218.629   I2.506 J-1.281 E0.1318
G3  X168.147 Y215.326   I19.511 J16.101 E0.1772
G3  X172.451 Y216.097   I1.758 J2.583 E0.1841
G2  X174.699 Y216.815   I2.260 J-3.199 E0.0911
G2  X183.160 Y216.803   I4.098 J-94.855 E0.3217
G2  X186.427 Y215.059   I-1.420 J-6.595 E0.1426
G3  X187.954 Y214.773   I1.282 J2.622 E0.0598
G3  X189.730 Y215.609   I-0.269 J2.878 E0.0761
G3  X192.953 Y218.950   I-16.463 J19.107 E0.1767
G3  X192.049 Y223.212   I-2.834 J1.625 E0.1812
G2  X191.440 Y225.199   I2.927 J1.984 E0.0802
G2  X191.451 Y233.548   I91.222 J4.050 E0.3174
G2  X193.150 Y236.610   I6.021 J-1.337 E0.1350
G3  X192.686 Y239.829   I-2.506 J1.281 E0.1318
G1  X193.019 Y240.142  
G3  X189.678 Y243.499   I-19.773 J-16.340 E0.1802
G3  X184.727 Y242.658   I-2.019 J-3.108 E0.2097
G2  X182.848 Y242.100   I-1.871 J2.859 E0.0755
G2  X174.428 Y242.111   I-4.092 J95.022 E0.3201
G2  X171.328 Y243.808   I1.816 J6.993 E0.1357
G3  X167.501 Y243.175   I-1.465 J-3.024 E0.1571
G3  X164.226 Y239.773   I16.708 J-19.364 E0.1798
G3  X165.125 Y234.989   I2.992 J-1.914 E0.2038
G2  X165.655 Y233.254   I-2.548 J-1.727 E0.0700
G2  X165.645 Y224.947   I-91.529 J-4.044 E0.3158
G2  X163.997 Y222.060   I-6.331 J1.700 E0.1277
G3  X164.533 Y218.316   I2.918 J-1.492 E0.1532
G3  X167.874 Y214.959   I19.769 J16.336 E0.1802
G3  X172.825 Y215.800   I2.019 J3.108 E0.2097
G2  X174.704 Y216.358   I1.872 J-2.859 E0.0755
G2  X183.124 Y216.347   I4.092 J-95.022 E0.3201
G2  X186.224 Y214.650   I-1.816 J-6.993 E0.1357
G3  X187.995 Y214.317   I1.488 J3.042 E0.0693
G3  X190.051 Y215.283   I-0.312 J3.336 E0.0881
G3  X193.326 Y218.685   I-16.704 J19.360 E0.1798
G3  X192.427 Y223.469   I-2.992 J1.914 E0.2038
G2  X191.897 Y225.204   I2.548 J1.727 E0.0700
G2  X191.907 Y233.511   I91.534 J4.044 E0.3158
G2  X193.555 Y236.398   I6.331 J-1.700 E0.1277
G3  X193.019 Y240.142   I-2.918 J1.492 E0.1532
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X193.171 Y239.974 E-.08632
G1 X193.326 Y239.772 E-.09655
G1 X193.465 Y239.56 E-.09659
G1 X193.587 Y239.336 E-.09657
G1 X193.691 Y239.105 E-.09655
G1 X193.776 Y238.865 E-.09658
G1 X193.842 Y238.62 E-.09657
G1 X193.888 Y238.376 E-.09428
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z1.2 F30000
G1 X137.05 Y110.326 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 5/50
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z1.2 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z1.4 F30000
G1 X118.95 Y110.326 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z1.4 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z1.4
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G1  X192.353 Y239.516  
G3  X189.132 Y242.765   I-19.285 J-15.896 E0.1741
G3  X185.367 Y241.988   I-1.473 J-2.374 E0.1612
G2  X182.857 Y241.186   I-2.527 J3.578 E0.1017
G2  X174.357 Y241.199   I-4.105 J94.816 E0.3232
G2  X170.922 Y242.989   I0.974 J6.061 E0.1498
G3  X168.142 Y242.523   I-1.061 J-2.191 E0.1142
G3  X164.972 Y239.243   I16.257 J-18.888 E0.1736
G3  X165.789 Y235.632   I2.317 J-1.373 E0.1551
G2  X166.569 Y233.263   I-3.258 J-2.385 E0.0964
G2  X166.556 Y224.874   I-91.154 J-4.057 E0.3190
G2  X164.807 Y221.636   I-5.577 J0.921 E0.1425
G3  X165.199 Y218.942   I2.094 J-1.071 E0.1103
G3  X168.420 Y215.693   I19.280 J15.892 E0.1741
G3  X172.185 Y216.470   I1.473 J2.374 E0.1612
G2  X174.695 Y217.272   I2.527 J-3.578 E0.1017
G2  X183.195 Y217.259   I4.105 J-94.816 E0.3232
G2  X186.630 Y215.469   I-0.974 J-6.061 E0.1498
G3  X187.913 Y215.228   I1.077 J2.203 E0.0502
G3  X189.410 Y215.935   I-0.227 J2.419 E0.0642
G3  X192.580 Y219.215   I-16.251 J18.882 E0.1736
G3  X191.763 Y222.826   I-2.317 J1.373 E0.1551
G2  X190.983 Y225.195   I3.257 J2.385 E0.0964
G2  X190.996 Y233.584   I91.154 J4.057 E0.3190
G2  X192.745 Y236.822   I5.577 J-0.921 E0.1425
G3  X192.353 Y239.516   I-2.094 J1.071 E0.1103
G1  X192.686 Y239.829  
G3  X189.405 Y243.132   I-19.515 J-16.105 E0.1772
G3  X185.101 Y242.361   I-1.758 J-2.583 E0.1841
G2  X182.853 Y241.643   I-2.259 J3.199 E0.0911
G2  X174.392 Y241.655   I-4.098 J94.851 E0.3217
G2  X171.125 Y243.399   I1.420 J6.594 E0.1426
G3  X167.822 Y242.849   I-1.263 J-2.608 E0.1357
G3  X164.599 Y239.508   I16.468 J-19.111 E0.1767
G3  X165.503 Y235.246   I2.834 J-1.625 E0.1812
G2  X166.112 Y233.259   I-2.927 J-1.984 E0.0802
G2  X166.101 Y224.910   I-91.222 J-4.050 E0.3174
G2  X164.402 Y221.848   I-6.021 J1.337 E0.1350
G3  X164.866 Y218.629   I2.506 J-1.281 E0.1318
G1  X167.822 Y215.609   E0.1606
G3  X172.451 Y216.097   I2.099 J2.283 E0.2001
G2  X174.699 Y216.815   I2.260 J-3.199 E0.0911
G2  X183.160 Y216.803   I4.098 J-94.855 E0.3217
G2  X186.427 Y215.059   I-1.420 J-6.595 E0.1426
G3  X189.730 Y215.609   I1.263 J2.608 E0.1357
G3  X192.953 Y218.950   I-16.463 J19.107 E0.1767
G3  X192.049 Y223.212   I-2.834 J1.625 E0.1812
G2  X191.440 Y225.199   I2.927 J1.984 E0.0802
G2  X191.451 Y233.548   I91.222 J4.050 E0.3174
G2  X193.150 Y236.610   I6.021 J-1.337 E0.1350
G3  X192.686 Y239.829   I-2.506 J1.281 E0.1318
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #6
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #5
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E45
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P10 R88
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
M73 P10 R87
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
M73 P11 R87
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z4 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z1
G1 X159.798 Y247.983 Z1.4
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z1
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 5 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer5 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z1.4 F30000
G1 X118.95 Y132.326 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 6/50
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z1.4 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 6 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer6 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z1.6 F30000
G1 X137.05 Y132.326 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z1.6 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z1.6
G1 Z1.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #7
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z4.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E44
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P12 R86
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
M73 P12 R85
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
M73 P13 R85
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z4.2 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z1.2
G1 X189.022 Y247.983 Z1.6
G1 X197.753 Y247.983 Z1.6
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z1.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G1  X168.142 Y242.523  
G3  X164.972 Y239.243   I16.257 J-18.888 E0.1736
G3  X165.789 Y235.632   I2.317 J-1.373 E0.1551
G2  X166.569 Y233.263   I-3.258 J-2.385 E0.0964
G2  X166.556 Y224.874   I-91.154 J-4.057 E0.3190
G2  X164.807 Y221.636   I-5.577 J0.921 E0.1425
G3  X165.199 Y218.942   I2.094 J-1.071 E0.1103
G3  X168.420 Y215.693   I19.280 J15.892 E0.1741
G3  X172.185 Y216.470   I1.473 J2.374 E0.1612
G2  X174.695 Y217.272   I2.527 J-3.578 E0.1017
G2  X183.195 Y217.259   I4.105 J-94.816 E0.3232
G2  X186.630 Y215.469   I-0.974 J-6.061 E0.1498
G3  X187.913 Y215.228   I1.077 J2.203 E0.0502
G3  X189.410 Y215.935   I-0.227 J2.419 E0.0642
G3  X192.580 Y219.215   I-16.251 J18.882 E0.1736
G3  X191.763 Y222.826   I-2.317 J1.373 E0.1551
G2  X190.983 Y225.195   I3.257 J2.385 E0.0964
G2  X190.996 Y233.584   I91.154 J4.057 E0.3190
G2  X192.745 Y236.822   I5.577 J-0.921 E0.1425
G3  X192.353 Y239.516   I-2.094 J1.071 E0.1103
G3  X189.132 Y242.765   I-19.285 J-15.896 E0.1741
G3  X185.367 Y241.988   I-1.473 J-2.374 E0.1612
G2  X182.857 Y241.186   I-2.527 J3.578 E0.1017
G2  X174.357 Y241.199   I-4.105 J94.816 E0.3232
G2  X170.922 Y242.989   I0.974 J6.061 E0.1498
G3  X168.142 Y242.523   I-1.061 J-2.191 E0.1142
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X168.273 Y242.646 E-.0683
G1 X168.42 Y242.764 E-.07172
G1 X168.575 Y242.871 E-.07172
G1 X168.739 Y242.965 E-.07172
G1 X168.91 Y243.046 E-.07172
G1 X169.086 Y243.113 E-.07172
G1 X169.267 Y243.166 E-.07171
G1 X169.452 Y243.205 E-.07171
G1 X169.639 Y243.229 E-.07172
G1 X169.827 Y243.239 E-.07172
G1 X169.949 Y243.235 E-.04623
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z1.6 F30000
G1 X137.05 Y110.326 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 7/50
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z1.6 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z1.8 F30000
G1 X118.95 Y110.326 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z1.8 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z1.8
G1 Z1.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #8
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #7
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z4.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E43
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P14 R84
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P15 R83
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z4.4 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z1.4
G1 X179.584 Y247.983 Z1.8
G1 X197.753 Y247.983 Z1.8
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z1.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 7 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer7 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z1.8 F30000
G1 X118.95 Y132.326 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 8/50
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z1.8 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 8 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer8 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z2 F30000
G1 X137.05 Y132.326 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z2 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z2
G1 Z1.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #9
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #8
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z4.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E42
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P16 R82
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P17 R81
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z4.6 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z1.6
G1 X159.798 Y247.983 Z2
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z1.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z2 F30000
G1 X137.05 Y110.326 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 9/50
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z2 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z2.2 F30000
G1 X118.95 Y110.326 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z2.2 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z2.2
G1 Z1.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #10
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #9
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z4.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E41
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P18 R80
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z4.8 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z1.8
G1 X159.798 Y247.983 Z2.2
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z1.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
M73 P19 R80
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
M73 P19 R79
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 9 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer9 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z2.2 F30000
G1 X118.95 Y132.326 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 10/50
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z2.2 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 10 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer10 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z2.4 F30000
G1 X137.05 Y132.326 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z2.4 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z2.4
G1 Z2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #11
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #10
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z5 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E40
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P20 R78
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z5 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z2
G1 X189.022 Y247.983 Z2.4
G1 X197.753 Y247.983 Z2.4
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
M73 P21 R78
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
M73 P21 R77
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z2.4 F30000
G1 X137.05 Y110.326 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 11/50
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z2.4 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z2.6 F30000
G1 X118.95 Y110.326 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z2.6 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z2.6
G1 Z2.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #12
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #11
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z5.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E39
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P22 R76
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z5.2 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z2.2
G1 X179.584 Y247.983 Z2.6
G1 X197.753 Y247.983 Z2.6
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z2.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 11 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer11 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z2.6 F30000
G1 X118.95 Y132.326 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 12/50
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z2.6 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 12 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer12 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z2.8 F30000
G1 X137.05 Y132.326 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z2.8 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z2.8
G1 Z2.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
M73 P23 R76
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #13
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #12
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z5.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E38
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P24 R75
G1 E6.50186 F523
M73 P24 R74
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z5.4 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z2.4
G1 X159.798 Y247.983 Z2.8
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z2.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z2.8 F30000
G1 X137.05 Y110.326 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 13/50
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z2.8 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z3 F30000
G1 X118.95 Y110.326 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P25 R74
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z3 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z3
G1 Z2.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #14
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #13
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z5.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
M73 P25 R73
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E37
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P26 R73
G1 E7.21903 F523
M73 P26 R72
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z5.6 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z2.6
G1 X159.798 Y247.983 Z3
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z2.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 13 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer13 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z3 F30000
G1 X118.95 Y132.326 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 14/50
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z3 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 14 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer14 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z3.2 F30000
G1 X137.05 Y132.326 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z3.2 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z3.2
G1 Z2.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #15
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #14
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z5.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E36
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P27 R71
G1 E6.50186 F523
M73 P28 R71
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
M73 P28 R70
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z5.8 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z2.8
G1 X189.022 Y247.983 Z3.2
G1 X197.753 Y247.983 Z3.2
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z2.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z3.2 F30000
G1 X137.05 Y110.326 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 15/50
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z3.2 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z3.4 F30000
G1 X118.95 Y110.326 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z3.4 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z3.4
G1 Z3
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #16
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #15
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E35
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P29 R69
G1 E7.21903 F523
M73 P30 R69
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
M73 P30 R68
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z6 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z3
G1 X179.584 Y247.983 Z3.4
G1 X197.753 Y247.983 Z3.4
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z3
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 15 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer15 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z3.4 F30000
G1 X118.95 Y132.326 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 16/50
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z3.4 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 16 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer16 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z3.6 F30000
G1 X137.05 Y132.326 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z3.6 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z3.6
G1 Z3.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #17
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #16
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z6.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E34
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P31 R67
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
M73 P32 R67
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
M73 P32 R66
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z6.2 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z3.2
G1 X159.798 Y247.983 Z3.6
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z3.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z3.6 F30000
G1 X137.05 Y110.326 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 17/50
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z3.6 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z3.8 F30000
G1 X118.95 Y110.326 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z3.8 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z3.8
G1 Z3.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #18
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #17
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z6.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E33
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P33 R65
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
M73 P34 R65
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
M73 P34 R64
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z6.4 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z3.4
G1 X159.798 Y247.983 Z3.8
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z3.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 17 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer17 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z3.8 F30000
G1 X118.95 Y132.326 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 18/50
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z3.8 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 18 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer18 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z4 F30000
G1 X137.05 Y132.326 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z4 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z4
G1 Z3.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #19
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #18
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z6.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E32
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P35 R63
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
M73 P36 R63
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
M73 P36 R62
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z6.6 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z3.6
G1 X189.022 Y247.983 Z4
G1 X197.753 Y247.983 Z4
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z3.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z4 F30000
G1 X137.05 Y110.326 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 19/50
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z4 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z4.2 F30000
G1 X118.95 Y110.326 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z4.2 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z4.2
G1 Z3.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #20
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #19
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z4.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z6.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E31
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P37 R61
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
M73 P38 R61
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z6.8 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z3.8
G1 X179.584 Y247.983 Z4.2
G1 X197.753 Y247.983 Z4.2
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z3.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
M73 P38 R60
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 19 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer19 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z4.2 F30000
G1 X118.95 Y132.326 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 20/50
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z4.2 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 20 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer20 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z4.4 F30000
G1 X137.05 Y132.326 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z4.4 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z4.4
G1 Z4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #21
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #20
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z4.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z7 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E30
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P39 R59
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
M73 P40 R59
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z7 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z4
G1 X159.798 Y247.983 Z4.4
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
M73 P40 R58
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z4.4 F30000
G1 X137.05 Y110.326 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 21/50
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z4.4 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z4.6 F30000
G1 X118.95 Y110.326 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z4.6 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z4.6
G1 Z4.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #22
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #21
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z4.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z7.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E29
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P41 R57
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P42 R57
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z7.2 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z4.2
G1 X159.798 Y247.983 Z4.6
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z4.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 21 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer21 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z4.6 F30000
G1 X118.95 Y132.326 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 22/50
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z4.6 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 22 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer22 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z4.8 F30000
G1 X137.05 Y132.326 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z4.8 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z4.8
G1 Z4.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
M73 P42 R56
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #23
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #22
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z4.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z7.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E28
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P43 R55
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P44 R55
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z7.4 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z4.4
G1 X189.022 Y247.983 Z4.8
G1 X197.753 Y247.983 Z4.8
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z4.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z4.8 F30000
G1 X137.05 Y110.326 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 23/50
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z4.8 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z5 F30000
G1 X118.95 Y110.326 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z5 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z5
G1 Z4.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
M73 P44 R54
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #24
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #23
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z5 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z7.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E27
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P45 R53
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z7.6 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z4.6
G1 X179.584 Y247.983 Z5
G1 X197.753 Y247.983 Z5
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z4.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
M73 P46 R53
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 23 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer23 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z5 F30000
G1 X118.95 Y132.326 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 24/50
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z5 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 24 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer24 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z5.2 F30000
G1 X137.05 Y132.326 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z5.2 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z5.2
G1 Z4.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #25
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #24
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z5.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z7.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E26
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P47 R52
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
M73 P47 R51
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z7.8 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z4.8
G1 X159.798 Y247.983 Z5.2
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z4.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
M73 P48 R51
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z5.2 F30000
G1 X137.05 Y110.326 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 25/50
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z5.2 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z5.4 F30000
G1 X118.95 Y110.326 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z5.4 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z5.4
G1 Z5
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #26
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #25
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z5.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E25
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P49 R50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
M73 P49 R49
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z8 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z5
G1 X159.798 Y247.983 Z5.4
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z5
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 25 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer25 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z5.4 F30000
G1 X118.95 Y132.326 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 26/50
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z5.4 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
M73 P50 R49
G1 X137.79 Y146.73 E.58143
; object ids of layer 26 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer26 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z5.6 F30000
G1 X137.05 Y132.326 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z5.6 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z5.6
G1 Z5.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #27
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #26
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z5.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z8.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E24
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P51 R48
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
M73 P51 R47
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z8.2 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z5.2
G1 X189.022 Y247.983 Z5.6
G1 X197.753 Y247.983 Z5.6
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z5.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z5.6 F30000
G1 X137.05 Y110.326 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
M73 P52 R47
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 27/50
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z5.6 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z5.8 F30000
G1 X118.95 Y110.326 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z5.8 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z5.8
G1 Z5.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #28
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #27
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z5.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z8.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E23
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P53 R46
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
M73 P53 R45
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z8.4 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z5.4
G1 X179.584 Y247.983 Z5.8
G1 X197.753 Y247.983 Z5.8
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z5.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 27 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer27 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z5.8 F30000
G1 X118.95 Y132.326 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 28/50
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z5.8 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 28 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer28 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z6 F30000
G1 X137.05 Y132.326 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z6 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z6
G1 Z5.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #29
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #28
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z8.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E22
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P54 R44
G1 E6.50186 F523
M73 P55 R44
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
M73 P55 R43
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z8.6 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z5.6
G1 X159.798 Y247.983 Z6
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z5.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z6 F30000
G1 X137.05 Y110.326 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 29/50
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z6 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z6.2 F30000
G1 X118.95 Y110.326 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z6.2 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z6.2
G1 Z5.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #30
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #29
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z6.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z8.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
M73 P56 R43
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E21
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P56 R42
G1 E7.21903 F523
M73 P57 R42
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P57 R41
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z8.8 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z5.8
G1 X159.798 Y247.983 Z6.2
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z5.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 29 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer29 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z6.2 F30000
G1 X118.95 Y132.326 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 30/50
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z6.2 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 30 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer30 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z6.4 F30000
G1 X137.05 Y132.326 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z6.4 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z6.4
G1 Z6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #31
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #30
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z6.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z9 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E20
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P58 R40
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
M73 P59 R40
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z9 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
M73 P59 R39
G1 X181.389 Y247.983 F30000
G1 Z6
G1 X189.022 Y247.983 Z6.4
G1 X197.753 Y247.983 Z6.4
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z6.4 F30000
G1 X137.05 Y110.326 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 31/50
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z6.4 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z6.6 F30000
G1 X118.95 Y110.326 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z6.6 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z6.6
G1 Z6.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #32
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #31
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z6.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z9.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E19
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P60 R38
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
M73 P61 R38
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z9.2 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z6.2
G1 X179.584 Y247.983 Z6.6
G1 X197.753 Y247.983 Z6.6
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z6.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 31 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer31 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
M73 P61 R37
G1 E-.04 F1800
G1 X129.991 Y141.774 Z6.6 F30000
G1 X118.95 Y132.326 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 32/50
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z6.6 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 32 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer32 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z6.8 F30000
G1 X137.05 Y132.326 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z6.8 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z6.8
G1 Z6.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #33
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #32
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z6.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z9.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E18
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P62 R36
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
M73 P63 R36
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z9.4 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z6.4
G1 X159.798 Y247.983 Z6.8
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z6.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P63 R35
G1 X136.455 Y117.133 Z6.8 F30000
G1 X137.05 Y110.326 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 33/50
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z6.8 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z7 F30000
G1 X118.95 Y110.326 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z7 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z7
G1 Z6.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #34
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #33
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z7 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z9.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E17
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P64 R34
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
M73 P65 R34
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z9.6 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z6.6
G1 X159.798 Y247.983 Z7
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z6.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 33 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer33 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z7 F30000
G1 X118.95 Y132.326 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 34/50
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z7 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 34 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer34 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z7.2 F30000
G1 X137.05 Y132.326 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z7.2 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z7.2
G1 Z6.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #35
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #34
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z7.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z9.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E16
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P66 R33
G1 E6.50186 F523
M73 P66 R32
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
M73 P67 R32
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z9.8 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z6.8
G1 X189.022 Y247.983 Z7.2
G1 X197.753 Y247.983 Z7.2
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z6.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z7.2 F30000
G1 X137.05 Y110.326 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 35/50
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z7.2 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z7.4 F30000
G1 X118.95 Y110.326 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z7.4 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z7.4
G1 Z7
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #36
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #35
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z7.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z10 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E15
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P68 R31
G1 E7.21903 F523
M73 P68 R30
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
M73 P69 R30
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z10 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z7
G1 X179.584 Y247.983 Z7.4
G1 X197.753 Y247.983 Z7.4
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z7
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 35 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer35 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z7.4 F30000
G1 X118.95 Y132.326 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 36/50
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z7.4 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 36 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer36 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z7.6 F30000
G1 X137.05 Y132.326 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z7.6 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z7.6
G1 Z7.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #37
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #36
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z7.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z10.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E14
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P70 R29
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
M73 P70 R28
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
M73 P71 R28
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z10.2 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z7.2
G1 X159.798 Y247.983 Z7.6
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z7.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z7.6 F30000
G1 X137.05 Y110.326 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 37/50
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z7.6 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z7.8 F30000
G1 X118.95 Y110.326 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z7.8 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z7.8
G1 Z7.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #38
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #37
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z7.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z10.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E13
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P72 R27
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
M73 P72 R26
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z10.4 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z7.4
G1 X159.798 Y247.983 Z7.8
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z7.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
M73 P73 R26
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 37 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer37 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z7.8 F30000
G1 X118.95 Y132.326 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 38/50
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z7.8 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 38 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer38 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z8 F30000
G1 X137.05 Y132.326 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z8 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z8
G1 Z7.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #39
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #38
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z10.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E12
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P74 R25
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
M73 P74 R24
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z10.6 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z7.6
G1 X189.022 Y247.983 Z8
G1 X197.753 Y247.983 Z8
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z7.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
M73 P75 R24
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z8 F30000
G1 X137.05 Y110.326 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 39/50
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z8 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z8.2 F30000
G1 X118.95 Y110.326 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z8.2 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z8.2
G1 Z7.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #40
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #39
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z8.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z10.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E11
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P76 R23
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

M73 P76 R22
G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z10.8 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z7.8
G1 X179.584 Y247.983 Z8.2
G1 X197.753 Y247.983 Z8.2
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z7.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 39 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer39 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z8.2 F30000
G1 X118.95 Y132.326 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
M73 P77 R22
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 40/50
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z8.2 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 40 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer40 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z8.4 F30000
G1 X137.05 Y132.326 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z8.4 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z8.4
G1 Z8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #41
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #40
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z8.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z11 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E10
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P78 R21
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P78 R20
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z11 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z8
G1 X159.798 Y247.983 Z8.4
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M73 P79 R20
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z8.4 F30000
G1 X137.05 Y110.326 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 41/50
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z8.4 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z8.6 F30000
G1 X118.95 Y110.326 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z8.6 I-1.128 J.456 P1  F30000
G1 X190.026 Y240.229 Z8.6
G1 Z8.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #42
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #41
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z8.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z11.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E9
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P80 R19
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z11.2 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z8.2
G1 X159.798 Y247.983 Z8.6
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z8.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
M73 P80 R18
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 41 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer41 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z8.6 F30000
G1 X118.95 Y132.326 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 42/50
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z8.6 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 42 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer42 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z8.8 F30000
G1 X137.05 Y132.326 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z8.8 I-1.093 J.536 P1  F30000
G1 X167.526 Y228.979 Z8.8
G1 Z8.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #43
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #42
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z8.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z11.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E8
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
M73 P81 R18
G1 E0.565379 F50
M73 P81 R17
G1 E6.50186 F523
M73 P82 R17
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z11.4 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z8.4
G1 X189.022 Y247.983 Z8.8
G1 X197.753 Y247.983 Z8.8
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z8.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
M73 P82 R16
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z8.8 F30000
G1 X137.05 Y110.326 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 43/50
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z8.8 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y119.774 Z9 F30000
G1 X118.95 Y110.326 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y108.698 E.05401
G1 X121.698 Y105.95 E.12889
G1 X118.95 Y105.95 E.09114
G1 X137.05 Y124.05 E.84908
G1 X137.05 Y121.302 E.09114
G1 X134.302 Y124.05 E.12889
G1 X129.374 Y124.05 E.16349
G1 X118.95 Y113.626 E.48898
G1 X118.95 Y116.374 E.09114
G1 X129.374 Y105.95 E.48898
G1 X126.626 Y105.95 E.09114
G1 X137.05 Y116.374 E.48898
G1 X137.05 Y113.626 E.09114
G1 X126.626 Y124.05 E.48898
G1 X121.698 Y124.05 E.16349
G1 X118.95 Y121.302 E.12889
G1 X118.95 Y124.05 E.09114
G1 X137.05 Y105.95 E.84908
G1 X134.302 Y105.95 E.09114
G1 X137.05 Y108.698 E.12889
G1 X137.05 Y110.326 E.05401
; WIPE_START
M204 S10000
G1 X137.05 Y108.698 E-.61876
G1 X136.787 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z9 I-1.185 J.276 P1  F30000
G1 X167.526 Y240.229 Z9
G1 Z8.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #44
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #43
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M73 P83 R16
G1 E-2 F1800
G17
G3 Z9 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z11.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E7
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P84 R15
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z11.6 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z8.6
G1 X179.584 Y247.983 Z9
G1 X197.753 Y247.983 Z9
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z8.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 43 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer43 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.991 Y141.774 Z9 F30000
G1 X118.95 Y132.326 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.95 Y130.698 E.05236
G1 X121.698 Y127.95 E.12494
G1 X118.95 Y127.95 E.08835
G1 X137.05 Y146.05 E.82309
G1 X137.05 Y143.302 E.08835
G1 X134.302 Y146.05 E.12494
G1 X129.374 Y146.05 E.15848
G1 X118.95 Y135.626 E.47401
G1 X118.95 Y138.374 E.08835
G1 X129.374 Y127.95 E.47401
G1 X126.626 Y127.95 E.08835
G1 X137.05 Y138.374 E.47401
G1 X137.05 Y135.626 E.08835
G1 X126.626 Y146.05 E.47402
G1 X121.698 Y146.05 E.15848
G1 X118.95 Y143.302 E.12494
G1 X118.95 Y146.05 E.08835
G1 X137.05 Y127.95 E.82308
G1 X134.302 Y127.95 E.08835
G1 X137.05 Y130.698 E.12494
G1 X137.05 Y132.326 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y130.698 E-.61876
G1 X136.787 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 44/50
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z9 I-1.216 J.047 P1  F30000
G1 X137.398 Y146.398 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 44 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer44 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y139.133 Z9.2 F30000
G1 X137.05 Y132.326 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y130.698 E.05236
G1 X134.302 Y127.95 E.12494
G1 X137.05 Y127.95 E.08835
G1 X118.95 Y146.05 E.82308
G1 X118.95 Y143.302 E.08835
G1 X121.698 Y146.05 E.12494
G1 X126.626 Y146.05 E.15848
G1 X137.05 Y135.626 E.47402
G1 X137.05 Y138.374 E.08835
G1 X126.626 Y127.95 E.47401
G1 X129.374 Y127.95 E.08835
G1 X118.95 Y138.374 E.47401
G1 X118.95 Y135.626 E.08835
G1 X129.374 Y146.05 E.47401
G1 X134.302 Y146.05 E.15848
G1 X137.05 Y143.302 E.12494
G1 X137.05 Y146.05 E.08835
G1 X118.95 Y127.95 E.82309
G1 X121.698 Y127.95 E.08835
G1 X118.95 Y130.698 E.12494
G1 X118.95 Y132.326 E.05236
; WIPE_START
M204 S10000
G1 X118.95 Y130.698 E-.61876
G1 X119.213 Y130.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z9.2 I-.988 J.71 P1  F30000
G1 X190.026 Y228.979 Z9.2
G1 Z8.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #45
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #44
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z9.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z11.8 F1200

G1 X70 F21000
G1 Y245
M73 P84 R14
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E6
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P85 R14
G1 E6.50186 F523
M73 P85 R13
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
M73 P86 R13
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z11.8 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z8.8
G1 X159.798 Y247.983 Z9.2
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z8.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.455 Y117.133 Z9.2 F30000
G1 X137.05 Y110.326 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.05 Y108.698 E.05401
G1 X134.302 Y105.95 E.12889
G1 X137.05 Y105.95 E.09114
G1 X118.95 Y124.05 E.84908
G1 X118.95 Y121.302 E.09114
G1 X121.698 Y124.05 E.12889
G1 X126.626 Y124.05 E.16349
G1 X137.05 Y113.626 E.48898
G1 X137.05 Y116.374 E.09114
G1 X126.626 Y105.95 E.48898
G1 X129.374 Y105.95 E.09114
G1 X118.95 Y116.374 E.48898
G1 X118.95 Y113.626 E.09114
G1 X129.374 Y124.05 E.48898
G1 X134.302 Y124.05 E.16349
G1 X137.05 Y121.302 E.12889
G1 X137.05 Y124.05 E.09114
G1 X118.95 Y105.95 E.84908
G1 X121.698 Y105.95 E.09114
G1 X118.95 Y108.698 E.12889
G1 X118.95 Y110.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y108.698 E-.61876
G1 X119.213 Y108.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 45/50
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z9.2 I-.803 J.915 P1  F30000
G1 X137.398 Y124.398 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.625 Y123.673 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.997 Y123.673 E.05401
G1 X119.328 Y114.003 E.4536
G1 X119.328 Y115.997 E.06611
G1 X128.997 Y106.328 E.45359
G1 X127.003 Y106.328 E.06611
G1 X136.673 Y115.997 E.4536
G1 X136.673 Y114.003 E.06612
G1 X127.003 Y123.673 E.4536
G1 X121.321 Y123.673 E.18851
G1 X119.328 Y121.679 E.0935
G1 X119.328 Y123.673 E.06611
G1 X136.673 Y106.328 E.81369
G1 X134.679 Y106.328 E.06611
G1 X136.673 Y108.321 E.0935
G1 X136.673 Y109.949 E.05401
G1 X137.008 Y105.992 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.399323
G1 F3000;_EXTRUDE_SET_SPEED
G1 X137.035 Y106.124 E.00391
G1 X137.035 Y123.876 E.51556
G1 X137.008 Y124.008 E.00391
G1 X136.876 Y124.035 E.00391
G1 X119.124 Y124.035 E.51556
G1 X118.992 Y124.008 E.00391
G1 X118.965 Y123.876 E.00391
G1 X118.965 Y106.124 E.51556
G1 X118.992 Y105.992 E.00391
G1 X119.124 Y105.965 E.00391
G1 X136.876 Y105.965 E.51556
G1 X136.949 Y105.98 E.00217
; Slow Down End
G1 X119.328 Y109.949 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X119.328 Y108.321 E.05401
G1 X121.321 Y106.328 E.0935
G1 X119.328 Y106.328 E.06611
G1 X136.673 Y123.673 E.81369
G1 X134.679 Y123.673 E.06612
G1 X136.673 Y121.679 E.0935
G1 X136.673 Y120.051 E.05401
; WIPE_START
M204 S10000
G1 X136.673 Y121.679 E-.61876
G1 X136.41 Y121.942 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z9.4 I-1.108 J.502 P1  F30000
G1 X190.026 Y240.229 Z9.4
G1 Z9
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
M73 P86 R12
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #46
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #45
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z9.4 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z12 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E5
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P87 R11
G1 E7.21903 F523
G1 E0.627742 F50
M73 P88 R11
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z12 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z9
G1 X159.798 Y247.983 Z9.4
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z9
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15476.087
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 45 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer45 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.625 Y145.672 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.997 Y145.672 E.05236
G1 X119.328 Y136.003 E.43971
G1 X119.328 Y137.997 E.06409
G1 X128.997 Y128.327 E.43971
G1 X127.003 Y128.327 E.06409
G1 X136.673 Y137.997 E.43971
G1 X136.673 Y136.003 E.06409
G1 X127.003 Y145.672 E.43971
G1 X121.321 Y145.672 E.18274
G1 X119.328 Y143.679 E.09064
G1 X119.328 Y145.672 E.06409
G1 X136.673 Y128.327 E.78878
G1 X134.679 Y128.327 E.06409
G1 X136.673 Y130.321 E.09064
G1 X136.673 Y131.949 E.05236
; WIPE_START
G1 X136.673 Y130.321 E-.61876
G1 X136.41 Y130.058 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X137.008 Y127.992 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.399323
G1 F3000;_EXTRUDE_SET_SPEED
G1 X137.035 Y128.124 E.00379
G1 X137.035 Y145.876 E.49978
G1 X137.008 Y146.008 E.00379
G1 X136.876 Y146.035 E.00379
G1 X119.124 Y146.035 E.49978
G1 X118.992 Y146.008 E.00379
G1 X118.965 Y145.876 E.00379
G1 X118.965 Y128.124 E.49978
G1 X118.992 Y127.992 E.00379
G1 X119.124 Y127.965 E.00379
G1 X136.876 Y127.965 E.49978
G1 X136.949 Y127.98 E.0021
; Slow Down End
; WIPE_START
G1 X136.876 Y127.965 E-.02837
G1 X134.951 Y127.965 E-.73163
; WIPE_END
G1 E-.04 F1800
G1 X127.555 Y129.851 Z9.4 F30000
G1 X119.328 Y131.949 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X119.328 Y130.321 E.05236
G1 X121.321 Y128.327 E.09064
G1 X119.328 Y128.327 E.06409
G1 X136.673 Y145.672 E.78878
G1 X134.679 Y145.672 E.06409
G1 X136.673 Y143.679 E.09064
G1 X136.673 Y142.051 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X136.673 Y143.679 E-.61876
G1 X136.41 Y143.942 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 46/50
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z9.4 I-1.129 J.454 P1  F30000
G1 X137.398 Y146.398 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 46 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer46 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.318 Y146.231 Z9.6 F30000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40124
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X137.028 Y145.521 E.05013
G1 X137.028 Y144.883 E.03187
G1 X135.883 Y146.028 E.0809
G1 X135.245 Y146.028 E.03187
G1 X137.028 Y144.245 E.12597
G1 X137.028 Y143.606 E.03187
G1 X134.606 Y146.028 E.17104
G1 X133.968 Y146.028 E.03187
G1 X137.028 Y142.968 E.21611
G1 X137.028 Y142.33 E.03187
G1 X133.33 Y146.028 E.26118
G1 X132.692 Y146.028 E.03187
G1 X137.028 Y141.692 E.30625
G1 X137.028 Y141.054 E.03187
G1 X132.054 Y146.028 E.35132
G1 X131.416 Y146.028 E.03187
G1 X137.028 Y140.416 E.39639
G1 X137.028 Y139.778 E.03187
G1 X130.778 Y146.028 E.44146
G1 X130.139 Y146.028 E.03187
G1 X137.028 Y139.139 E.48653
G1 X137.028 Y138.501 E.03187
G1 X129.501 Y146.028 E.53161
G1 X128.863 Y146.028 E.03187
G1 X137.028 Y137.863 E.57668
G1 X137.028 Y137.225 E.03187
G1 X128.225 Y146.028 E.62175
G1 X127.587 Y146.028 E.03187
G1 X137.028 Y136.587 E.66682
G1 X137.028 Y135.949 E.03187
G1 X126.949 Y146.028 E.71189
G1 X126.311 Y146.028 E.03187
G1 X137.028 Y135.311 E.75696
G1 X137.028 Y134.672 E.03187
G1 X125.672 Y146.028 E.80203
G1 X125.034 Y146.028 E.03187
G1 X137.028 Y134.034 E.8471
G1 X137.028 Y133.396 E.03187
G1 X124.396 Y146.028 E.89217
G1 X123.758 Y146.028 E.03187
G1 X137.028 Y132.758 E.93724
G1 X137.028 Y132.12 E.03187
G1 X123.12 Y146.028 E.98231
G1 X122.482 Y146.028 E.03187
G1 X137.028 Y131.482 E1.02738
G1 X137.028 Y130.843 E.03187
G1 X121.843 Y146.028 E1.07245
G1 X121.205 Y146.028 E.03187
G1 X137.028 Y130.205 E1.11752
G1 X137.028 Y129.567 E.03187
G1 X120.567 Y146.028 E1.16259
G1 X119.929 Y146.028 E.03187
G1 X137.028 Y128.929 E1.20766
G1 X137.028 Y128.291 E.03187
G1 X119.291 Y146.028 E1.25274
G1 X118.972 Y146.028 E.01594
G1 X118.972 Y145.709 E.01593
G1 X136.709 Y127.972 E1.25274
G1 X136.071 Y127.972 E.03187
G1 X118.972 Y145.071 E1.20767
G1 X118.972 Y144.433 E.03187
G1 X135.433 Y127.972 E1.1626
G1 X134.795 Y127.972 E.03187
G1 X118.972 Y143.795 E1.11752
G1 X118.972 Y143.157 E.03187
G1 X134.157 Y127.972 E1.07245
G1 X133.518 Y127.972 E.03187
G1 X118.972 Y142.518 E1.02738
G1 X118.972 Y141.88 E.03187
G1 X132.88 Y127.972 E.98231
G1 X132.242 Y127.972 E.03187
G1 X118.972 Y141.242 E.93724
G1 X118.972 Y140.604 E.03187
G1 X131.604 Y127.972 E.89217
G1 X130.966 Y127.972 E.03187
G1 X118.972 Y139.966 E.8471
M73 P88 R10
G1 X118.972 Y139.328 E.03187
G1 X130.328 Y127.972 E.80203
G1 X129.69 Y127.972 E.03187
G1 X118.972 Y138.689 E.75696
G1 X118.972 Y138.051 E.03187
G1 X129.051 Y127.972 E.71189
G1 X128.413 Y127.972 E.03187
G1 X118.972 Y137.413 E.66682
G1 X118.972 Y136.775 E.03187
G1 X127.775 Y127.972 E.62175
G1 X127.137 Y127.972 E.03187
G1 X118.972 Y136.137 E.57668
G1 X118.972 Y135.499 E.03187
G1 X126.499 Y127.972 E.53161
G1 X125.861 Y127.972 E.03187
G1 X118.972 Y134.861 E.48654
G1 X118.972 Y134.222 E.03187
G1 X125.222 Y127.972 E.44147
G1 X124.584 Y127.972 E.03187
G1 X118.972 Y133.584 E.39639
G1 X118.972 Y132.946 E.03187
G1 X123.946 Y127.972 E.35132
G1 X123.308 Y127.972 E.03187
G1 X118.972 Y132.308 E.30625
G1 X118.972 Y131.67 E.03187
G1 X122.67 Y127.972 E.26118
G1 X122.032 Y127.972 E.03187
G1 X118.972 Y131.032 E.21611
G1 X118.972 Y130.394 E.03187
G1 X121.394 Y127.972 E.17104
G1 X120.755 Y127.972 E.03187
G1 X118.972 Y129.755 E.12597
G1 X118.972 Y129.117 E.03187
G1 X120.117 Y127.972 E.0809
G1 X119.479 Y127.972 E.03187
G1 X118.769 Y128.682 E.05013
M106 S51
; WIPE_START
M204 S10000
G1 X119.479 Y127.972 E-.38145
G1 X120.117 Y127.972 E-.2425
G1 X119.864 Y128.225 E-.13605
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z9.6 I-1.1 J.52 P1  F30000
G1 X167.526 Y228.979 Z9.6
G1 Z9.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y218.229  E0.4086 F5400
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #47
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #46
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z9.6 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z12.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
M73 P89 R10
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E4
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P89 R9
G1 E6.50186 F523
M73 P90 R9
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z12.2 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z9.2
G1 X189.022 Y247.983 Z9.6
G1 X197.753 Y247.983 Z9.6
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z9.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 F3000
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.318 Y124.231 Z9.6 F30000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40124
; LAYER_HEIGHT: 0.4
M73 P90 R8
G1 F3000
G1 X137.028 Y123.521 E.05171
G1 X137.028 Y122.883 E.03288
G1 X135.883 Y124.028 E.08345
G1 X135.245 Y124.028 E.03288
G1 X137.028 Y122.245 E.12995
G1 X137.028 Y121.607 E.03288
G1 X134.606 Y124.028 E.17644
G1 X133.968 Y124.028 E.03288
G1 X137.028 Y120.968 E.22294
G1 X137.028 Y120.33 E.03288
G1 X133.33 Y124.028 E.26943
G1 X132.692 Y124.028 E.03288
G1 X137.028 Y119.692 E.31592
G1 X137.028 Y119.054 E.03288
G1 X132.054 Y124.028 E.36242
G1 X131.416 Y124.028 E.03288
G1 X137.028 Y118.416 E.40891
G1 X137.028 Y117.778 E.03288
G1 X130.778 Y124.028 E.45541
G1 X130.139 Y124.028 E.03288
G1 X137.028 Y117.139 E.5019
G1 X137.028 Y116.501 E.03288
G1 X129.501 Y124.028 E.54839
G1 X128.863 Y124.028 E.03288
G1 X137.028 Y115.863 E.59489
G1 X137.028 Y115.225 E.03288
G1 X128.225 Y124.028 E.64138
G1 X127.587 Y124.028 E.03288
G1 X137.028 Y114.587 E.68788
G1 X137.028 Y113.949 E.03288
G1 X126.949 Y124.028 E.73437
G1 X126.311 Y124.028 E.03288
G1 X137.028 Y113.311 E.78086
G1 X137.028 Y112.672 E.03288
G1 X125.672 Y124.028 E.82736
G1 X125.034 Y124.028 E.03288
G1 X137.028 Y112.034 E.87385
G1 X137.028 Y111.396 E.03288
G1 X124.396 Y124.028 E.92035
G1 X123.758 Y124.028 E.03288
G1 X137.028 Y110.758 E.96684
G1 X137.028 Y110.12 E.03288
G1 X123.12 Y124.028 E1.01333
G1 X122.482 Y124.028 E.03288
G1 X137.028 Y109.482 E1.05983
G1 X137.028 Y108.844 E.03288
G1 X121.843 Y124.028 E1.10632
G1 X121.205 Y124.028 E.03288
G1 X137.028 Y108.205 E1.15281
G1 X137.028 Y107.567 E.03288
G1 X120.567 Y124.028 E1.19931
M73 P91 R8
G1 X119.929 Y124.028 E.03288
G1 X137.028 Y106.929 E1.2458
G1 X137.028 Y106.291 E.03288
G1 X119.291 Y124.028 E1.2923
G1 X118.972 Y124.028 E.01644
G1 X118.972 Y123.709 E.01644
G1 X136.709 Y105.972 E1.2923
G1 X136.071 Y105.972 E.03288
G1 X118.972 Y123.071 E1.2458
G1 X118.972 Y122.433 E.03288
G1 X135.433 Y105.972 E1.19931
G1 X134.795 Y105.972 E.03288
G1 X118.972 Y121.795 E1.15282
G1 X118.972 Y121.157 E.03288
G1 X134.157 Y105.972 E1.10632
G1 X133.518 Y105.972 E.03288
G1 X118.972 Y120.518 E1.05983
G1 X118.972 Y119.88 E.03288
G1 X132.88 Y105.972 E1.01333
G1 X132.242 Y105.972 E.03288
G1 X118.972 Y119.242 E.96684
G1 X118.972 Y118.604 E.03288
G1 X131.604 Y105.972 E.92035
G1 X130.966 Y105.972 E.03288
G1 X118.972 Y117.966 E.87385
G1 X118.972 Y117.328 E.03288
G1 X130.328 Y105.972 E.82736
G1 X129.69 Y105.972 E.03288
G1 X118.972 Y116.69 E.78086
G1 X118.972 Y116.051 E.03288
G1 X129.051 Y105.972 E.73437
G1 X128.413 Y105.972 E.03288
G1 X118.972 Y115.413 E.68788
G1 X118.972 Y114.775 E.03288
G1 X127.775 Y105.972 E.64138
G1 X127.137 Y105.972 E.03288
G1 X118.972 Y114.137 E.59489
G1 X118.972 Y113.499 E.03288
G1 X126.499 Y105.972 E.54839
G1 X125.861 Y105.972 E.03288
G1 X118.972 Y112.861 E.5019
G1 X118.972 Y112.222 E.03288
G1 X125.222 Y105.972 E.45541
G1 X124.584 Y105.972 E.03288
G1 X118.972 Y111.584 E.40891
G1 X118.972 Y110.946 E.03288
G1 X123.946 Y105.972 E.36242
G1 X123.308 Y105.972 E.03288
G1 X118.972 Y110.308 E.31592
G1 X118.972 Y109.67 E.03288
G1 X122.67 Y105.972 E.26943
G1 X122.032 Y105.972 E.03288
G1 X118.972 Y109.032 E.22294
G1 X118.972 Y108.394 E.03288
G1 X121.394 Y105.972 E.17644
G1 X120.755 Y105.972 E.03288
G1 X118.972 Y107.755 E.12995
G1 X118.972 Y107.117 E.03288
G1 X120.117 Y105.972 E.08346
G1 X119.479 Y105.972 E.03288
G1 X118.769 Y106.682 E.05171
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X119.479 Y105.972 E-.38145
G1 X120.117 Y105.972 E-.2425
G1 X119.864 Y106.225 E-.13605
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 47/50
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z9.6 I-.876 J.845 P1  F30000
G1 X137.398 Y124.398 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.394 Y117.128 Z9.8 F30000
G1 X137.234 Y106.533 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X136.637 Y105.935 E.02611
G1 X136.101 Y105.935 E.01658
G1 X137.065 Y106.899 E.04214
G1 X137.065 Y107.436 E.01658
G1 X135.564 Y105.935 E.06559
G1 X135.028 Y105.935 E.01658
G1 X137.065 Y107.972 E.08903
G1 X137.065 Y108.509 E.01658
G1 X134.491 Y105.935 E.11248
G1 X133.955 Y105.935 E.01658
G1 X137.065 Y109.045 E.13593
G1 X137.065 Y109.581 E.01658
G1 X133.419 Y105.935 E.15937
G1 X132.882 Y105.935 E.01658
G1 X137.065 Y110.118 E.18282
G1 X137.065 Y110.654 E.01658
G1 X132.346 Y105.935 E.20627
G1 X131.809 Y105.935 E.01658
G1 X137.065 Y111.191 E.22971
G1 X137.065 Y111.727 E.01658
G1 X131.273 Y105.935 E.25316
G1 X130.737 Y105.935 E.01658
G1 X137.065 Y112.264 E.27661
G1 X137.065 Y112.8 E.01658
G1 X130.2 Y105.935 E.30006
G1 X129.664 Y105.935 E.01658
G1 X137.065 Y113.336 E.3235
G1 X137.065 Y113.873 E.01658
G1 X129.127 Y105.935 E.34695
G1 X128.591 Y105.935 E.01658
G1 X137.065 Y114.409 E.3704
G1 X137.065 Y114.946 E.01658
G1 X128.054 Y105.935 E.39384
G1 X127.518 Y105.935 E.01658
G1 X137.065 Y115.482 E.41729
G1 X137.065 Y116.018 E.01658
G1 X126.982 Y105.935 E.44074
G1 X126.445 Y105.935 E.01658
G1 X137.065 Y116.555 E.46418
G1 X137.065 Y117.091 E.01658
G1 X125.909 Y105.935 E.48763
G1 X125.372 Y105.935 E.01658
G1 X137.065 Y117.628 E.51108
G1 X137.065 Y118.164 E.01658
G1 X124.836 Y105.935 E.53452
G1 X124.3 Y105.935 E.01658
G1 X137.065 Y118.7 E.55797
G1 X137.065 Y119.237 E.01658
G1 X123.763 Y105.935 E.58142
G1 X123.227 Y105.935 E.01658
G1 X137.065 Y119.773 E.60486
G1 X137.065 Y120.31 E.01658
G1 X122.69 Y105.935 E.62831
G1 X122.154 Y105.935 E.01658
G1 X137.065 Y120.846 E.65176
G1 X137.065 Y121.382 E.01658
G1 X121.618 Y105.935 E.67521
G1 X121.081 Y105.935 E.01658
G1 X137.065 Y121.919 E.69865
G1 X137.065 Y122.455 E.01658
G1 X120.545 Y105.935 E.7221
G1 X120.008 Y105.935 E.01658
G1 X137.065 Y122.992 E.74555
G1 X137.065 Y123.528 E.01658
G1 X119.472 Y105.935 E.76899
G1 X118.936 Y105.935 E.01658
G1 X137.065 Y124.065 E.79244
G1 X136.528 Y124.065 E.01657
G1 X118.935 Y106.472 E.76901
G1 X118.935 Y107.008 E.01658
G1 X135.992 Y124.065 E.74556
G1 X135.456 Y124.065 E.01658
G1 X118.935 Y107.544 E.72211
G1 X118.935 Y108.081 E.01658
G1 X134.919 Y124.065 E.69867
G1 X134.383 Y124.065 E.01658
G1 X118.935 Y108.617 E.67522
G1 X118.935 Y109.154 E.01658
G1 X133.846 Y124.065 E.65177
G1 X133.31 Y124.065 E.01658
G1 X118.935 Y109.69 E.62833
G1 X118.935 Y110.226 E.01658
G1 X132.774 Y124.065 E.60488
G1 X132.237 Y124.065 E.01658
G1 X118.935 Y110.763 E.58143
G1 X118.935 Y111.299 E.01658
G1 X131.701 Y124.065 E.55799
G1 X131.164 Y124.065 E.01658
G1 X118.935 Y111.836 E.53454
G1 X118.935 Y112.372 E.01658
G1 X130.628 Y124.065 E.51109
G1 X130.092 Y124.065 E.01658
G1 X118.935 Y112.909 E.48764
G1 X118.935 Y113.445 E.01658
G1 X129.555 Y124.065 E.4642
G1 X129.019 Y124.065 E.01658
G1 X118.935 Y113.981 E.44075
G1 X118.935 Y114.518 E.01658
G1 X128.482 Y124.065 E.4173
G1 X127.946 Y124.065 E.01658
G1 X118.935 Y115.054 E.39386
G1 X118.935 Y115.591 E.01658
G1 X127.409 Y124.065 E.37041
G1 X126.873 Y124.065 E.01658
G1 X118.935 Y116.127 E.34696
G1 X118.935 Y116.663 E.01658
G1 X126.337 Y124.065 E.32352
G1 X125.8 Y124.065 E.01658
G1 X118.935 Y117.2 E.30007
G1 X118.935 Y117.736 E.01658
G1 X125.264 Y124.065 E.27662
G1 X124.727 Y124.065 E.01658
G1 X118.935 Y118.273 E.25318
G1 X118.935 Y118.809 E.01658
G1 X124.191 Y124.065 E.22973
G1 X123.655 Y124.065 E.01658
G1 X118.935 Y119.345 E.20628
G1 X118.935 Y119.882 E.01658
G1 X123.118 Y124.065 E.18284
G1 X122.582 Y124.065 E.01658
G1 X118.935 Y120.418 E.15939
G1 X118.935 Y120.955 E.01658
G1 X122.045 Y124.065 E.13594
G1 X121.509 Y124.065 E.01658
G1 X118.935 Y121.491 E.11249
G1 X118.935 Y122.028 E.01658
G1 X120.973 Y124.065 E.08905
G1 X120.436 Y124.065 E.01658
G1 X118.935 Y122.564 E.0656
G1 X118.935 Y123.1 E.01658
G1 X119.9 Y124.065 E.04215
G1 X119.363 Y124.065 E.01658
G1 X118.766 Y123.467 E.02612
; WIPE_START
M204 S10000
G1 X119.363 Y124.065 E-.32117
G1 X119.9 Y124.065 E-.20384
G1 X119.462 Y123.627 E-.23499
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z9.8 I-1.125 J.464 P1  F30000
G1 X167.526 Y240.229 Z9.8
G1 Z9.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147 F5400
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X190.141 Y217.336   I-0.245 J3.495 E0.1255
G1 E-0.8000 F1800
G1  X191.890 Y219.122   F600
G1 E0.8000 F1800
G3  X191.503 Y222.414   I-1.406 J1.503 E0.1464 F5400
G2  X190.526 Y225.190   I3.471 J2.781 E0.1140
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END
G1  X167.526 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X167.526  E0.8551
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #48
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #47
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z9.8 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z12.4 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E3
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P92 R7
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z12.4 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X171.952 Y247.983 F30000
G1 Z9.4
G1 X179.584 Y247.983 Z9.8
G1 X197.753 Y247.983 Z9.8
G1 X197.753 Y218.229

; filament start gcode
M106 P3 S180


G1 X190.026 Y218.229
G1 Z9.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
M73 P92 R6
G1  Y218.979  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X190.026  E0.8551
G1  Y222.729  E0.0285
G1  X167.526  E0.8551
G1  Y223.479  E0.0285
G1  X190.026  E0.8551
G1  Y224.229  E0.0285
G1  X167.526  E0.8551
G1  Y224.979  E0.0285
M73 P93 R6
G1  X190.026  E0.8551
G1  Y225.729  E0.0285
G1  X167.526  E0.8551
G1  Y226.479  E0.0285
G1  X190.026  E0.8551
G1  Y227.229  E0.0285
G1  X167.526  E0.8551
G1  Y227.979  E0.0285
G1  X190.026  E0.8551
G1  Y228.729  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15000
G1 X169.526 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 47 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer47 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.394 Y139.128 Z9.8 F30000
G1 X137.234 Y128.533 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X136.637 Y127.935 E.02531
G1 X136.101 Y127.935 E.01607
G1 X137.065 Y128.899 E.04085
G1 X137.065 Y129.436 E.01607
G1 X135.564 Y127.935 E.06358
G1 X135.028 Y127.935 E.01607
G1 X137.065 Y129.972 E.08631
G1 X137.065 Y130.509 E.01607
G1 X134.491 Y127.935 E.10904
G1 X133.955 Y127.935 E.01607
G1 X137.065 Y131.045 E.13177
G1 X137.065 Y131.581 E.01607
G1 X133.419 Y127.935 E.15449
G1 X132.882 Y127.935 E.01607
G1 X137.065 Y132.118 E.17722
G1 X137.065 Y132.654 E.01607
G1 X132.346 Y127.935 E.19995
G1 X131.809 Y127.935 E.01607
G1 X137.065 Y133.191 E.22268
G1 X137.065 Y133.727 E.01607
G1 X131.273 Y127.935 E.24541
G1 X130.737 Y127.935 E.01607
G1 X137.065 Y134.263 E.26814
G1 X137.065 Y134.8 E.01607
G1 X130.2 Y127.935 E.29087
G1 X129.664 Y127.935 E.01607
G1 X137.065 Y135.336 E.3136
G1 X137.065 Y135.873 E.01607
G1 X129.127 Y127.935 E.33633
G1 X128.591 Y127.935 E.01607
G1 X137.065 Y136.409 E.35906
G1 X137.065 Y136.946 E.01607
G1 X128.054 Y127.935 E.38179
G1 X127.518 Y127.935 E.01607
G1 X137.065 Y137.482 E.40452
G1 X137.065 Y138.018 E.01607
G1 X126.982 Y127.935 E.42724
G1 X126.445 Y127.935 E.01607
G1 X137.065 Y138.555 E.44997
G1 X137.065 Y139.091 E.01607
G1 X125.909 Y127.935 E.4727
G1 X125.372 Y127.935 E.01607
G1 X137.065 Y139.628 E.49543
G1 X137.065 Y140.164 E.01607
G1 X124.836 Y127.935 E.51816
G1 X124.3 Y127.935 E.01607
G1 X137.065 Y140.7 E.54089
G1 X137.065 Y141.237 E.01607
G1 X123.763 Y127.935 E.56362
G1 X123.227 Y127.935 E.01607
G1 X137.065 Y141.773 E.58635
G1 X137.065 Y142.31 E.01607
G1 X122.69 Y127.935 E.60908
G1 X122.154 Y127.935 E.01607
G1 X137.065 Y142.846 E.63181
G1 X137.065 Y143.382 E.01607
G1 X121.618 Y127.935 E.65454
G1 X121.081 Y127.935 E.01607
G1 X137.065 Y143.919 E.67727
G1 X137.065 Y144.455 E.01607
G1 X120.545 Y127.935 E.69999
G1 X120.008 Y127.935 E.01607
G1 X137.065 Y144.992 E.72272
G1 X137.065 Y145.528 E.01607
G1 X119.472 Y127.935 E.74545
G1 X118.936 Y127.935 E.01607
G1 X137.065 Y146.065 E.76819
G1 X136.528 Y146.065 E.01607
G1 X118.935 Y128.472 E.74547
G1 X118.935 Y129.008 E.01607
G1 X135.992 Y146.065 E.72274
G1 X135.456 Y146.065 E.01607
G1 X118.935 Y129.544 E.70001
G1 X118.935 Y130.081 E.01607
G1 X134.919 Y146.065 E.67728
G1 X134.383 Y146.065 E.01607
G1 X118.935 Y130.617 E.65455
G1 X118.935 Y131.154 E.01607
G1 X133.846 Y146.065 E.63182
G1 X133.31 Y146.065 E.01607
G1 X118.935 Y131.69 E.60909
G1 X118.935 Y132.226 E.01607
G1 X132.774 Y146.065 E.58636
G1 X132.237 Y146.065 E.01607
G1 X118.935 Y132.763 E.56363
G1 X118.935 Y133.299 E.01607
G1 X131.701 Y146.065 E.5409
G1 X131.164 Y146.065 E.01607
G1 X118.935 Y133.836 E.51818
G1 X118.935 Y134.372 E.01607
G1 X130.628 Y146.065 E.49545
G1 X130.092 Y146.065 E.01607
G1 X118.935 Y134.908 E.47272
G1 X118.935 Y135.445 E.01607
G1 X129.555 Y146.065 E.44999
G1 X129.019 Y146.065 E.01607
G1 X118.935 Y135.981 E.42726
G1 X118.935 Y136.518 E.01607
G1 X128.482 Y146.065 E.40453
G1 X127.946 Y146.065 E.01607
G1 X118.935 Y137.054 E.3818
G1 X118.935 Y137.591 E.01607
G1 X127.409 Y146.065 E.35907
G1 X126.873 Y146.065 E.01607
G1 X118.935 Y138.127 E.33634
G1 X118.935 Y138.663 E.01607
G1 X126.337 Y146.065 E.31361
G1 X125.8 Y146.065 E.01607
G1 X118.935 Y139.2 E.29088
G1 X118.935 Y139.736 E.01607
G1 X125.264 Y146.065 E.26815
G1 X124.727 Y146.065 E.01607
G1 X118.935 Y140.273 E.24543
G1 X118.935 Y140.809 E.01607
G1 X124.191 Y146.065 E.2227
G1 X123.655 Y146.065 E.01607
G1 X118.935 Y141.345 E.19997
G1 X118.935 Y141.882 E.01607
G1 X123.118 Y146.065 E.17724
G1 X122.582 Y146.065 E.01607
G1 X118.935 Y142.418 E.15451
G1 X118.935 Y142.955 E.01607
G1 X122.045 Y146.065 E.13178
G1 X121.509 Y146.065 E.01607
G1 X118.935 Y143.491 E.10905
G1 X118.935 Y144.027 E.01607
G1 X120.973 Y146.065 E.08632
G1 X120.436 Y146.065 E.01607
G1 X118.935 Y144.564 E.06359
G1 X118.935 Y145.1 E.01607
G1 X119.9 Y146.065 E.04086
G1 X119.363 Y146.065 E.01607
G1 X118.766 Y145.467 E.02532
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X119.363 Y146.065 E-.32117
G1 X119.9 Y146.065 E-.20384
G1 X119.462 Y145.627 E-.23499
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 48/50
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z9.8 I-.052 J1.216 P1  F30000
G1 X137.398 Y146.398 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 48 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer48 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.467 Y146.234 Z10 F30000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X137.065 Y145.637 E.02531
G1 X137.065 Y145.101 E.01607
G1 X136.101 Y146.065 E.04085
G1 X135.564 Y146.065 E.01607
G1 X137.065 Y144.564 E.06358
G1 X137.065 Y144.028 E.01607
G1 X135.028 Y146.065 E.08631
G1 X134.491 Y146.065 E.01607
G1 X137.065 Y143.491 E.10904
G1 X137.065 Y142.955 E.01607
G1 X133.955 Y146.065 E.13177
G1 X133.419 Y146.065 E.01607
G1 X137.065 Y142.419 E.15449
G1 X137.065 Y141.882 E.01607
G1 X132.882 Y146.065 E.17722
G1 X132.346 Y146.065 E.01607
G1 X137.065 Y141.346 E.19995
G1 X137.065 Y140.809 E.01607
G1 X131.809 Y146.065 E.22268
G1 X131.273 Y146.065 E.01607
G1 X137.065 Y140.273 E.24541
G1 X137.065 Y139.737 E.01607
G1 X130.737 Y146.065 E.26814
G1 X130.2 Y146.065 E.01607
G1 X137.065 Y139.2 E.29087
G1 X137.065 Y138.664 E.01607
G1 X129.664 Y146.065 E.3136
G1 X129.127 Y146.065 E.01607
G1 X137.065 Y138.127 E.33633
G1 X137.065 Y137.591 E.01607
G1 X128.591 Y146.065 E.35906
G1 X128.054 Y146.065 E.01607
G1 X137.065 Y137.054 E.38179
G1 X137.065 Y136.518 E.01607
G1 X127.518 Y146.065 E.40452
G1 X126.982 Y146.065 E.01607
G1 X137.065 Y135.982 E.42724
G1 X137.065 Y135.445 E.01607
G1 X126.445 Y146.065 E.44997
G1 X125.909 Y146.065 E.01607
G1 X137.065 Y134.909 E.4727
G1 X137.065 Y134.372 E.01607
G1 X125.372 Y146.065 E.49543
G1 X124.836 Y146.065 E.01607
G1 X137.065 Y133.836 E.51816
G1 X137.065 Y133.3 E.01607
G1 X124.3 Y146.065 E.54089
G1 X123.763 Y146.065 E.01607
G1 X137.065 Y132.763 E.56362
G1 X137.065 Y132.227 E.01607
G1 X123.227 Y146.065 E.58635
G1 X122.69 Y146.065 E.01607
G1 X137.065 Y131.69 E.60908
G1 X137.065 Y131.154 E.01607
G1 X122.154 Y146.065 E.63181
G1 X121.618 Y146.065 E.01607
G1 X137.065 Y130.618 E.65454
G1 X137.065 Y130.081 E.01607
G1 X121.081 Y146.065 E.67727
G1 X120.545 Y146.065 E.01607
G1 X137.065 Y129.545 E.69999
G1 X137.065 Y129.008 E.01607
G1 X120.008 Y146.065 E.72272
G1 X119.472 Y146.065 E.01607
G1 X137.065 Y128.472 E.74545
G1 X137.065 Y127.935 E.01607
G1 X118.935 Y146.065 E.76819
G1 X118.935 Y145.528 E.01607
G1 X136.528 Y127.935 E.74547
G1 X135.992 Y127.935 E.01607
G1 X118.935 Y144.992 E.72274
G1 X118.935 Y144.456 E.01607
G1 X135.456 Y127.935 E.70001
G1 X134.919 Y127.935 E.01607
G1 X118.935 Y143.919 E.67728
G1 X118.935 Y143.383 E.01607
G1 X134.383 Y127.935 E.65455
G1 X133.846 Y127.935 E.01607
G1 X118.935 Y142.846 E.63182
G1 X118.935 Y142.31 E.01607
G1 X133.31 Y127.935 E.60909
G1 X132.774 Y127.935 E.01607
G1 X118.935 Y141.774 E.58636
G1 X118.935 Y141.237 E.01607
G1 X132.237 Y127.935 E.56363
G1 X131.701 Y127.935 E.01607
G1 X118.935 Y140.701 E.5409
G1 X118.935 Y140.164 E.01607
G1 X131.164 Y127.935 E.51818
G1 X130.628 Y127.935 E.01607
G1 X118.935 Y139.628 E.49545
G1 X118.935 Y139.091 E.01607
G1 X130.092 Y127.935 E.47272
G1 X129.555 Y127.935 E.01607
G1 X118.935 Y138.555 E.44999
G1 X118.935 Y138.019 E.01607
G1 X129.019 Y127.935 E.42726
G1 X128.482 Y127.935 E.01607
G1 X118.935 Y137.482 E.40453
G1 X118.935 Y136.946 E.01607
G1 X127.946 Y127.935 E.3818
G1 X127.409 Y127.935 E.01607
G1 X118.935 Y136.409 E.35907
G1 X118.935 Y135.873 E.01607
G1 X126.873 Y127.935 E.33634
G1 X126.337 Y127.935 E.01607
G1 X118.935 Y135.337 E.31361
G1 X118.935 Y134.8 E.01607
G1 X125.8 Y127.935 E.29088
G1 X125.264 Y127.935 E.01607
G1 X118.935 Y134.264 E.26815
G1 X118.935 Y133.727 E.01607
G1 X124.727 Y127.935 E.24543
G1 X124.191 Y127.935 E.01607
G1 X118.935 Y133.191 E.2227
G1 X118.935 Y132.655 E.01607
G1 X123.655 Y127.935 E.19997
G1 X123.118 Y127.935 E.01607
G1 X118.935 Y132.118 E.17724
G1 X118.935 Y131.582 E.01607
G1 X122.582 Y127.935 E.15451
G1 X122.045 Y127.935 E.01607
G1 X118.935 Y131.045 E.13178
G1 X118.935 Y130.509 E.01607
G1 X121.509 Y127.935 E.10905
G1 X120.973 Y127.935 E.01607
G1 X118.935 Y129.972 E.08632
G1 X118.935 Y129.436 E.01607
G1 X120.436 Y127.935 E.06359
G1 X119.9 Y127.935 E.01607
G1 X118.935 Y128.9 E.04086
G1 X118.935 Y128.363 E.01607
G1 X119.533 Y127.766 E.02532
; WIPE_START
M204 S10000
G1 X118.935 Y128.363 E-.32117
G1 X118.935 Y128.9 E-.20384
G1 X119.373 Y128.462 E-.235
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
G17
G3 Z10 I-.996 J.7 P1  F30000
G1 X190.026 Y228.979 Z10
G1 Z9.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526 Y228.979  E0.8551 F5400
G1  Y218.229  E0.4086
G1  X190.026  E0.8551
G1  Y228.979  E0.4086
G1  X168.526 Y218.229  
;--------------------
; CP EMPTY GRID START
; layer #49
G1  Y228.979  E0.4086
G1  X175.359 
G1  Y218.229  E0.4086
G1  X182.193 
G1  Y228.979  E0.4086
G1  X189.026 
G1  Y218.229  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #48
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z10 I1.217 J0 P1  F5400
; filament end gcode 


M620 S0A
M204 S9000
G1 Z12.6 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E2
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P94 R5
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
M73 P94 R4
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P95 R4
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z12.6 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X162.397 Y247.983 F30000
G1 Z9.6
G1 X159.798 Y247.983 Z10
G1 X159.798 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X167.526 Y239.979
G1 Z9.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X167.526  E0.8551
G1  Y235.479  E0.0285
G1  X190.026  E0.8551
G1  Y234.729  E0.0285
G1  X167.526  E0.8551
G1  Y233.979  E0.0285
G1  X190.026  E0.8551
G1  Y233.229  E0.0285
G1  X167.526  E0.8551
G1  Y232.479  E0.0285
G1  X190.026  E0.8551
G1  Y231.729  E0.0285
G1  X167.526  E0.8551
G1  Y230.979  E0.0285
G1  X190.026  E0.8551
G1  Y230.229  E0.0285
G1  X167.526  E0.8551
G1  Y229.479  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.166 Y240.872   E0.0704
G1 E-0.8000 F1800
G1  X165.423 Y239.080   F600
G1 E0.8000 F1800
G3  X166.049 Y236.044   I1.674 J-1.238 E0.1329 F5400
G2  X167.026 Y233.268   I-3.471 J-2.781 E0.1140
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END

; WIPE_START
G1 F15000
G1 X190.526 Y240.729 E-.00001
G1 X190.526 Y240.729 E-.00001
G1 X191.925 Y239.299 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.398 Y124.398
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.467 Y124.234 Z10 F30000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X137.065 Y123.637 E.02611
G1 X137.065 Y123.101 E.01658
G1 X136.101 Y124.065 E.04214
G1 X135.564 Y124.065 E.01658
G1 X137.065 Y122.564 E.06559
G1 X137.065 Y122.028 E.01658
G1 X135.028 Y124.065 E.08903
G1 X134.491 Y124.065 E.01658
G1 X137.065 Y121.491 E.11248
G1 X137.065 Y120.955 E.01658
G1 X133.955 Y124.065 E.13593
G1 X133.419 Y124.065 E.01658
G1 X137.065 Y120.419 E.15937
G1 X137.065 Y119.882 E.01658
G1 X132.882 Y124.065 E.18282
G1 X132.346 Y124.065 E.01658
G1 X137.065 Y119.346 E.20627
G1 X137.065 Y118.809 E.01658
G1 X131.809 Y124.065 E.22971
G1 X131.273 Y124.065 E.01658
G1 X137.065 Y118.273 E.25316
G1 X137.065 Y117.737 E.01658
G1 X130.737 Y124.065 E.27661
G1 X130.2 Y124.065 E.01658
G1 X137.065 Y117.2 E.30005
G1 X137.065 Y116.664 E.01658
G1 X129.664 Y124.065 E.3235
G1 X129.127 Y124.065 E.01658
G1 X137.065 Y116.127 E.34695
G1 X137.065 Y115.591 E.01658
G1 X128.591 Y124.065 E.3704
G1 X128.054 Y124.065 E.01658
G1 X137.065 Y115.055 E.39384
G1 X137.065 Y114.518 E.01658
G1 X127.518 Y124.065 E.41729
G1 X126.982 Y124.065 E.01658
G1 X137.065 Y113.982 E.44074
G1 X137.065 Y113.445 E.01658
G1 X126.445 Y124.065 E.46418
G1 X125.909 Y124.065 E.01658
G1 X137.065 Y112.909 E.48763
G1 X137.065 Y112.372 E.01658
G1 X125.372 Y124.065 E.51108
G1 X124.836 Y124.065 E.01658
G1 X137.065 Y111.836 E.53452
G1 X137.065 Y111.3 E.01658
G1 X124.3 Y124.065 E.55797
G1 X123.763 Y124.065 E.01658
G1 X137.065 Y110.763 E.58142
G1 X137.065 Y110.227 E.01658
G1 X123.227 Y124.065 E.60487
G1 X122.69 Y124.065 E.01658
G1 X137.065 Y109.69 E.62831
G1 X137.065 Y109.154 E.01658
G1 X122.154 Y124.065 E.65176
G1 X121.618 Y124.065 E.01658
G1 X137.065 Y108.618 E.67521
G1 X137.065 Y108.081 E.01658
G1 X121.081 Y124.065 E.69865
G1 X120.545 Y124.065 E.01658
G1 X137.065 Y107.545 E.7221
G1 X137.065 Y107.008 E.01658
G1 X120.008 Y124.065 E.74555
G1 X119.472 Y124.065 E.01658
G1 X137.065 Y106.472 E.76899
G1 X137.065 Y105.936 E.01658
G1 X118.935 Y124.065 E.79244
G1 X118.935 Y123.528 E.01657
G1 X136.528 Y105.935 E.76901
G1 X135.992 Y105.935 E.01658
G1 X118.935 Y122.992 E.74556
G1 X118.935 Y122.456 E.01658
G1 X135.456 Y105.935 E.72211
G1 X134.919 Y105.935 E.01658
G1 X118.935 Y121.919 E.69867
G1 X118.935 Y121.383 E.01658
G1 X134.383 Y105.935 E.67522
G1 X133.846 Y105.935 E.01658
G1 X118.935 Y120.846 E.65177
G1 X118.935 Y120.31 E.01658
G1 X133.31 Y105.935 E.62833
G1 X132.774 Y105.935 E.01658
G1 X118.935 Y119.774 E.60488
G1 X118.935 Y119.237 E.01658
G1 X132.237 Y105.935 E.58143
G1 X131.701 Y105.935 E.01658
G1 X118.935 Y118.701 E.55799
G1 X118.935 Y118.164 E.01658
G1 X131.164 Y105.935 E.53454
G1 X130.628 Y105.935 E.01658
G1 X118.935 Y117.628 E.51109
G1 X118.935 Y117.092 E.01658
G1 X130.092 Y105.935 E.48765
G1 X129.555 Y105.935 E.01658
G1 X118.935 Y116.555 E.4642
G1 X118.935 Y116.019 E.01658
G1 X129.019 Y105.935 E.44075
G1 X128.482 Y105.935 E.01658
G1 X118.935 Y115.482 E.4173
G1 X118.935 Y114.946 E.01658
G1 X127.946 Y105.935 E.39386
G1 X127.409 Y105.935 E.01658
G1 X118.935 Y114.409 E.37041
G1 X118.935 Y113.873 E.01658
G1 X126.873 Y105.935 E.34696
G1 X126.337 Y105.935 E.01658
G1 X118.935 Y113.337 E.32352
G1 X118.935 Y112.8 E.01658
G1 X125.8 Y105.935 E.30007
G1 X125.264 Y105.935 E.01658
G1 X118.935 Y112.264 E.27662
G1 X118.935 Y111.727 E.01658
G1 X124.727 Y105.935 E.25318
G1 X124.191 Y105.935 E.01658
G1 X118.935 Y111.191 E.22973
G1 X118.935 Y110.655 E.01658
G1 X123.655 Y105.935 E.20628
G1 X123.118 Y105.935 E.01658
G1 X118.935 Y110.118 E.18283
G1 X118.935 Y109.582 E.01658
G1 X122.582 Y105.935 E.15939
G1 X122.045 Y105.935 E.01658
G1 X118.935 Y109.045 E.13594
G1 X118.935 Y108.509 E.01658
G1 X121.509 Y105.935 E.11249
G1 X120.973 Y105.935 E.01658
G1 X118.935 Y107.973 E.08905
G1 X118.935 Y107.436 E.01658
G1 X120.436 Y105.935 E.0656
G1 X119.9 Y105.935 E.01658
G1 X118.935 Y106.9 E.04215
G1 X118.935 Y106.363 E.01658
G1 X119.533 Y105.766 E.02612
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.935 Y106.363 E-.32117
G1 X118.935 Y106.9 E-.20384
G1 X119.373 Y106.462 E-.235
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
; layer num/total_layer_count: 49/50
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
G17
G3 Z10 I-.858 J.863 P1  F30000
G1 X137.398 Y124.398 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y124.398 E.62349
G1 X118.602 Y105.602 E.62349
G1 X137.398 Y105.602 E.62349
G1 X137.398 Y124.338 E.6215
M204 S250
G1 X137.79 Y124.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
; WIPE_START
M204 S10000
G1 X135.79 Y124.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.394 Y117.128 Z10.2 F30000
G1 X137.234 Y106.533 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X136.637 Y105.935 E.02611
G1 X136.101 Y105.935 E.01658
G1 X137.065 Y106.899 E.04214
G1 X137.065 Y107.436 E.01658
G1 X135.564 Y105.935 E.06559
G1 X135.028 Y105.935 E.01658
G1 X137.065 Y107.972 E.08903
G1 X137.065 Y108.509 E.01658
G1 X134.491 Y105.935 E.11248
G1 X133.955 Y105.935 E.01658
G1 X137.065 Y109.045 E.13593
G1 X137.065 Y109.581 E.01658
G1 X133.419 Y105.935 E.15937
G1 X132.882 Y105.935 E.01658
G1 X137.065 Y110.118 E.18282
G1 X137.065 Y110.654 E.01658
G1 X132.346 Y105.935 E.20627
G1 X131.809 Y105.935 E.01658
G1 X137.065 Y111.191 E.22971
G1 X137.065 Y111.727 E.01658
G1 X131.273 Y105.935 E.25316
G1 X130.737 Y105.935 E.01658
G1 X137.065 Y112.264 E.27661
G1 X137.065 Y112.8 E.01658
G1 X130.2 Y105.935 E.30006
G1 X129.664 Y105.935 E.01658
G1 X137.065 Y113.336 E.3235
G1 X137.065 Y113.873 E.01658
G1 X129.127 Y105.935 E.34695
G1 X128.591 Y105.935 E.01658
G1 X137.065 Y114.409 E.3704
G1 X137.065 Y114.946 E.01658
G1 X128.054 Y105.935 E.39384
G1 X127.518 Y105.935 E.01658
G1 X137.065 Y115.482 E.41729
G1 X137.065 Y116.018 E.01658
G1 X126.982 Y105.935 E.44074
G1 X126.445 Y105.935 E.01658
G1 X137.065 Y116.555 E.46418
G1 X137.065 Y117.091 E.01658
G1 X125.909 Y105.935 E.48763
G1 X125.372 Y105.935 E.01658
G1 X137.065 Y117.628 E.51108
G1 X137.065 Y118.164 E.01658
G1 X124.836 Y105.935 E.53452
G1 X124.3 Y105.935 E.01658
G1 X137.065 Y118.7 E.55797
G1 X137.065 Y119.237 E.01658
G1 X123.763 Y105.935 E.58142
G1 X123.227 Y105.935 E.01658
G1 X137.065 Y119.773 E.60486
G1 X137.065 Y120.31 E.01658
G1 X122.69 Y105.935 E.62831
G1 X122.154 Y105.935 E.01658
G1 X137.065 Y120.846 E.65176
G1 X137.065 Y121.382 E.01658
G1 X121.618 Y105.935 E.67521
G1 X121.081 Y105.935 E.01658
G1 X137.065 Y121.919 E.69865
G1 X137.065 Y122.455 E.01658
G1 X120.545 Y105.935 E.7221
G1 X120.008 Y105.935 E.01658
G1 X137.065 Y122.992 E.74555
G1 X137.065 Y123.528 E.01658
G1 X119.472 Y105.935 E.76899
G1 X118.936 Y105.935 E.01658
G1 X137.065 Y124.065 E.79244
G1 X136.528 Y124.065 E.01657
G1 X118.935 Y106.472 E.76901
G1 X118.935 Y107.008 E.01658
G1 X135.992 Y124.065 E.74556
G1 X135.456 Y124.065 E.01658
G1 X118.935 Y107.544 E.72211
G1 X118.935 Y108.081 E.01658
G1 X134.919 Y124.065 E.69867
G1 X134.383 Y124.065 E.01658
G1 X118.935 Y108.617 E.67522
G1 X118.935 Y109.154 E.01658
G1 X133.846 Y124.065 E.65177
G1 X133.31 Y124.065 E.01658
G1 X118.935 Y109.69 E.62833
G1 X118.935 Y110.226 E.01658
G1 X132.774 Y124.065 E.60488
G1 X132.237 Y124.065 E.01658
G1 X118.935 Y110.763 E.58143
G1 X118.935 Y111.299 E.01658
G1 X131.701 Y124.065 E.55799
G1 X131.164 Y124.065 E.01658
G1 X118.935 Y111.836 E.53454
G1 X118.935 Y112.372 E.01658
G1 X130.628 Y124.065 E.51109
G1 X130.092 Y124.065 E.01658
G1 X118.935 Y112.909 E.48764
G1 X118.935 Y113.445 E.01658
G1 X129.555 Y124.065 E.4642
G1 X129.019 Y124.065 E.01658
G1 X118.935 Y113.981 E.44075
G1 X118.935 Y114.518 E.01658
G1 X128.482 Y124.065 E.4173
G1 X127.946 Y124.065 E.01658
G1 X118.935 Y115.054 E.39386
G1 X118.935 Y115.591 E.01658
G1 X127.409 Y124.065 E.37041
G1 X126.873 Y124.065 E.01658
G1 X118.935 Y116.127 E.34696
G1 X118.935 Y116.663 E.01658
G1 X126.337 Y124.065 E.32352
G1 X125.8 Y124.065 E.01658
G1 X118.935 Y117.2 E.30007
G1 X118.935 Y117.736 E.01658
G1 X125.264 Y124.065 E.27662
G1 X124.727 Y124.065 E.01658
G1 X118.935 Y118.273 E.25318
G1 X118.935 Y118.809 E.01658
G1 X124.191 Y124.065 E.22973
G1 X123.655 Y124.065 E.01658
G1 X118.935 Y119.345 E.20628
G1 X118.935 Y119.882 E.01658
G1 X123.118 Y124.065 E.18284
G1 X122.582 Y124.065 E.01658
G1 X118.935 Y120.418 E.15939
G1 X118.935 Y120.955 E.01658
G1 X122.045 Y124.065 E.13594
G1 X121.509 Y124.065 E.01658
G1 X118.935 Y121.491 E.11249
G1 X118.935 Y122.028 E.01658
G1 X120.973 Y124.065 E.08905
G1 X120.436 Y124.065 E.01658
G1 X118.935 Y122.564 E.0656
G1 X118.935 Y123.1 E.01658
G1 X119.9 Y124.065 E.04215
G1 X119.363 Y124.065 E.01658
G1 X118.766 Y123.467 E.02612
; WIPE_START
M204 S10000
G1 X119.363 Y124.065 E-.32117
G1 X119.9 Y124.065 E-.20384
G1 X119.462 Y123.627 E-.23499
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 47
M625
G17
G3 Z10.2 I-1.041 J.63 P1  F30000
G1 X190.026 Y240.229 Z10.2
G1 Z9.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X190.526 Y240.729  
G3  X188.173 Y242.723   I-4.711 J-3.174 E0.1187 F5400
G3  X185.480 Y241.512   I-0.168 J-3.226 E0.1166
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.662 Y219.122   I1.769 J-0.727 E0.0904
G1 E-0.8000 F1800
G1  X167.411 Y217.336   F600
G1 E0.8000 F1800
G3  X170.137 Y215.697   I2.971 J1.856 E0.1255 F5400
G3  X172.552 Y217.223   I-3.995 J8.998 E0.1090
G2  X177.526 Y217.729   I3.556 J-10.254 E0.1917
G1  X178.776  E0.0475
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.020 Y239.203   I-1.723 J0.730 E0.0834
G1  X190.526 Y240.729   E0.0812
; WIPE_TOWER_END
G1  X190.026 Y240.229
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.526  E0.8551
G1  Y229.479  E0.4086
G1  X190.026  E0.8551
G1  Y240.229  E0.4086
G1  X168.526 Y229.479  
;--------------------
; CP EMPTY GRID START
; layer #50
G1  Y240.229  E0.4086
G1  X175.359 
G1  Y229.479  E0.4086
G1  X182.193 
G1  Y240.229  E0.4086
G1  X189.026 
G1  Y229.479  E0.4086
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #49
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z10.2 I1.217 J0 P1  F5400
; filament end gcode 


M620 S1A
M204 S9000
G1 Z12.8 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T1
M73 E1
M620.1 E F523 T270


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S270

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.627742 F50
M73 P96 R3
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523
G1 E0.627742 F50
G1 E7.21903 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
G1 E9.91568 F523
G1 E1.10174 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300





; FLUSH_START
M400
M109 S245
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
M73 P96 R2
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
M73 P97 R2
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z12.8 F3000

M204 S10000


M621 S1A
M106 S51
M106 P2 S0
G1 X163.896 Y247.983 F30000
G1 Z9.8
G1 X159.798 Y247.983 Z10.2
G1 X159.798 Y218.229

; filament start gcode
M106 P3 S180


G1 X167.526 Y218.229
G1 Z9.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X170.526 Y218.229  E0.1140 F1782
G1 E-0.8000 F1800
G1  X166.026  F600
G1  X170.526  F240
G1 E0.8000 F1800
G1  X190.026  E0.7411 F1782
G1  Y218.979  E0.0285
G1  X167.526  E0.8551 F2025
G1  Y219.729  E0.0285
G1  X190.026  E0.8551 F2473
G1  Y220.479  E0.0285
G1  X167.526  E0.8551 F4725
G1  Y221.229  E0.0285
G1  X190.026  E0.8551 F4775
G1  Y221.979  E0.0285
G1  X167.526  E0.8551
G1  Y222.729  E0.0285
G1  X190.026  E0.8551
G1  Y223.479  E0.0285
G1  X167.526  E0.8551
G1  Y224.229  E0.0285
G1  X190.026  E0.8551
G1  Y224.979  E0.0285
G1  X167.526  E0.8551
G1  Y225.729  E0.0285
G1  X190.026  E0.8551
G1  Y226.479  E0.0285
G1  X167.526  E0.8551
G1  Y227.229  E0.0285
G1  X190.026  E0.8551
G1  Y227.979  E0.0285
G1  X167.526  E0.8551
G1  Y228.729  E0.0285
G1  X190.026  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15000
G1 X188.026 Y228.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.217 J0 P1  F30000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
M204 S10000
G1 X137.398 Y146.398
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X118.602 Y146.398 E.60441
G1 X118.602 Y127.602 E.60441
G1 X137.398 Y127.602 E.60441
G1 X137.398 Y146.338 E.60248
M204 S250
G1 X137.79 Y146.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 49 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer49 end: 47,58
M625
; WIPE_START
M204 S10000
G1 X135.79 Y146.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.394 Y139.128 Z10.2 F30000
G1 X137.234 Y128.533 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
G1 X136.637 Y127.935 E.02531
G1 X136.101 Y127.935 E.01607
G1 X137.065 Y128.899 E.04085
G1 X137.065 Y129.436 E.01607
G1 X135.564 Y127.935 E.06358
G1 X135.028 Y127.935 E.01607
G1 X137.065 Y129.972 E.08631
G1 X137.065 Y130.509 E.01607
G1 X134.491 Y127.935 E.10904
G1 X133.955 Y127.935 E.01607
G1 X137.065 Y131.045 E.13177
G1 X137.065 Y131.581 E.01607
G1 X133.419 Y127.935 E.15449
G1 X132.882 Y127.935 E.01607
G1 X137.065 Y132.118 E.17722
G1 X137.065 Y132.654 E.01607
G1 X132.346 Y127.935 E.19995
G1 X131.809 Y127.935 E.01607
G1 X137.065 Y133.191 E.22268
G1 X137.065 Y133.727 E.01607
G1 X131.273 Y127.935 E.24541
G1 X130.737 Y127.935 E.01607
G1 X137.065 Y134.263 E.26814
G1 X137.065 Y134.8 E.01607
G1 X130.2 Y127.935 E.29087
G1 X129.664 Y127.935 E.01607
G1 X137.065 Y135.336 E.3136
G1 X137.065 Y135.873 E.01607
G1 X129.127 Y127.935 E.33633
G1 X128.591 Y127.935 E.01607
G1 X137.065 Y136.409 E.35906
G1 X137.065 Y136.946 E.01607
G1 X128.054 Y127.935 E.38179
G1 X127.518 Y127.935 E.01607
G1 X137.065 Y137.482 E.40452
G1 X137.065 Y138.018 E.01607
G1 X126.982 Y127.935 E.42724
G1 X126.445 Y127.935 E.01607
G1 X137.065 Y138.555 E.44997
G1 X137.065 Y139.091 E.01607
G1 X125.909 Y127.935 E.4727
G1 X125.372 Y127.935 E.01607
G1 X137.065 Y139.628 E.49543
G1 X137.065 Y140.164 E.01607
G1 X124.836 Y127.935 E.51816
G1 X124.3 Y127.935 E.01607
G1 X137.065 Y140.7 E.54089
G1 X137.065 Y141.237 E.01607
G1 X123.763 Y127.935 E.56362
G1 X123.227 Y127.935 E.01607
G1 X137.065 Y141.773 E.58635
G1 X137.065 Y142.31 E.01607
G1 X122.69 Y127.935 E.60908
G1 X122.154 Y127.935 E.01607
G1 X137.065 Y142.846 E.63181
G1 X137.065 Y143.382 E.01607
G1 X121.618 Y127.935 E.65454
G1 X121.081 Y127.935 E.01607
G1 X137.065 Y143.919 E.67727
G1 X137.065 Y144.455 E.01607
G1 X120.545 Y127.935 E.69999
G1 X120.008 Y127.935 E.01607
G1 X137.065 Y144.992 E.72272
G1 X137.065 Y145.528 E.01607
G1 X119.472 Y127.935 E.74545
G1 X118.936 Y127.935 E.01607
G1 X137.065 Y146.065 E.76819
G1 X136.528 Y146.065 E.01607
G1 X118.935 Y128.472 E.74547
G1 X118.935 Y129.008 E.01607
G1 X135.992 Y146.065 E.72274
G1 X135.456 Y146.065 E.01607
G1 X118.935 Y129.544 E.70001
G1 X118.935 Y130.081 E.01607
G1 X134.919 Y146.065 E.67728
G1 X134.383 Y146.065 E.01607
G1 X118.935 Y130.617 E.65455
G1 X118.935 Y131.154 E.01607
G1 X133.846 Y146.065 E.63182
G1 X133.31 Y146.065 E.01607
G1 X118.935 Y131.69 E.60909
G1 X118.935 Y132.226 E.01607
G1 X132.774 Y146.065 E.58636
G1 X132.237 Y146.065 E.01607
G1 X118.935 Y132.763 E.56363
G1 X118.935 Y133.299 E.01607
G1 X131.701 Y146.065 E.5409
G1 X131.164 Y146.065 E.01607
G1 X118.935 Y133.836 E.51818
G1 X118.935 Y134.372 E.01607
G1 X130.628 Y146.065 E.49545
G1 X130.092 Y146.065 E.01607
G1 X118.935 Y134.908 E.47272
G1 X118.935 Y135.445 E.01607
G1 X129.555 Y146.065 E.44999
G1 X129.019 Y146.065 E.01607
G1 X118.935 Y135.981 E.42726
G1 X118.935 Y136.518 E.01607
G1 X128.482 Y146.065 E.40453
G1 X127.946 Y146.065 E.01607
G1 X118.935 Y137.054 E.3818
G1 X118.935 Y137.591 E.01607
G1 X127.409 Y146.065 E.35907
G1 X126.873 Y146.065 E.01607
G1 X118.935 Y138.127 E.33634
G1 X118.935 Y138.663 E.01607
G1 X126.337 Y146.065 E.31361
G1 X125.8 Y146.065 E.01607
G1 X118.935 Y139.2 E.29088
G1 X118.935 Y139.736 E.01607
G1 X125.264 Y146.065 E.26815
G1 X124.727 Y146.065 E.01607
G1 X118.935 Y140.273 E.24543
G1 X118.935 Y140.809 E.01607
G1 X124.191 Y146.065 E.2227
G1 X123.655 Y146.065 E.01607
G1 X118.935 Y141.345 E.19997
G1 X118.935 Y141.882 E.01607
G1 X123.118 Y146.065 E.17724
G1 X122.582 Y146.065 E.01607
G1 X118.935 Y142.418 E.15451
G1 X118.935 Y142.955 E.01607
G1 X122.045 Y146.065 E.13178
G1 X121.509 Y146.065 E.01607
G1 X118.935 Y143.491 E.10905
G1 X118.935 Y144.027 E.01607
G1 X120.973 Y146.065 E.08632
G1 X120.436 Y146.065 E.01607
G1 X118.935 Y144.564 E.06359
G1 X118.935 Y145.1 E.01607
G1 X119.9 Y146.065 E.04086
G1 X119.363 Y146.065 E.01607
G1 X118.766 Y145.467 E.02532
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.363 Y146.065 E-.32117
G1 X119.9 Y146.065 E-.20384
G1 X119.462 Y145.627 E-.23499
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 50/50
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AgAAAAAAAAA=
G17
G3 Z10.2 I-.077 J1.215 P1  F30000
G1 X137.79 Y146.79 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G1 X118.21 Y146.79 E.58322
G1 X118.21 Y127.21 E.58322
G1 X137.79 Y127.21 E.58322
G1 X137.79 Y146.73 E.58143
; object ids of layer 50 start: 47,58
M624 AwAAAAAAAAA=
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; object ids of this layer50 end: 47,58
M625
M204 S10000
G1 X137.583 Y145.815 F30000
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X136.815 Y146.583 E.03235
G1 X136.281 Y146.583
G1 X137.583 Y145.281 E.05481
G1 X137.583 Y144.748
G1 X135.748 Y146.583 E.07728
G1 X135.215 Y146.583
G1 X137.583 Y144.215 E.09974
G1 X137.583 Y143.682
G1 X134.682 Y146.583 E.1222
G1 X134.148 Y146.583
G1 X137.583 Y143.148 E.14467
G1 X137.583 Y142.615
G1 X133.615 Y146.583 E.16713
G1 X133.082 Y146.583
G1 X137.583 Y142.082 E.18959
G1 X137.583 Y141.549
G1 X132.549 Y146.583 E.21206
G1 X132.015 Y146.583
G1 X137.583 Y141.015 E.23452
G1 X137.583 Y140.482
G1 X131.482 Y146.583 E.25698
G1 X130.949 Y146.583
G1 X137.583 Y139.949 E.27945
G1 X137.583 Y139.416
G1 X130.416 Y146.583 E.30191
G1 X129.882 Y146.583
G1 X137.583 Y138.882 E.32437
G1 X137.583 Y138.349
G1 X129.349 Y146.583 E.34684
G1 X128.816 Y146.583
G1 X137.583 Y137.816 E.3693
G1 X137.583 Y137.283
G1 X128.283 Y146.583 E.39176
G1 X127.749 Y146.583
G1 X137.583 Y136.749 E.41422
G1 X137.583 Y136.216
G1 X127.216 Y146.583 E.43669
G1 X126.683 Y146.583
G1 X137.583 Y135.683 E.45915
G1 X137.583 Y135.15
G1 X126.15 Y146.583 E.48161
G1 X125.616 Y146.583
G1 X137.583 Y134.616 E.50408
G1 X137.583 Y134.083
G1 X125.083 Y146.583 E.52654
G1 X124.55 Y146.583
G1 X137.583 Y133.55 E.549
G1 X137.583 Y133.016
G1 X124.017 Y146.583 E.57147
G1 X123.483 Y146.583
G1 X137.583 Y132.483 E.59393
G1 X137.583 Y131.95
G1 X122.95 Y146.583 E.61639
G1 X122.417 Y146.583
G1 X137.583 Y131.417 E.63886
G1 X137.583 Y130.883
G1 X121.883 Y146.583 E.66132
G1 X121.35 Y146.583
G1 X137.583 Y130.35 E.68378
G1 X137.583 Y129.817
G1 X120.817 Y146.583 E.70625
G1 X120.284 Y146.583
G1 X137.583 Y129.284 E.72871
G1 X137.583 Y128.75
G1 X119.75 Y146.583 E.75117
G1 X119.217 Y146.583
G1 X137.583 Y128.217 E.77364
G1 X137.583 Y127.684
G1 X118.684 Y146.583 E.7961
G1 X118.417 Y146.316
G1 X137.316 Y127.417 E.79609
G1 X136.783 Y127.417
G1 X118.417 Y145.783 E.77363
G1 X118.417 Y145.249
G1 X136.249 Y127.417 E.75117
G1 X135.716 Y127.417
G1 X118.417 Y144.716 E.7287
G1 X118.417 Y144.183
G1 X135.183 Y127.417 E.70624
G1 X134.65 Y127.417
G1 X118.417 Y143.65 E.68378
G1 X118.417 Y143.116
G1 X134.116 Y127.417 E.66131
G1 X133.583 Y127.417
G1 X118.417 Y142.583 E.63885
G1 X118.417 Y142.05
G1 X133.05 Y127.417 E.61639
G1 X132.517 Y127.417
G1 X118.417 Y141.517 E.59392
G1 X118.417 Y140.983
G1 X131.983 Y127.417 E.57146
G1 X131.45 Y127.417
G1 X118.417 Y140.45 E.549
G1 X118.417 Y139.917
G1 X130.917 Y127.417 E.52653
G1 X130.384 Y127.417
G1 X118.417 Y139.384 E.50407
G1 X118.417 Y138.85
G1 X129.85 Y127.417 E.48161
G1 X129.317 Y127.417
G1 X118.417 Y138.317 E.45914
G1 X118.417 Y137.784
G1 X128.784 Y127.417 E.43668
G1 X128.251 Y127.417
G1 X118.417 Y137.251 E.41422
G1 X118.417 Y136.717
G1 X127.717 Y127.417 E.39175
G1 X127.184 Y127.417
G1 X118.417 Y136.184 E.36929
G1 X118.417 Y135.651
G1 X126.651 Y127.417 E.34683
G1 X126.118 Y127.417
G1 X118.417 Y135.117 E.32437
G1 X118.417 Y134.584
G1 X125.584 Y127.417 E.3019
G1 X125.051 Y127.417
G1 X118.417 Y134.051 E.27944
G1 X118.417 Y133.518
G1 X124.518 Y127.417 E.25698
G1 X123.984 Y127.417
G1 X118.417 Y132.984 E.23451
G1 X118.417 Y132.451
G1 X123.451 Y127.417 E.21205
G1 X122.918 Y127.417
G1 X118.417 Y131.918 E.18959
G1 X118.417 Y131.385
G1 X122.385 Y127.417 E.16712
G1 X121.851 Y127.417
G1 X118.417 Y130.851 E.14466
G1 X118.417 Y130.318
G1 X121.318 Y127.417 E.1222
G1 X120.785 Y127.417
G1 X118.417 Y129.785 E.09973
G1 X118.417 Y129.252
G1 X120.252 Y127.417 E.07727
G1 X119.718 Y127.417
G1 X118.417 Y128.718 E.05481
G1 X118.417 Y128.185
G1 X119.185 Y127.417 E.03234
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #50
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
G1 F5400
M204 S10000
G1 X118.417 Y128.185 E-1.03153
G1 X118.417 Y128.718 E-.5066
G1 X118.687 Y128.449 E-.36188
; WIPE_END
G1 E-.1 F1800
G17
G3 Z10.4 I1.217 J0 P1  F5400
; stop printing object, unique label id: 58
M625
; filament end gcode 


M620 S0A
M204 S9000
G1 Z13 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S245

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T270
T0
M73 E0
M620.1 E F523 T240


M400

G92 E0

; FLUSH_START
; always use highest temperature to flush
M400
M109 S240

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.565379 F50
M73 P98 R1
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523
G1 E0.565379 F50
G1 E6.50186 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
M73 P98 R0
G1 E1.03938 F50
M73 P99 R0
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
G1 E9.35441 F523
G1 E1.03938 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z13 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X181.389 Y247.983 F30000
G1 Z10
G1 X189.022 Y247.983 Z10.4
G1 X197.753 Y247.983 Z10.4
G1 X197.753 Y239.979

; filament start gcode
M106 P3 S150

M142 P1 R35 S40
G1 X190.026 Y239.979
G1 Z10
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
M204 S10000
G1  X187.026 Y239.979  E0.1140 F1782
G1 E-0.8000 F1800
G1  X191.526  F600
G1  X187.026  F240
G1 E0.8000 F1800
G1  X167.526  E0.7411 F1782
G1  Y239.229  E0.0285
G1  X190.026  E0.8551 F2025
G1  Y238.479  E0.0285
G1  X167.526  E0.8551 F2473
G1  Y237.729  E0.0285
G1  X190.026  E0.8551 F4725
G1  Y236.979  E0.0285
G1  X167.526  E0.8551 F4775
G1  Y236.229  E0.0285
G1  X190.026  E0.8551
G1  Y235.479  E0.0285
G1  X167.526  E0.8551
G1  Y234.729  E0.0285
G1  X190.026  E0.8551
G1  Y233.979  E0.0285
G1  X167.526  E0.8551
G1  Y233.229  E0.0285
G1  X190.026  E0.8551
G1  Y232.479  E0.0285
G1  X167.526  E0.8551
G1  Y231.729  E0.0285
G1  X190.026  E0.8551
G1  Y230.979  E0.0285
G1  X167.526  E0.8551
G1  Y230.229  E0.0285
G1  X190.026  E0.8551
G1  Y229.479  E0.0285
G1  X167.526  E0.8551
; WIPE_TOWER_END
M220 R
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y240.229   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X167.026 Y240.729  
G3  X165.085 Y238.456   I3.765 J-5.179 E0.1147
G3  X166.259 Y235.760   I2.984 J-0.304 E0.1168
G2  X167.026 Y233.268   I-3.685 J-2.498 E0.1006
G2  X167.012 Y224.838   I-91.094 J-4.063 E0.3205
G2  X165.150 Y221.291   I-7.235 J1.537 E0.1542
G3  X165.532 Y219.255   I1.723 J-0.730 E0.0834
G3  X168.693 Y216.060   I19.102 J15.735 E0.1710
G3  X171.920 Y216.842   I1.168 J2.231 E0.1378
G2  X174.691 Y217.729   I2.794 J-3.956 E0.1123
G1  X178.776  E0.1553
G1  X180.026  E0.0475
G2  X185.163 Y217.137   I1.418 J-10.282 E0.1986
G3  X187.415 Y215.697   I4.973 J5.297 E0.1022
G3  X189.089 Y216.261   I0.266 J1.979 E0.0696
G1  X190.526 Y217.729   E0.0781
G3  X192.467 Y220.002   I-3.764 J5.179 E0.1147
G3  X191.293 Y222.698   I-2.984 J0.304 E0.1168
G2  X190.526 Y225.190   I3.685 J2.498 E0.1006
G2  X190.540 Y233.620   I91.094 J4.063 E0.3205
G2  X192.402 Y237.167   I7.235 J-1.537 E0.1542
G3  X192.129 Y239.080   I-1.752 J0.726 E0.0771
G1 E-0.8000 F1800
G1  X190.386 Y240.872   F600
G1 E0.8000 F1800
G3  X187.872 Y242.774   I-3.834 J-2.456 E0.1223 F5400
G3  X185.480 Y241.512   I0.313 J-3.491 E0.1055
G2  X182.861 Y240.729   I-2.625 J4.009 E0.1053
G2  X174.322 Y240.743   I-4.111 J94.871 E0.3247
G2  X170.579 Y242.641   I1.642 J7.878 E0.1614
G3  X168.463 Y242.197   I-0.724 J-1.815 E0.0871
G1  X167.026 Y240.729   E0.0781
; WIPE_TOWER_END

; WIPE_START
G1 X167.026 Y240.729 E-.00001
G1 X167.026 Y240.729 E0
G1 X168.425 Y242.158 E-.75999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.217 J0 P1  F30000
; OBJECT_ID: 47
; start printing object, unique label id: 47
M624 AQAAAAAAAAA=
M204 S10000
G1 X137.79 Y124.79
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G1 X118.21 Y124.79 E.60164
G1 X118.21 Y105.21 E.60164
G1 X137.79 Y105.21 E.60164
G1 X137.79 Y124.73 E.5998
M204 S10000
G1 X137.583 Y123.815 F30000
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X136.815 Y124.583 E.03337
G1 X136.281 Y124.583
G1 X137.583 Y123.281 E.05654
G1 X137.583 Y122.748
G1 X135.748 Y124.583 E.07972
G1 X135.215 Y124.583
G1 X137.583 Y122.215 E.10289
G1 X137.583 Y121.682
G1 X134.682 Y124.583 E.12606
G1 X134.148 Y124.583
G1 X137.583 Y121.148 E.14923
G1 X137.583 Y120.615
G1 X133.615 Y124.583 E.17241
G1 X133.082 Y124.583
G1 X137.583 Y120.082 E.19558
G1 X137.583 Y119.549
G1 X132.549 Y124.583 E.21875
G1 X132.015 Y124.583
G1 X137.583 Y119.015 E.24193
G1 X137.583 Y118.482
G1 X131.482 Y124.583 E.2651
G1 X130.949 Y124.583
G1 X137.583 Y117.949 E.28827
G1 X137.583 Y117.416
G1 X130.416 Y124.583 E.31144
G1 X129.882 Y124.583
G1 X137.583 Y116.882 E.33462
G1 X137.583 Y116.349
G1 X129.349 Y124.583 E.35779
G1 X128.816 Y124.583
G1 X137.583 Y115.816 E.38096
G1 X137.583 Y115.283
G1 X128.283 Y124.583 E.40413
G1 X127.749 Y124.583
G1 X137.583 Y114.749 E.42731
G1 X137.583 Y114.216
G1 X127.216 Y124.583 E.45048
G1 X126.683 Y124.583
G1 X137.583 Y113.683 E.47365
G1 X137.583 Y113.15
G1 X126.15 Y124.583 E.49682
G1 X125.616 Y124.583
G1 X137.583 Y112.616 E.52
G1 X137.583 Y112.083
G1 X125.083 Y124.583 E.54317
G1 X124.55 Y124.583
G1 X137.583 Y111.55 E.56634
G1 X137.583 Y111.017
G1 X124.017 Y124.583 E.58951
G1 X123.483 Y124.583
G1 X137.583 Y110.483 E.61269
G1 X137.583 Y109.95
G1 X122.95 Y124.583 E.63586
G1 X122.417 Y124.583
G1 X137.583 Y109.417 E.65903
G1 X137.583 Y108.884
G1 X121.883 Y124.583 E.6822
G1 X121.35 Y124.583
G1 X137.583 Y108.35 E.70538
G1 X137.583 Y107.817
G1 X120.817 Y124.583 E.72855
G1 X120.284 Y124.583
G1 X137.583 Y107.284 E.75172
G1 X137.583 Y106.75
G1 X119.75 Y124.583 E.77489
G1 X119.217 Y124.583
G1 X137.583 Y106.217 E.79807
G1 X137.583 Y105.684
G1 X118.684 Y124.583 E.82124
G1 X118.417 Y124.316
G1 X137.316 Y105.417 E.82123
G1 X136.783 Y105.417
G1 X118.417 Y123.783 E.79806
G1 X118.417 Y123.249
G1 X136.249 Y105.417 E.77489
G1 X135.716 Y105.417
G1 X118.417 Y122.716 E.75172
G1 X118.417 Y122.183
G1 X135.183 Y105.417 E.72854
G1 X134.65 Y105.417
G1 X118.417 Y121.65 E.70537
G1 X118.417 Y121.116
G1 X134.116 Y105.417 E.6822
G1 X133.583 Y105.417
G1 X118.417 Y120.583 E.65902
G1 X118.417 Y120.05
G1 X133.05 Y105.417 E.63585
G1 X132.517 Y105.417
G1 X118.417 Y119.517 E.61268
G1 X118.417 Y118.983
G1 X131.983 Y105.417 E.58951
G1 X131.45 Y105.417
G1 X118.417 Y118.45 E.56633
G1 X118.417 Y117.917
G1 X130.917 Y105.417 E.54316
G1 X130.384 Y105.417
G1 X118.417 Y117.384 E.51999
G1 X118.417 Y116.85
G1 X129.85 Y105.417 E.49682
G1 X129.317 Y105.417
G1 X118.417 Y116.317 E.47364
G1 X118.417 Y115.784
G1 X128.784 Y105.417 E.45047
G1 X128.251 Y105.417
G1 X118.417 Y115.251 E.4273
G1 X118.417 Y114.717
G1 X127.717 Y105.417 E.40413
G1 X127.184 Y105.417
G1 X118.417 Y114.184 E.38095
G1 X118.417 Y113.651
G1 X126.651 Y105.417 E.35778
G1 X126.118 Y105.417
G1 X118.417 Y113.118 E.33461
G1 X118.417 Y112.584
G1 X125.584 Y105.417 E.31144
G1 X125.051 Y105.417
G1 X118.417 Y112.051 E.28826
G1 X118.417 Y111.518
G1 X124.518 Y105.417 E.26509
G1 X123.984 Y105.417
G1 X118.417 Y110.985 E.24192
G1 X118.417 Y110.451
G1 X123.451 Y105.417 E.21875
G1 X122.918 Y105.417
G1 X118.417 Y109.918 E.19557
G1 X118.417 Y109.385
G1 X122.385 Y105.417 E.1724
G1 X121.851 Y105.417
G1 X118.417 Y108.851 E.14923
G1 X118.417 Y108.318
G1 X121.318 Y105.417 E.12605
G1 X120.785 Y105.417
G1 X118.417 Y107.785 E.10288
G1 X118.417 Y107.252
G1 X120.252 Y105.417 E.07971
G1 X119.718 Y105.417
G1 X118.417 Y106.718 E.05654
G1 X118.417 Y106.185
G1 X119.185 Y105.417 E.03336
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
M204 S10000
G1 X118.417 Y106.185 E-.41261
G1 X118.417 Y106.718 E-.20264
G1 X118.687 Y106.449 E-.14475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.217 J0 P1  F30000
; stop printing object, unique label id: 47
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z10.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z110 F600
    G1 Z108

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

