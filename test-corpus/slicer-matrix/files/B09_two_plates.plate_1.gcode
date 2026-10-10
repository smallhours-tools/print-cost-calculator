; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 14m 47s; total estimated time: 15m 7s
; total layer number: 180
; total filament length [mm] : 1070.50
; total filament volume [cm^3] : 2574.86
; total filament weight [g] : 3.24
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 36.00
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
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
; chamber_temperatures = 0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
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
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
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
; enable_prime_tower = 0
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
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
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; farthest_point_timelapse = 1
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 5
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_cooling_before_tower = 0
; filament_cost = 19.99
; filament_density = 1.26
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFA00
; filament_is_mixed = 0
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PLA Basic @BBL X1C (flat)"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filament_volume_map = 0
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
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
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
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
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
; long_retractions_when_ec = 0
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
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
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
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
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
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
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
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 4
; slow_down_min_speed = 20
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
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
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
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
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
; volumetric_speed_coefficients = "0 0 0 0 0 0"
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
; wipe_tower_x = 15
; wipe_tower_y = 220
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
M73 P0 R15
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
M73 P1 R14
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
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/180
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 58
G1 X124.857 Y133.857 F30000
M204 S6000
M73 P2 R14
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F2242
M204 S500
G1 X131.143 Y133.857 E.23413
G1 X131.143 Y140.143 E.23413
G1 X124.857 Y140.143 E.23413
G1 X124.857 Y133.917 E.23189
M204 S6000
G1 X124.4 Y133.4 F30000
; FEATURE: Outer wall
G1 F2242
M204 S500
G1 X131.6 Y133.4 E.26817
G1 X131.6 Y140.6 E.26817
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.4 Y140.6 E.26817
G1 X124.4 Y133.46 E.26594
; WIPE_START
G1 F3000
G1 X126.4 Y133.443 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.011 Y134.04 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51164
G1 F2242
M204 S500
G1 X130.754 Y134.783 E.04013
G1 X130.754 Y135.446 E.02532
G1 X129.554 Y134.246 E.06483
G1 X128.891 Y134.246 E.02532
G1 X130.754 Y136.109 E.10063
G1 X130.754 Y136.771 E.02532
G1 X128.229 Y134.246 E.13644
G1 X127.566 Y134.246 E.02532
G1 X130.754 Y137.434 E.17224
G1 X130.754 Y138.097 E.02532
G1 X126.903 Y134.246 E.20805
G1 X126.24 Y134.246 E.02532
G1 X130.754 Y138.76 E.24385
G1 X130.754 Y139.423 E.02532
G1 X125.577 Y134.246 E.27966
G1 X125.246 Y134.246 E.01266
G1 X125.246 Y134.577 E.01266
G1 X130.423 Y139.754 E.27966
G1 X129.76 Y139.754 E.02532
G1 X125.246 Y135.24 E.24386
G1 X125.246 Y135.903 E.02532
G1 X129.097 Y139.754 E.20805
G1 X128.434 Y139.754 E.02532
G1 X125.246 Y136.566 E.17225
G1 X125.246 Y137.228 E.02532
G1 X127.772 Y139.754 E.13644
G1 X127.109 Y139.754 E.02532
G1 X125.246 Y137.891 E.10063
G1 X125.246 Y138.554 E.02532
G1 X126.446 Y139.754 E.06483
G1 X125.783 Y139.754 E.02532
G1 X125.04 Y139.011 E.04013
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X125.783 Y139.754 E-.39929
G1 X126.446 Y139.754 E-.25189
G1 X126.243 Y139.552 E-.10882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/180
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
; OBJECT_ID: 58
M204 S10000
G17
G3 Z.6 I1.173 J-.324 P1  F30000
G1 X124.602 Y133.602 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2611
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2611
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.766 Y134.541 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42631
G1 F2611
G1 X125.372 Y133.935 E.02677
G1 X125.914 Y133.935 E.01694
G1 X124.935 Y134.914 E.04323
G1 X124.935 Y135.456 E.01694
G1 X126.456 Y133.935 E.06719
G1 X126.998 Y133.935 E.01694
G1 X124.935 Y135.998 E.09114
G1 X124.935 Y136.54 E.01694
G1 X127.54 Y133.935 E.1151
G1 X128.083 Y133.935 E.01694
G1 X124.935 Y137.083 E.13905
G1 X124.935 Y137.625 E.01694
G1 X128.625 Y133.935 E.16301
G1 X129.167 Y133.935 E.01694
G1 X124.935 Y138.167 E.18696
M73 P3 R14
G1 X124.935 Y138.709 E.01694
G1 X129.709 Y133.935 E.21092
G1 X130.251 Y133.935 E.01694
G1 X124.935 Y139.251 E.23487
G1 X124.935 Y139.794 E.01694
G1 X130.794 Y133.935 E.25883
G1 X131.065 Y133.935 E.00847
G1 X131.065 Y134.206 E.00847
G1 X125.206 Y140.065 E.25883
G1 X125.749 Y140.065 E.01694
G1 X131.065 Y134.749 E.23487
G1 X131.065 Y135.291 E.01694
G1 X126.291 Y140.065 E.21092
G1 X126.833 Y140.065 E.01694
G1 X131.065 Y135.833 E.18696
G1 X131.065 Y136.375 E.01694
G1 X127.375 Y140.065 E.16301
G1 X127.917 Y140.065 E.01694
G1 X131.065 Y136.917 E.13905
G1 X131.065 Y137.46 E.01694
G1 X128.46 Y140.065 E.1151
G1 X129.002 Y140.065 E.01694
G1 X131.065 Y138.002 E.09114
G1 X131.065 Y138.544 E.01694
G1 X129.544 Y140.065 E.06719
G1 X130.086 Y140.065 E.01694
G1 X131.065 Y139.086 E.04323
G1 X131.065 Y139.628 E.01694
G1 X130.459 Y140.234 E.02677
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X131.065 Y139.628 E-.32565
G1 X131.065 Y139.086 E-.20604
G1 X130.64 Y139.511 E-.22831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/180
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z.8 I.851 J-.87 P1  F30000
G1 X124.602 Y133.602 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2613
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2613
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.541 Y140.234 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42631
G1 F2613
G1 X124.935 Y139.628 E.02677
G1 X124.935 Y139.086 E.01694
G1 X125.914 Y140.065 E.04323
G1 X126.456 Y140.065 E.01694
G1 X124.935 Y138.544 E.06719
G1 X124.935 Y138.002 E.01694
G1 X126.998 Y140.065 E.09114
G1 X127.54 Y140.065 E.01694
G1 X124.935 Y137.46 E.1151
G1 X124.935 Y136.917 E.01694
G1 X128.083 Y140.065 E.13905
G1 X128.625 Y140.065 E.01694
G1 X124.935 Y136.375 E.16301
G1 X124.935 Y135.833 E.01694
G1 X129.167 Y140.065 E.18696
G1 X129.709 Y140.065 E.01694
G1 X124.935 Y135.291 E.21092
G1 X124.935 Y134.749 E.01694
G1 X130.251 Y140.065 E.23487
G1 X130.794 Y140.065 E.01694
G1 X124.935 Y134.206 E.25883
G1 X124.935 Y133.935 E.00847
G1 X125.206 Y133.935 E.00847
G1 X131.065 Y139.794 E.25883
G1 X131.065 Y139.251 E.01694
G1 X125.749 Y133.935 E.23487
G1 X126.291 Y133.935 E.01694
G1 X131.065 Y138.709 E.21092
G1 X131.065 Y138.167 E.01694
G1 X126.833 Y133.935 E.18696
G1 X127.375 Y133.935 E.01694
G1 X131.065 Y137.625 E.16301
G1 X131.065 Y137.083 E.01694
G1 X127.917 Y133.935 E.13905
G1 X128.46 Y133.935 E.01694
G1 X131.065 Y136.54 E.1151
G1 X131.065 Y135.998 E.01694
G1 X129.002 Y133.935 E.09114
G1 X129.544 Y133.935 E.01694
G1 X131.065 Y135.456 E.06719
G1 X131.065 Y134.914 E.01694
G1 X130.086 Y133.935 E.04323
G1 X130.628 Y133.935 E.01694
G1 X131.234 Y134.541 E.02677
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X130.628 Y133.935 E-.32565
G1 X130.086 Y133.935 E-.20604
G1 X130.511 Y134.36 E-.22831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/180
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z1 I.155 J-1.207 P1  F30000
G1 X124.602 Y133.602 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P4 R14
G1 E-.04 F1800
G1 X131.05 Y135.579 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/180
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z1.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/180
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z1.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
M73 P5 R14
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/180
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z1.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/180
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z1.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
M73 P6 R14
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/180
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/180
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z2.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/180
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z2.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
M73 P7 R14
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/180
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z2.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
M73 P7 R13
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/180
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z2.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
M73 P8 R13
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/180
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z3 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/180
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z3.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
M73 P9 R13
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/180
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z3.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/180
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z3.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P10 R13
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/180
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z3.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/180
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P11 R13
G1 E-.04 F1800
G1 X126.579 Y133.95 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/180
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z4.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/180
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z4.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
M73 P12 R13
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/180
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z4.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/180
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z4.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
M73 P13 R13
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/180
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z5 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/180
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z5.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/180
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z5.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P14 R13
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
M73 P14 R12
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/180
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z5.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/180
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z5.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
M73 P15 R12
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/180
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/180
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z6.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
M73 P16 R12
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/180
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z6.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/180
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z6.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P17 R12
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/180
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z6.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/180
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z7 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P18 R12
G1 E-.04 F1800
G1 X131.05 Y135.579 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/180
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z7.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/180
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z7.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
M73 P19 R12
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/180
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z7.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/180
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z7.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z8 F30000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
M73 P20 R12
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/180
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/180
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z8.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P20 R11
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/180
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z8.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P21 R11
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/180
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z8.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/180
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z8.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P22 R11
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/180
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z9 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/180
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z9.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
M73 P23 R11
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/180
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z9.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z9.6 F30000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/180
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z9.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P24 R11
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/180
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z9.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z10 F30000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/180
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z10 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P25 R11
G1 E-.04 F1800
G1 X126.579 Y133.95 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/180
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z10.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z10.4 F30000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/180
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z10.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z10.6 F30000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
M73 P26 R11
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/180
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z10.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z10.8 F30000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/180
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z10.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
M73 P27 R11
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/180
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z11 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P27 R10
G1 E-.04 F1800
G1 X131.05 Y135.579 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/180
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z11.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/180
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z11.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P28 R10
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/180
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z11.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/180
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z11.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P29 R10
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z12 F30000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/180
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z12 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z12.2 F30000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/180
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z12.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
M73 P30 R10
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z12.4 F30000
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/180
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z12.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z12.6 F30000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/180
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z12.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P31 R10
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z12.8 F30000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/180
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z12.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z13 F30000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/180
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z13 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P32 R10
G1 E-.04 F1800
G1 X131.05 Y135.579 Z13.2 F30000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/180
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z13.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z13.4 F30000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/180
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z13.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z13.6 F30000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
M73 P33 R10
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/180
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z13.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z13.8 F30000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/180
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z13.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z14 F30000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P33 R9
G1 F15476.087
M73 P34 R9
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/180
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z14 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z14.2 F30000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/180
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z14.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z14.4 F30000
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/180
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z14.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P35 R9
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z14.6 F30000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/180
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z14.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z14.8 F30000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/180
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z14.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P36 R9
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z15 F30000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/180
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z15 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z15.2 F30000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/180
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z15.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
M73 P37 R9
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/180
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z15.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z15.6 F30000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/180
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z15.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P38 R9
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z15.8 F30000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/180
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z15.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z16 F30000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/180
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z16 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P39 R9
G1 E-.04 F1800
G1 X126.579 Y133.95 Z16.2 F30000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/180
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z16.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z16.4 F30000
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/180
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z16.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z16.6 F30000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
M73 P40 R9
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/180
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z16.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z16.8 F30000
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
M73 P40 R8
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/180
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z16.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z17 F30000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
M73 P41 R8
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/180
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z17 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z17.2 F30000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/180
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z17.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/180
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z17.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P42 R8
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z17.6 F30000
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/180
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z17.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z17.8 F30000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/180
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z17.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P43 R8
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z18 F30000
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/180
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z18 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z18.2 F30000
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/180
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z18.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
M73 P44 R8
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z18.4 F30000
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/180
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z18.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z18.6 F30000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/180
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z18.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P45 R8
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z18.8 F30000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/180
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z18.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z19 F30000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/180
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z19 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P46 R8
G1 E-.04 F1800
G1 X131.05 Y135.579 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/180
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z19.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z19.4 F30000
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/180
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z19.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z19.6 F30000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
M73 P47 R8
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/180
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z19.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
M73 P47 R7
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z19.8 F30000
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/180
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z19.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z20 F30000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
M73 P48 R7
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/180
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z20 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z20.2 F30000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/180
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z20.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z20.4 F30000
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/180
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z20.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P49 R7
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z20.6 F30000
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/180
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z20.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z20.8 F30000
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/180
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z20.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P50 R7
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z21 F30000
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/180
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z21 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z21.2 F30000
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/180
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z21.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
M73 P51 R7
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z21.4 F30000
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/180
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z21.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z21.6 F30000
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/180
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z21.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
M73 P52 R7
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z21.8 F30000
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/180
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z21.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z22 F30000
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/180
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z22 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P53 R7
G1 E-.04 F1800
G1 X126.579 Y133.95 Z22.2 F30000
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/180
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z22.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z22.4 F30000
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/180
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z22.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
M73 P53 R6
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z22.6 F30000
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
M73 P54 R6
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/180
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z22.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z22.8 F30000
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/180
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z22.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z23 F30000
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
M73 P55 R6
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/180
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z23 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z23.2 F30000
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/180
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z23.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z23.4 F30000
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/180
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z23.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P56 R6
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z23.6 F30000
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/180
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z23.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z23.8 F30000
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/180
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z23.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P57 R6
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z24 F30000
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/180
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z24 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z24.2 F30000
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/180
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z24.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
M73 P58 R6
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z24.4 F30000
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/180
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z24.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z24.6 F30000
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/180
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z24.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
M73 P59 R6
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z24.8 F30000
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/180
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z24.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z25 F30000
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/180
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z25 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P60 R6
G1 E-.04 F1800
G1 X131.05 Y135.579 Z25.2 F30000
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/180
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z25.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
M73 P60 R5
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z25.4 F30000
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/180
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z25.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z25.6 F30000
G1 Z25.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
M73 P61 R5
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/180
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z25.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z25.8 F30000
G1 Z25.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/180
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z25.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z26 F30000
G1 Z25.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
M73 P62 R5
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/180
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z26 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z26.2 F30000
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/180
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z26.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z26.4 F30000
G1 Z26
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/180
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z26.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P63 R5
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z26.6 F30000
G1 Z26.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/180
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z26.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z26.8 F30000
G1 Z26.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/180
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z26.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P64 R5
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z27 F30000
G1 Z26.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/180
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z27 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/180
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z27.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
M73 P65 R5
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z27.4 F30000
G1 Z27
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/180
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z27.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z27.4
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z27.6 F30000
G1 Z27.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/180
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z27.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z27.6
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
M73 P66 R5
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z27.8 F30000
G1 Z27.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/180
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z27.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z27.8
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z28 F30000
G1 Z27.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/180
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z28 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z28
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
M73 P67 R5
G1 E-.04 F1800
G1 X126.579 Y133.95 Z28.2 F30000
M73 P67 R4
G1 Z27.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/180
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z28.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z28.2
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z28.4 F30000
G1 Z28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/180
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z28.4 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z28.4
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z28.6 F30000
G1 Z28.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
M73 P68 R4
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/180
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z28.6 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z28.6
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z28.8 F30000
G1 Z28.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/180
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z28.8 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z28.8
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z29 F30000
G1 Z28.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
M73 P69 R4
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/180
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z29 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z29
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z29.2 F30000
G1 Z28.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/180
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z29.2 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z29.2
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z29.4 F30000
G1 Z29
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/180
; update layer progress
M73 L146
M991 S0 P145 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z29.4 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z29.4
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
M73 P70 R4
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z29.6 F30000
G1 Z29.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/180
; update layer progress
M73 L147
M991 S0 P146 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z29.6 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z29.6
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z29.8 F30000
G1 Z29.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/180
; update layer progress
M73 L148
M991 S0 P147 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z29.8 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z29.8
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P71 R4
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z30 F30000
G1 Z29.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/180
; update layer progress
M73 L149
M991 S0 P148 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z30 I.861 J-.861 P1  F30000
G1 X124.602 Y133.602 Z30
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1318
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1318
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.579 Y133.95 Z30.2 F30000
G1 Z29.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1318
G1 X124.95 Y133.95 E.05401
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.05 Y135.579 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X131.05 Y133.95 E-.61876
G1 X130.787 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/180
; update layer progress
M73 L150
M991 S0 P149 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z30.2 I.12 J-1.211 P1  F30000
G1 X124.602 Y133.602 Z30.2
G1 Z30
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1324
G1 X131.398 Y133.602 E.22543
G1 X131.398 Y140.398 E.22543
G1 X124.602 Y140.398 E.22543
G1 X124.602 Y133.662 E.22344
M204 S250
G1 X124.21 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1324
M204 S5000
G1 X131.79 Y133.21 E.23291
G1 X131.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X124.21 Y140.79 E.23291
M73 P72 R4
G1 X124.21 Y133.27 E.23107
; WIPE_START
G1 F12000
M204 S10000
G1 X126.21 Y133.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.05 Y135.579 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1324
G1 X131.05 Y133.95 E.05401
G1 X124.95 Y140.05 E.28613
G1 X131.05 Y140.05 E.20233
G1 X124.95 Y133.95 E.28613
G1 X126.579 Y133.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X124.95 Y133.95 E-.61876
G1 X125.213 Y134.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/180
; update layer progress
M73 L151
M991 S0 P150 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z30.4 I.632 J-1.04 P1  F30000
G1 X124.207 Y133.602 Z30.4
G1 Z30.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X130.617 Y133.602 E.21266
G1 X131.017 Y133.602 E.01327
G1 F13999.876
G1 X131.417 Y133.602 E.01327
G1 F6459.938
G1 X131.817 Y133.602 E.01327
G1 F1800
G1 X132.2 Y133.602 E.01269
; FEATURE: Overhang wall
G1 F600
M204 S5000
G1 X157.398 Y133.602 E.83586
G1 X157.398 Y140.398 E.22543
G1 F3000
G1 X132.2 Y140.398 E.83586
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; FEATURE: Inner wall
G1 F1800
M204 S10000
G1 X131.817 Y140.398 E.01269
G1 F6459.938
G1 X131.417 Y140.398 E.01327
G1 F13999.876
G1 X131.017 Y140.398 E.01327
G1 F15476.087
G1 X130.617 Y140.398 E.01327
G1 X125.382 Y140.398 E.17365
G1 X124.982 Y140.398 E.01327
G1 F13999.876
G1 X124.582 Y140.398 E.01327
G1 F6459.938
G1 X124.182 Y140.398 E.01327
G1 F1800
G1 X123.8 Y140.398 E.01269
; FEATURE: Overhang wall
G1 F600
M204 S5000
G1 X98.602 Y140.398 E.83586
G1 X98.602 Y133.602 E.22543
G1 X123.8 Y133.602 E.83586
; FEATURE: Inner wall
M73 P73 R4
G1 F1800
M204 S10000
G1 X124.147 Y133.602 E.0115
M204 S250
G1 X124.207 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X131.031 Y133.21 E.20969
G1 X131.431 Y133.21 E.01229
G1 F6459.938
G1 X131.831 Y133.21 E.01229
G1 F1800
G1 X132.2 Y133.21 E.01134
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X157.79 Y133.21 E.84887
G1 X157.79 Y140.79 E.25144
G1 F3000
M73 P73 R3
G1 X132.2 Y140.79 E.84887
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X131.831 Y140.79 E.01134
G1 F6459.938
G1 X131.431 Y140.79 E.01229
G1 F12000
G1 X131.031 Y140.79 E.01229
G1 X124.969 Y140.79 E.18627
G1 X124.569 Y140.79 E.01229
G1 F6459.938
G1 X124.169 Y140.79 E.01229
G1 F1800
G1 X123.8 Y140.79 E.01134
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X98.21 Y140.79 E.84887
G1 X98.21 Y133.21 E.25144
G1 X123.8 Y133.21 E.84887
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P74 R3
G1 F1800
G1 X124.147 Y133.21 E.01065
M204 S10000
G1 X124.807 Y133.938 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42565
G1 F3000
G1 X98.935 Y133.938 E.80688
G1 X98.935 Y134.321 E.01194
G1 X124.637 Y134.321 E.80159
G1 X124.637 Y134.704 E.01194
G1 X98.935 Y134.704 E.80159
G1 X98.935 Y135.086 E.01194
G1 X124.637 Y135.086 E.80159
G1 X124.637 Y135.469 E.01194
G1 X98.935 Y135.469 E.80159
G1 X98.935 Y135.852 E.01194
G1 X124.637 Y135.852 E.80159
G1 X124.637 Y136.234 E.01194
G1 X98.935 Y136.234 E.80159
G1 X98.935 Y136.617 E.01194
G1 X124.637 Y136.617 E.80159
G1 X124.637 Y137 E.01194
G1 X98.935 Y137 E.80159
G1 X98.935 Y137.383 E.01194
G1 X124.637 Y137.383 E.80159
G1 X124.637 Y137.765 E.01194
G1 X98.935 Y137.765 E.80159
M73 P75 R3
G1 X98.935 Y138.148 E.01194
G1 X124.637 Y138.148 E.80159
G1 X124.637 Y138.531 E.01194
G1 X98.935 Y138.531 E.80159
G1 X98.935 Y138.914 E.01194
G1 X124.637 Y138.914 E.80159
G1 X124.637 Y139.296 E.01194
G1 X98.935 Y139.296 E.80159
G1 X98.935 Y139.679 E.01194
G1 X124.637 Y139.679 E.80159
G1 X124.637 Y140.062 E.01194
G1 X98.766 Y140.062 E.80688
; WIPE_START
G1 X100.766 Y140.062 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.6 I.254 J1.19 P1  F30000
G1 X129.421 Y133.95 Z30.6
G1 Z30.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X130.97 Y133.95 E.05138
G1 X130.97 Y134.03 E.00263
G1 X125.03 Y139.97 E.2787
G1 X125.03 Y134.03 E.19707
G1 X130.97 Y139.97 E.2787
G1 X130.97 Y140.05 E.00263
G1 X129.421 Y140.05 E.05138
G1 X131.193 Y140.062 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42565
G1 F3000
G1 X157.065 Y140.062 E.80688
G1 X157.065 Y139.679 E.01194
G1 X131.363 Y139.679 E.80159
G1 X131.363 Y139.296 E.01194
G1 X157.065 Y139.296 E.80159
G1 X157.065 Y138.914 E.01194
G1 X131.363 Y138.914 E.80159
G1 X131.363 Y138.531 E.01194
G1 X157.065 Y138.531 E.80159
G1 X157.065 Y138.148 E.01194
G1 X131.363 Y138.148 E.80159
G1 X131.363 Y137.765 E.01194
G1 X157.065 Y137.765 E.80159
G1 X157.065 Y137.383 E.01194
G1 X131.363 Y137.383 E.80159
G1 X131.363 Y137 E.01194
G1 X157.065 Y137 E.80159
G1 X157.065 Y136.617 E.01194
G1 X131.363 Y136.617 E.80159
M73 P76 R3
G1 X131.363 Y136.235 E.01194
G1 X157.065 Y136.235 E.80159
G1 X157.065 Y135.852 E.01194
G1 X131.363 Y135.852 E.80159
G1 X131.363 Y135.469 E.01194
G1 X157.065 Y135.469 E.80159
G1 X157.065 Y135.086 E.01194
G1 X131.363 Y135.086 E.80159
G1 X131.363 Y134.704 E.01194
G1 X157.065 Y134.704 E.80159
G1 X157.065 Y134.321 E.01194
G1 X131.363 Y134.321 E.80159
G1 X131.363 Y133.938 E.01194
G1 X157.234 Y133.938 E.80688
; CHANGE_LAYER
; Z_HEIGHT: 30.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F3000
G1 X155.234 Y133.938 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/180
; update layer progress
M73 L152
M991 S0 P151 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z30.6 I.187 J1.203 P1  F30000
G1 X157.398 Y133.602 Z30.6
G1 Z30.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.8 I-1.18 J-.299 P1  F30000
G1 X156.472 Y140.234 Z30.8
G1 Z30.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42015
G1 F15000
G1 X157.065 Y139.642 E.02578
G1 X157.065 Y139.108 E.0164
G1 X156.108 Y140.065 E.04159
G1 X155.575 Y140.065 E.0164
G1 X157.065 Y138.575 E.06478
G1 X157.065 Y138.041 E.0164
G1 X155.041 Y140.065 E.08797
G1 X154.508 Y140.065 E.0164
G1 X157.065 Y137.508 E.11117
G1 X157.065 Y136.974 E.0164
G1 X153.974 Y140.065 E.13436
G1 X153.441 Y140.065 E.0164
G1 X157.065 Y136.441 E.15755
G1 X157.065 Y135.907 E.0164
G1 X152.907 Y140.065 E.18074
G1 X152.374 Y140.065 E.0164
G1 X157.065 Y135.374 E.20393
G1 X157.065 Y134.84 E.0164
G1 X151.84 Y140.065 E.22712
G1 X151.307 Y140.065 E.0164
G1 X157.065 Y134.307 E.25032
G1 X157.065 Y133.935 E.01142
G1 X156.903 Y133.935 E.00498
G1 X150.773 Y140.065 E.26647
G1 X150.24 Y140.065 E.0164
G1 X156.369 Y133.935 E.26647
G1 X155.836 Y133.935 E.0164
G1 X149.706 Y140.065 E.26647
G1 X149.173 Y140.065 E.0164
G1 X155.302 Y133.935 E.26647
G1 X154.769 Y133.935 E.0164
G1 X148.639 Y140.065 E.26647
G1 X148.106 Y140.065 E.0164
G1 X154.235 Y133.935 E.26647
G1 X153.702 Y133.935 E.0164
G1 X147.572 Y140.065 E.26647
G1 X147.039 Y140.065 E.0164
G1 X153.168 Y133.935 E.26647
G1 X152.635 Y133.935 E.0164
G1 X146.505 Y140.065 E.26647
G1 X145.972 Y140.065 E.0164
G1 X152.101 Y133.935 E.26647
G1 X151.568 Y133.935 E.0164
G1 X145.438 Y140.065 E.26647
G1 X144.905 Y140.065 E.0164
G1 X151.034 Y133.935 E.26647
G1 X150.501 Y133.935 E.0164
G1 X144.371 Y140.065 E.26647
G1 X143.838 Y140.065 E.0164
G1 X149.967 Y133.935 E.26647
G1 X149.434 Y133.935 E.0164
G1 X143.304 Y140.065 E.26647
G1 X142.771 Y140.065 E.0164
G1 X148.901 Y133.935 E.26647
G1 X148.367 Y133.935 E.0164
G1 X142.237 Y140.065 E.26647
G1 X141.704 Y140.065 E.0164
G1 X147.834 Y133.935 E.26647
G1 X147.3 Y133.935 E.0164
G1 X141.171 Y140.065 E.26647
G1 X140.637 Y140.065 E.0164
G1 X146.767 Y133.935 E.26647
G1 X146.233 Y133.935 E.0164
G1 X140.104 Y140.065 E.26647
G1 X139.57 Y140.065 E.0164
G1 X145.7 Y133.935 E.26647
G1 X145.166 Y133.935 E.0164
G1 X139.037 Y140.065 E.26647
G1 X138.503 Y140.065 E.0164
G1 X144.633 Y133.935 E.26647
G1 X144.099 Y133.935 E.0164
G1 X137.97 Y140.065 E.26647
G1 X137.436 Y140.065 E.0164
G1 X143.566 Y133.935 E.26647
G1 X143.032 Y133.935 E.0164
G1 X136.903 Y140.065 E.26647
G1 X136.369 Y140.065 E.0164
G1 X142.499 Y133.935 E.26647
G1 X141.965 Y133.935 E.0164
G1 X135.836 Y140.065 E.26647
G1 X135.302 Y140.065 E.0164
G1 X141.432 Y133.935 E.26647
G1 X140.898 Y133.935 E.0164
G1 X134.769 Y140.065 E.26647
G1 X134.235 Y140.065 E.0164
G1 X140.365 Y133.935 E.26647
M73 P77 R3
G1 X139.831 Y133.935 E.0164
G1 X133.702 Y140.065 E.26647
G1 X133.168 Y140.065 E.0164
G1 X139.298 Y133.935 E.26647
G1 X138.764 Y133.935 E.0164
G1 X132.635 Y140.065 E.26647
G1 X132.101 Y140.065 E.0164
G1 X138.231 Y133.935 E.26647
G1 X137.697 Y133.935 E.0164
G1 X131.568 Y140.065 E.26647
G1 X131.362 Y140.065 E.00631
G1 X131.362 Y139.737 E.01009
G1 X137.164 Y133.935 E.2522
G1 X136.63 Y133.935 E.0164
G1 X131.362 Y139.203 E.22901
G1 X131.362 Y138.67 E.0164
G1 X136.097 Y133.935 E.20582
G1 X135.563 Y133.935 E.0164
G1 X131.362 Y138.136 E.18263
G1 X131.362 Y137.603 E.0164
G1 X135.03 Y133.935 E.15943
G1 X134.496 Y133.935 E.0164
G1 X131.362 Y137.069 E.13624
G1 X131.362 Y136.536 E.0164
G1 X133.963 Y133.935 E.11305
G1 X133.43 Y133.935 E.0164
G1 X131.362 Y136.002 E.08986
G1 X131.362 Y135.469 E.0164
G1 X132.896 Y133.935 E.06667
G1 X132.363 Y133.935 E.0164
G1 X131.362 Y134.935 E.04348
G1 X131.362 Y134.402 E.0164
G1 X131.999 Y133.766 E.02766
G1 X129.421 Y140.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X130.97 Y140.05 E.05138
G1 X130.97 Y139.97 E.00263
G1 X125.03 Y134.03 E.2787
G1 X125.03 Y139.97 E.19707
G1 X130.97 Y134.03 E.2787
G1 X130.97 Y133.95 E.00263
G1 X129.421 Y133.95 E.05138
G1 X124.002 Y140.234 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42015
G1 F15000
G1 X124.638 Y139.599 E.02763
G1 X124.638 Y139.065 E.0164
G1 X123.638 Y140.065 E.04344
G1 X123.105 Y140.065 E.0164
G1 X124.638 Y138.532 E.06664
G1 X124.638 Y137.998 E.0164
G1 X122.571 Y140.065 E.08983
G1 X122.038 Y140.065 E.0164
G1 X124.638 Y137.465 E.11302
G1 X124.638 Y136.931 E.0164
G1 X121.504 Y140.065 E.13621
G1 X120.971 Y140.065 E.0164
G1 X124.638 Y136.398 E.1594
G1 X124.638 Y135.865 E.0164
G1 X120.437 Y140.065 E.18259
G1 X119.904 Y140.065 E.0164
G1 X124.638 Y135.331 E.20579
G1 X124.638 Y134.798 E.0164
G1 X119.37 Y140.065 E.22898
G1 X118.837 Y140.065 E.0164
G1 X124.638 Y134.264 E.25217
G1 X124.638 Y133.935 E.01011
G1 X124.433 Y133.935 E.00629
G1 X118.303 Y140.065 E.26647
G1 X117.77 Y140.065 E.0164
G1 X123.899 Y133.935 E.26647
G1 X123.366 Y133.935 E.0164
G1 X117.236 Y140.065 E.26647
G1 X116.703 Y140.065 E.0164
G1 X122.832 Y133.935 E.26647
G1 X122.299 Y133.935 E.0164
G1 X116.169 Y140.065 E.26647
G1 X115.636 Y140.065 E.0164
G1 X121.765 Y133.935 E.26647
G1 X121.232 Y133.935 E.0164
G1 X115.102 Y140.065 E.26647
G1 X114.569 Y140.065 E.0164
G1 X120.699 Y133.935 E.26647
G1 X120.165 Y133.935 E.0164
G1 X114.035 Y140.065 E.26647
G1 X113.502 Y140.065 E.0164
G1 X119.632 Y133.935 E.26647
G1 X119.098 Y133.935 E.0164
G1 X112.969 Y140.065 E.26647
G1 X112.435 Y140.065 E.0164
G1 X118.565 Y133.935 E.26647
G1 X118.031 Y133.935 E.0164
G1 X111.902 Y140.065 E.26647
G1 X111.368 Y140.065 E.0164
G1 X117.498 Y133.935 E.26647
G1 X116.964 Y133.935 E.0164
G1 X110.835 Y140.065 E.26647
G1 X110.301 Y140.065 E.0164
G1 X116.431 Y133.935 E.26647
G1 X115.897 Y133.935 E.0164
G1 X109.768 Y140.065 E.26647
G1 X109.234 Y140.065 E.0164
G1 X115.364 Y133.935 E.26647
G1 X114.83 Y133.935 E.0164
G1 X108.701 Y140.065 E.26647
G1 X108.167 Y140.065 E.0164
G1 X114.297 Y133.935 E.26647
G1 X113.763 Y133.935 E.0164
G1 X107.634 Y140.065 E.26647
G1 X107.1 Y140.065 E.0164
G1 X113.23 Y133.935 E.26647
G1 X112.696 Y133.935 E.0164
G1 X106.567 Y140.065 E.26647
G1 X106.033 Y140.065 E.0164
G1 X112.163 Y133.935 E.26647
G1 X111.629 Y133.935 E.0164
G1 X105.5 Y140.065 E.26647
G1 X104.966 Y140.065 E.0164
G1 X111.096 Y133.935 E.26647
G1 X110.562 Y133.935 E.0164
G1 X104.433 Y140.065 E.26647
G1 X103.899 Y140.065 E.0164
G1 X110.029 Y133.935 E.26647
G1 X109.495 Y133.935 E.0164
G1 X103.366 Y140.065 E.26647
G1 X102.832 Y140.065 E.0164
G1 X108.962 Y133.935 E.26647
G1 X108.428 Y133.935 E.0164
G1 X102.299 Y140.065 E.26647
G1 X101.765 Y140.065 E.0164
G1 X107.895 Y133.935 E.26647
G1 X107.361 Y133.935 E.0164
G1 X101.232 Y140.065 E.26647
G1 X100.698 Y140.065 E.0164
G1 X106.828 Y133.935 E.26647
G1 X106.294 Y133.935 E.0164
G1 X100.165 Y140.065 E.26647
G1 X99.631 Y140.065 E.0164
G1 X105.761 Y133.935 E.26647
G1 X105.228 Y133.935 E.0164
G1 X99.098 Y140.065 E.26647
G1 X98.935 Y140.065 E.005
G1 X98.935 Y139.694 E.0114
G1 X104.694 Y133.935 E.25035
G1 X104.161 Y133.935 E.0164
G1 X98.935 Y139.161 E.22716
G1 X98.935 Y138.627 E.0164
G1 X103.627 Y133.935 E.20396
G1 X103.094 Y133.935 E.0164
G1 X98.935 Y138.094 E.18077
G1 X98.935 Y137.56 E.0164
G1 X102.56 Y133.935 E.15758
G1 X102.027 Y133.935 E.0164
G1 X98.935 Y137.027 E.13439
G1 X98.935 Y136.493 E.0164
G1 X101.493 Y133.935 E.1112
G1 X100.96 Y133.935 E.0164
G1 X98.935 Y135.96 E.08801
G1 X98.935 Y135.426 E.0164
G1 X100.426 Y133.935 E.06481
G1 X99.893 Y133.935 E.0164
G1 X98.935 Y134.893 E.04162
G1 X98.935 Y134.359 E.0164
G1 X99.529 Y133.766 E.02581
; CHANGE_LAYER
; Z_HEIGHT: 30.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X98.935 Y134.359 E-.31902
G1 X98.935 Y134.893 E-.20273
G1 X99.379 Y134.449 E-.23825
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/180
; update layer progress
M73 L153
M991 S0 P152 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z30.8 I.018 J1.217 P1  F30000
G1 X157.398 Y133.602 Z30.8
G1 Z30.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.234 Y134.537 Z31 F30000
G1 Z30.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42422
G1 F15000
G1 X156.633 Y133.935 E.02643
G1 X156.094 Y133.935 E.01675
G1 X157.065 Y134.906 E.04267
G1 X157.065 Y135.446 E.01675
G1 X155.554 Y133.935 E.06637
G1 X155.015 Y133.935 E.01675
G1 X157.065 Y135.985 E.09006
G1 X157.065 Y136.524 E.01675
G1 X154.476 Y133.935 E.11376
G1 X153.937 Y133.935 E.01675
G1 X157.065 Y137.063 E.13745
G1 X157.065 Y137.603 E.01675
G1 X153.397 Y133.935 E.16115
G1 X152.858 Y133.935 E.01675
G1 X157.065 Y138.142 E.18484
G1 X157.065 Y138.681 E.01675
G1 X152.319 Y133.935 E.20854
G1 X151.78 Y133.935 E.01675
G1 X157.065 Y139.22 E.23223
G1 X157.065 Y139.759 E.01675
G1 X151.241 Y133.935 E.25593
G1 X150.701 Y133.935 E.01675
G1 X156.831 Y140.065 E.26934
G1 X156.292 Y140.065 E.01675
G1 X150.162 Y133.935 E.26934
G1 X149.623 Y133.935 E.01675
G1 X155.752 Y140.065 E.26934
G1 X155.213 Y140.065 E.01675
G1 X149.084 Y133.935 E.26934
G1 X148.544 Y133.935 E.01675
G1 X154.674 Y140.065 E.26934
G1 X154.135 Y140.065 E.01675
G1 X148.005 Y133.935 E.26934
G1 X147.466 Y133.935 E.01675
G1 X153.595 Y140.065 E.26934
G1 X153.056 Y140.065 E.01675
G1 X146.927 Y133.935 E.26934
G1 X146.387 Y133.935 E.01675
G1 X152.517 Y140.065 E.26934
G1 X151.978 Y140.065 E.01675
G1 X145.848 Y133.935 E.26934
G1 X145.309 Y133.935 E.01675
G1 X151.438 Y140.065 E.26934
G1 X150.899 Y140.065 E.01675
G1 X144.77 Y133.935 E.26934
G1 X144.23 Y133.935 E.01675
G1 X150.36 Y140.065 E.26934
G1 X149.821 Y140.065 E.01675
G1 X143.691 Y133.935 E.26934
G1 X143.152 Y133.935 E.01675
G1 X149.281 Y140.065 E.26934
G1 X148.742 Y140.065 E.01675
G1 X142.613 Y133.935 E.26934
G1 X142.073 Y133.935 E.01675
G1 X148.203 Y140.065 E.26934
G1 X147.664 Y140.065 E.01675
G1 X141.534 Y133.935 E.26934
G1 X140.995 Y133.935 E.01675
G1 X147.125 Y140.065 E.26934
G1 X146.585 Y140.065 E.01675
G1 X140.456 Y133.935 E.26934
G1 X139.916 Y133.935 E.01675
G1 X146.046 Y140.065 E.26934
G1 X145.507 Y140.065 E.01675
G1 X139.377 Y133.935 E.26934
M73 P78 R3
G1 X138.838 Y133.935 E.01675
G1 X144.968 Y140.065 E.26934
G1 X144.428 Y140.065 E.01675
G1 X138.299 Y133.935 E.26934
G1 X137.76 Y133.935 E.01675
G1 X143.889 Y140.065 E.26934
G1 X143.35 Y140.065 E.01675
G1 X137.22 Y133.935 E.26934
G1 X136.681 Y133.935 E.01675
G1 X142.811 Y140.065 E.26934
G1 X142.271 Y140.065 E.01675
G1 X136.142 Y133.935 E.26934
G1 X135.603 Y133.935 E.01675
G1 X141.732 Y140.065 E.26934
G1 X141.193 Y140.065 E.01675
G1 X135.063 Y133.935 E.26934
G1 X134.524 Y133.935 E.01675
G1 X140.654 Y140.065 E.26934
G1 X140.114 Y140.065 E.01675
G1 X133.985 Y133.935 E.26934
G1 X133.446 Y133.935 E.01675
G1 X139.575 Y140.065 E.26934
G1 X139.036 Y140.065 E.01675
G1 X132.906 Y133.935 E.26934
G1 X132.367 Y133.935 E.01675
G1 X138.497 Y140.065 E.26934
G1 X137.957 Y140.065 E.01675
G1 X132.091 Y134.198 E.2578
G1 X132.091 Y134.737 E.01675
G1 X137.418 Y140.065 E.23411
G1 X136.879 Y140.065 E.01675
G1 X132.091 Y135.276 E.21041
G1 X132.091 Y135.816 E.01675
G1 X136.34 Y140.065 E.18672
G1 X135.8 Y140.065 E.01675
G1 X132.091 Y136.355 E.16302
G1 X132.091 Y136.894 E.01675
G1 X135.261 Y140.065 E.13933
G1 X134.722 Y140.065 E.01675
G1 X132.091 Y137.433 E.11563
G1 X132.091 Y137.972 E.01675
G1 X134.183 Y140.065 E.09194
G1 X133.644 Y140.065 E.01675
G1 X132.091 Y138.512 E.06824
G1 X132.091 Y139.051 E.01675
G1 X133.104 Y140.065 E.04455
G1 X132.565 Y140.065 E.01675
G1 X131.921 Y139.421 E.02831
G1 X124.302 Y134.93 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X124.302 Y133.95 E.03249
G1 X124.95 Y133.95 E.02152
G1 X131.05 Y140.05 E.28613
G1 X124.95 Y140.05 E.20233
G1 X131.05 Y133.95 E.28613
G1 X131.698 Y133.95 E.02152
G1 X131.698 Y134.93 E.03249
G1 X124.079 Y134.579 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42422
G1 F15000
G1 X123.435 Y133.935 E.0283
G1 X122.896 Y133.935 E.01675
G1 X123.909 Y134.949 E.04454
G1 X123.909 Y135.488 E.01675
G1 X122.357 Y133.935 E.06824
G1 X121.817 Y133.935 E.01675
G1 X123.909 Y136.027 E.09193
G1 X123.909 Y136.567 E.01675
G1 X121.278 Y133.935 E.11562
G1 X120.739 Y133.935 E.01675
G1 X123.909 Y137.106 E.13932
G1 X123.909 Y137.645 E.01675
G1 X120.2 Y133.935 E.16301
G1 X119.66 Y133.935 E.01675
G1 X123.909 Y138.184 E.18671
G1 X123.909 Y138.724 E.01675
G1 X119.121 Y133.935 E.2104
G1 X118.582 Y133.935 E.01675
G1 X123.909 Y139.263 E.2341
G1 X123.909 Y139.802 E.01675
G1 X118.043 Y133.935 E.25779
G1 X117.503 Y133.935 E.01675
G1 X123.633 Y140.065 E.26934
G1 X123.094 Y140.065 E.01675
G1 X116.964 Y133.935 E.26934
G1 X116.425 Y133.935 E.01675
G1 X122.555 Y140.065 E.26934
G1 X122.015 Y140.065 E.01675
G1 X115.886 Y133.935 E.26934
G1 X115.346 Y133.935 E.01675
G1 X121.476 Y140.065 E.26934
G1 X120.937 Y140.065 E.01675
G1 X114.807 Y133.935 E.26934
G1 X114.268 Y133.935 E.01675
G1 X120.398 Y140.065 E.26934
G1 X119.858 Y140.065 E.01675
G1 X113.729 Y133.935 E.26934
G1 X113.19 Y133.935 E.01675
G1 X119.319 Y140.065 E.26934
G1 X118.78 Y140.065 E.01675
G1 X112.65 Y133.935 E.26934
G1 X112.111 Y133.935 E.01675
G1 X118.241 Y140.065 E.26934
G1 X117.701 Y140.065 E.01675
G1 X111.572 Y133.935 E.26934
G1 X111.033 Y133.935 E.01675
G1 X117.162 Y140.065 E.26934
G1 X116.623 Y140.065 E.01675
G1 X110.493 Y133.935 E.26934
G1 X109.954 Y133.935 E.01675
G1 X116.084 Y140.065 E.26934
G1 X115.544 Y140.065 E.01675
G1 X109.415 Y133.935 E.26934
G1 X108.876 Y133.935 E.01675
G1 X115.005 Y140.065 E.26934
G1 X114.466 Y140.065 E.01675
G1 X108.336 Y133.935 E.26934
G1 X107.797 Y133.935 E.01675
G1 X113.927 Y140.065 E.26934
G1 X113.387 Y140.065 E.01675
G1 X107.258 Y133.935 E.26934
G1 X106.719 Y133.935 E.01675
G1 X112.848 Y140.065 E.26934
G1 X112.309 Y140.065 E.01675
G1 X106.179 Y133.935 E.26934
G1 X105.64 Y133.935 E.01675
G1 X111.77 Y140.065 E.26934
G1 X111.23 Y140.065 E.01675
G1 X105.101 Y133.935 E.26934
G1 X104.562 Y133.935 E.01675
G1 X110.691 Y140.065 E.26934
G1 X110.152 Y140.065 E.01675
G1 X104.022 Y133.935 E.26934
G1 X103.483 Y133.935 E.01675
G1 X109.613 Y140.065 E.26934
G1 X109.074 Y140.065 E.01675
G1 X102.944 Y133.935 E.26934
G1 X102.405 Y133.935 E.01675
G1 X108.534 Y140.065 E.26934
G1 X107.995 Y140.065 E.01675
G1 X101.866 Y133.935 E.26934
G1 X101.326 Y133.935 E.01675
G1 X107.456 Y140.065 E.26934
G1 X106.917 Y140.065 E.01675
G1 X100.787 Y133.935 E.26934
G1 X100.248 Y133.935 E.01675
G1 X106.377 Y140.065 E.26934
G1 X105.838 Y140.065 E.01675
G1 X99.709 Y133.935 E.26934
G1 X99.169 Y133.935 E.01675
G1 X105.299 Y140.065 E.26934
G1 X104.76 Y140.065 E.01675
G1 X98.935 Y134.24 E.25593
G1 X98.935 Y134.78 E.01675
G1 X104.22 Y140.065 E.23224
G1 X103.681 Y140.065 E.01675
G1 X98.935 Y135.319 E.20854
G1 X98.935 Y135.858 E.01675
G1 X103.142 Y140.065 E.18485
G1 X102.603 Y140.065 E.01675
G1 X98.935 Y136.397 E.16115
G1 X98.935 Y136.937 E.01675
G1 X102.063 Y140.065 E.13746
G1 X101.524 Y140.065 E.01675
G1 X98.935 Y137.476 E.11376
G1 X98.935 Y138.015 E.01675
G1 X100.985 Y140.065 E.09007
G1 X100.446 Y140.065 E.01675
G1 X98.935 Y138.554 E.06637
G1 X98.935 Y139.093 E.01675
G1 X99.906 Y140.065 E.04268
G1 X99.367 Y140.065 E.01675
G1 X98.766 Y139.463 E.02644
; CHANGE_LAYER
; Z_HEIGHT: 30.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X99.367 Y140.065 E-.32335
G1 X99.906 Y140.065 E-.20491
G1 X99.475 Y139.634 E-.23174
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/180
; update layer progress
M73 L154
M991 S0 P153 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z31 I.126 J1.21 P1  F30000
G1 X157.398 Y133.602 Z31
G1 Z30.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7021
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7021
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z31.2 F30000
G1 X99.183 Y133.95 Z31.2
G1 Z30.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7021
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
M73 P79 R3
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 155/180
; update layer progress
M73 L155
M991 S0 P154 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z31.2 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z31.2
G1 Z31
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z31.4 F30000
G1 X98.95 Y137.026 Z31.4
G1 Z31
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 31.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 156/180
; update layer progress
M73 L156
M991 S0 P155 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z31.4 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z31.4
G1 Z31.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z31.6 F30000
G1 X99.183 Y133.95 Z31.6
G1 Z31.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
M73 P80 R3
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 157/180
; update layer progress
M73 L157
M991 S0 P156 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z31.6 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z31.6
G1 Z31.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
M73 P80 R2
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z31.8 F30000
G1 X98.95 Y137.026 Z31.8
G1 Z31.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 31.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 158/180
; update layer progress
M73 L158
M991 S0 P157 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z31.8 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z31.8
G1 Z31.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
M73 P81 R2
G1 E-.04 F1800
G1 X150.115 Y135.046 Z32 F30000
G1 X99.183 Y133.95 Z32
G1 Z31.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 159/180
; update layer progress
M73 L159
M991 S0 P158 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z32 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z32
G1 Z31.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z32.2 F30000
G1 X98.95 Y137.026 Z32.2
G1 Z31.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 32
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 160/180
; update layer progress
M73 L160
M991 S0 P159 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z32.2 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z32.2
G1 Z32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M73 P82 R2
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z32.4 F30000
G1 X99.183 Y133.95 Z32.4
G1 Z32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 161/180
; update layer progress
M73 L161
M991 S0 P160 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z32.4 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z32.4
G1 Z32.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z32.6 F30000
G1 X98.95 Y137.026 Z32.6
G1 Z32.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 32.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 162/180
; update layer progress
M73 L162
M991 S0 P161 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z32.6 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z32.6
G1 Z32.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
M73 P83 R2
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z32.8 F30000
G1 X99.183 Y133.95 Z32.8
G1 Z32.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 163/180
; update layer progress
M73 L163
M991 S0 P162 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z32.8 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z32.8
G1 Z32.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z33 F30000
G1 X98.95 Y137.026 Z33
G1 Z32.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 32.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 164/180
; update layer progress
M73 L164
M991 S0 P163 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z33 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z33
G1 Z32.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
M73 P84 R2
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z33.2 F30000
G1 X99.183 Y133.95 Z33.2
G1 Z32.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 165/180
; update layer progress
M73 L165
M991 S0 P164 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z33.2 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z33.2
G1 Z33
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z33.4 F30000
G1 X98.95 Y137.026 Z33.4
G1 Z33
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 33.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 166/180
; update layer progress
M73 L166
M991 S0 P165 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z33.4 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z33.4
G1 Z33.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
M73 P85 R2
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z33.6 F30000
G1 X99.183 Y133.95 Z33.6
G1 Z33.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 167/180
; update layer progress
M73 L167
M991 S0 P166 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z33.6 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z33.6
G1 Z33.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z33.8 F30000
G1 X98.95 Y137.026 Z33.8
G1 Z33.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 33.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 168/180
; update layer progress
M73 L168
M991 S0 P167 ;notify layer change
; OBJECT_ID: 58
G17
M73 P86 R2
G3 Z33.8 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z33.8
G1 Z33.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z34 F30000
G1 X99.183 Y133.95 Z34
G1 Z33.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 169/180
; update layer progress
M73 L169
M991 S0 P168 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z34 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z34
G1 Z33.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z34.2 F30000
G1 X98.95 Y137.026 Z34.2
G1 Z33.8
M73 P86 R1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
M73 P87 R1
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 34
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 170/180
; update layer progress
M73 L170
M991 S0 P169 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z34.2 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z34.2
G1 Z34
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z34.4 F30000
G1 X99.183 Y133.95 Z34.4
G1 Z34
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 171/180
; update layer progress
M73 L171
M991 S0 P170 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z34.4 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z34.4
G1 Z34.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z34.6 F30000
G1 X98.95 Y137.026 Z34.6
G1 Z34.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
M73 P88 R1
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 34.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 172/180
; update layer progress
M73 L172
M991 S0 P171 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z34.6 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z34.6
G1 Z34.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z34.8 F30000
G1 X99.183 Y133.95 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 173/180
; update layer progress
M73 L173
M991 S0 P172 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z34.8 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z34.8
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7022
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7022
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.117 Y135.446 Z35 F30000
G1 X98.95 Y137.026 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7022
G1 X98.95 Y138.654 E.05401
G1 X100.346 Y140.05 E.06547
G1 X101.922 Y140.05 E.0523
G1 X108.022 Y133.95 E.28613
G1 X109.598 Y133.95 E.0523
G1 X115.698 Y140.05 E.28613
G1 X117.274 Y140.05 E.0523
G1 X123.374 Y133.95 E.28613
M73 P89 R1
G1 X124.95 Y133.95 E.0523
G1 X131.05 Y140.05 E.28613
G1 X132.626 Y140.05 E.0523
G1 X138.726 Y133.95 E.28613
G1 X140.302 Y133.95 E.0523
G1 X146.402 Y140.05 E.28613
G1 X147.978 Y140.05 E.0523
G1 X154.078 Y133.95 E.28613
G1 X155.654 Y133.95 E.0523
G1 X157.05 Y135.346 E.06547
G1 X157.05 Y138.654 E.10974
G1 X155.654 Y140.05 E.06547
G1 X154.078 Y140.05 E.0523
G1 X147.978 Y133.95 E.28613
G1 X146.402 Y133.95 E.0523
G1 X140.302 Y140.05 E.28613
G1 X138.726 Y140.05 E.0523
G1 X132.626 Y133.95 E.28613
G1 X131.05 Y133.95 E.0523
G1 X124.95 Y140.05 E.28613
G1 X123.374 Y140.05 E.0523
G1 X117.274 Y133.95 E.28613
G1 X115.698 Y133.95 E.0523
G1 X109.598 Y140.05 E.28613
G1 X108.022 Y140.05 E.0523
G1 X101.922 Y133.95 E.28613
G1 X100.346 Y133.95 E.0523
G1 X98.95 Y135.346 E.06547
G1 X98.95 Y133.95 E.04629
G1 X99.183 Y133.95 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 34.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y133.95 E-.08846
G1 X98.95 Y135.346 E-.5303
G1 X99.213 Y135.083 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 174/180
; update layer progress
M73 L174
M991 S0 P173 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z35 I.031 J1.217 P1  F30000
G1 X157.398 Y133.602 Z35
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7020
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7020
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
G1 F12000
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.115 Y135.046 Z35.2 F30000
G1 X99.183 Y133.95 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7020
G1 X98.95 Y133.95 E.00772
G1 X98.95 Y135.346 E.04629
G1 X100.346 Y133.95 E.06547
G1 X101.922 Y133.95 E.0523
G1 X108.022 Y140.05 E.28613
G1 X109.598 Y140.05 E.0523
G1 X115.698 Y133.95 E.28613
G1 X117.274 Y133.95 E.0523
G1 X123.374 Y140.05 E.28613
G1 X124.95 Y140.05 E.0523
G1 X131.05 Y133.95 E.28613
G1 X132.626 Y133.95 E.0523
G1 X138.726 Y140.05 E.28613
G1 X140.302 Y140.05 E.0523
G1 X146.402 Y133.95 E.28613
G1 X147.978 Y133.95 E.0523
G1 X154.078 Y140.05 E.28613
G1 X155.654 Y140.05 E.0523
G1 X157.05 Y138.654 E.06547
G1 X157.05 Y135.346 E.10974
G1 X155.654 Y133.95 E.06547
G1 X154.078 Y133.95 E.0523
G1 X147.978 Y140.05 E.28613
G1 X146.402 Y140.05 E.0523
G1 X140.302 Y133.95 E.28613
G1 X138.726 Y133.95 E.0523
G1 X132.626 Y140.05 E.28613
G1 X131.05 Y140.05 E.0523
G1 X124.95 Y133.95 E.28613
G1 X123.374 Y133.95 E.0523
G1 X117.274 Y140.05 E.28613
G1 X115.698 Y140.05 E.0523
G1 X109.598 Y133.95 E.28613
G1 X108.022 Y133.95 E.0523
G1 X101.922 Y140.05 E.28613
G1 X100.346 Y140.05 E.0523
G1 X98.95 Y138.654 E.06547
G1 X98.95 Y137.026 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 35
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X98.95 Y138.654 E-.61876
G1 X99.213 Y138.917 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 175/180
; update layer progress
M73 L175
M991 S0 P174 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z35.2 I.111 J1.212 P1  F30000
G1 X157.398 Y133.602 Z35.2
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.673 Y136.597 Z35.4 F30000
G1 Z35
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.673 Y134.969 E.05401
G1 X156.031 Y134.327 E.03008
G1 X153.7 Y134.327 E.07732
G1 X148.355 Y139.672 E.25075
G1 X146.024 Y139.672 E.07732
G1 X140.679 Y134.327 E.25075
G1 X138.348 Y134.327 E.07732
G1 X133.003 Y139.672 E.25075
G1 X130.673 Y139.672 E.07732
G1 X125.327 Y134.327 E.25075
G1 X122.997 Y134.327 E.07732
G1 X117.652 Y139.672 E.25075
G1 X115.321 Y139.672 E.07732
G1 X109.976 Y134.327 E.25075
G1 X107.645 Y134.327 E.07732
G1 X102.3 Y139.672 E.25075
G1 X99.969 Y139.672 E.07732
G1 X99.327 Y139.031 E.03008
G1 X99.327 Y134.969 E.13476
G1 X99.969 Y134.327 E.03008
G1 X102.3 Y134.327 E.07732
G1 X107.645 Y139.672 E.25075
G1 X109.976 Y139.672 E.07732
G1 X115.321 Y134.327 E.25075
G1 X117.652 Y134.327 E.07732
G1 X122.997 Y139.672 E.25075
M73 P90 R1
G1 X125.327 Y139.672 E.07732
G1 X130.673 Y134.327 E.25075
G1 X133.003 Y134.327 E.07732
G1 X138.348 Y139.672 E.25075
G1 X140.679 Y139.672 E.07732
G1 X146.024 Y134.327 E.25075
G1 X148.355 Y134.327 E.07732
G1 X153.7 Y139.672 E.25075
G1 X156.031 Y139.672 E.07732
G1 X156.673 Y139.031 E.03008
G1 X156.673 Y137.403 E.05401
G1 X98.965 Y134.124 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.39863
G1 F3000;_EXTRUDE_SET_SPEED
G1 X98.992 Y133.992 E.0039
G1 X99.124 Y133.965 E.0039
G1 X156.876 Y133.965 E1.67399
G1 X157.008 Y133.992 E.0039
G1 X157.035 Y134.124 E.0039
G1 X157.035 Y139.876 E.16673
G1 X157.008 Y140.008 E.0039
G1 X156.876 Y140.035 E.0039
G1 X99.124 Y140.035 E1.67399
G1 X98.992 Y140.008 E.0039
G1 X98.965 Y139.876 E.0039
G1 X98.965 Y134.184 E.16499
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 35.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F3000
G1 X98.965 Y136.184 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 176/180
; update layer progress
M73 L176
M991 S0 P175 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z35.4 I.054 J1.216 P1  F30000
G1 X157.398 Y133.602 Z35.4
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.319 Y133.769 Z35.6 F30000
G1 Z35.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40069
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X157.028 Y134.479 E.05154
G1 X157.028 Y135.116 E.03275
G1 X155.884 Y133.972 E.08314
G1 X155.247 Y133.972 E.03275
G1 X157.028 Y135.753 E.12945
G1 X157.028 Y136.391 E.03275
G1 X154.609 Y133.972 E.17576
G1 X153.972 Y133.972 E.03275
G1 X157.028 Y137.028 E.22207
G1 X157.028 Y137.666 E.03275
G1 X153.334 Y133.972 E.26838
G1 X152.697 Y133.972 E.03275
G1 X157.028 Y138.303 E.31469
G1 X157.028 Y138.94 E.03275
G1 X152.06 Y133.972 E.361
G1 X151.422 Y133.972 E.03275
G1 X157.028 Y139.578 E.40731
G1 X157.028 Y140.028 E.02315
G1 X156.841 Y140.028 E.0096
G1 X150.785 Y133.972 E.44005
G1 X150.148 Y133.972 E.03275
G1 X156.204 Y140.028 E.44005
G1 X155.567 Y140.028 E.03275
G1 X149.51 Y133.972 E.44005
G1 X148.873 Y133.972 E.03275
G1 X154.929 Y140.028 E.44005
G1 X154.292 Y140.028 E.03275
G1 X148.235 Y133.972 E.44005
G1 X147.598 Y133.972 E.03275
G1 X153.654 Y140.028 E.44005
G1 X153.017 Y140.028 E.03275
G1 X146.961 Y133.972 E.44005
G1 X146.323 Y133.972 E.03275
G1 X152.38 Y140.028 E.44005
G1 X151.742 Y140.028 E.03275
G1 X145.686 Y133.972 E.44005
G1 X145.049 Y133.972 E.03275
G1 X151.105 Y140.028 E.44005
G1 X150.468 Y140.028 E.03275
G1 X144.411 Y133.972 E.44005
G1 X143.774 Y133.972 E.03275
G1 X149.83 Y140.028 E.44005
G1 X149.193 Y140.028 E.03275
G1 X143.136 Y133.972 E.44005
G1 X142.499 Y133.972 E.03275
G1 X148.556 Y140.028 E.44005
G1 X147.918 Y140.028 E.03275
G1 X141.862 Y133.972 E.44005
G1 X141.224 Y133.972 E.03275
G1 X147.281 Y140.028 E.44005
G1 X146.643 Y140.028 E.03275
G1 X140.587 Y133.972 E.44005
M73 P91 R1
G1 X139.95 Y133.972 E.03275
G1 X146.006 Y140.028 E.44005
G1 X145.369 Y140.028 E.03275
G1 X139.312 Y133.972 E.44005
G1 X138.675 Y133.972 E.03275
G1 X144.731 Y140.028 E.44005
G1 X144.094 Y140.028 E.03275
G1 X138.038 Y133.972 E.44005
G1 X137.4 Y133.972 E.03275
G1 X143.457 Y140.028 E.44005
G1 X142.819 Y140.028 E.03275
G1 X136.763 Y133.972 E.44005
G1 X136.125 Y133.972 E.03275
G1 X142.182 Y140.028 E.44005
G1 X141.544 Y140.028 E.03275
G1 X135.488 Y133.972 E.44005
G1 X134.851 Y133.972 E.03275
G1 X140.907 Y140.028 E.44005
G1 X140.27 Y140.028 E.03275
G1 X134.213 Y133.972 E.44005
G1 X133.576 Y133.972 E.03275
G1 X139.632 Y140.028 E.44005
G1 X138.995 Y140.028 E.03275
G1 X132.939 Y133.972 E.44005
G1 X132.301 Y133.972 E.03275
G1 X138.358 Y140.028 E.44005
G1 X137.72 Y140.028 E.03275
G1 X131.664 Y133.972 E.44005
G1 X131.026 Y133.972 E.03275
G1 X137.083 Y140.028 E.44005
G1 X136.445 Y140.028 E.03275
G1 X130.389 Y133.972 E.44005
G1 X129.752 Y133.972 E.03275
G1 X135.808 Y140.028 E.44005
G1 X135.171 Y140.028 E.03275
G1 X129.114 Y133.972 E.44005
G1 X128.477 Y133.972 E.03275
G1 X134.533 Y140.028 E.44005
G1 X133.896 Y140.028 E.03275
G1 X127.84 Y133.972 E.44005
G1 X127.202 Y133.972 E.03275
G1 X133.259 Y140.028 E.44005
G1 X132.621 Y140.028 E.03275
G1 X126.565 Y133.972 E.44005
G1 X125.927 Y133.972 E.03275
G1 X131.984 Y140.028 E.44005
G1 X131.346 Y140.028 E.03275
G1 X125.29 Y133.972 E.44005
G1 X124.653 Y133.972 E.03275
G1 X130.709 Y140.028 E.44005
G1 X130.072 Y140.028 E.03275
G1 X124.015 Y133.972 E.44005
G1 X123.378 Y133.972 E.03275
G1 X129.434 Y140.028 E.44005
G1 X128.797 Y140.028 E.03275
G1 X122.741 Y133.972 E.44005
G1 X122.103 Y133.972 E.03275
G1 X128.16 Y140.028 E.44005
G1 X127.522 Y140.028 E.03275
G1 X121.466 Y133.972 E.44005
G1 X120.828 Y133.972 E.03275
G1 X126.885 Y140.028 E.44005
G1 X126.248 Y140.028 E.03275
G1 X120.191 Y133.972 E.44005
G1 X119.554 Y133.972 E.03275
G1 X125.61 Y140.028 E.44005
G1 X124.973 Y140.028 E.03275
G1 X118.916 Y133.972 E.44005
G1 X118.279 Y133.972 E.03275
G1 X124.335 Y140.028 E.44005
G1 X123.698 Y140.028 E.03275
G1 X117.642 Y133.972 E.44005
G1 X117.004 Y133.972 E.03275
G1 X123.061 Y140.028 E.44005
G1 X122.423 Y140.028 E.03275
G1 X116.367 Y133.972 E.44005
G1 X115.729 Y133.972 E.03275
G1 X121.786 Y140.028 E.44005
G1 X121.149 Y140.028 E.03275
G1 X115.092 Y133.972 E.44005
G1 X114.455 Y133.972 E.03275
G1 X120.511 Y140.028 E.44005
G1 X119.874 Y140.028 E.03275
G1 X113.817 Y133.972 E.44005
G1 X113.18 Y133.972 E.03275
G1 X119.236 Y140.028 E.44005
G1 X118.599 Y140.028 E.03275
G1 X112.543 Y133.972 E.44005
G1 X111.905 Y133.972 E.03275
G1 X117.962 Y140.028 E.44005
G1 X117.324 Y140.028 E.03275
G1 X111.268 Y133.972 E.44005
G1 X110.631 Y133.972 E.03275
G1 X116.687 Y140.028 E.44005
G1 X116.05 Y140.028 E.03275
M73 P92 R1
G1 X109.993 Y133.972 E.44005
G1 X109.356 Y133.972 E.03275
G1 X115.412 Y140.028 E.44005
G1 X114.775 Y140.028 E.03275
G1 X108.718 Y133.972 E.44005
G1 X108.081 Y133.972 E.03275
G1 X114.137 Y140.028 E.44005
G1 X113.5 Y140.028 E.03275
G1 X107.444 Y133.972 E.44005
G1 X106.806 Y133.972 E.03275
G1 X112.863 Y140.028 E.44005
G1 X112.225 Y140.028 E.03275
G1 X106.169 Y133.972 E.44005
G1 X105.532 Y133.972 E.03275
G1 X111.588 Y140.028 E.44005
G1 X110.951 Y140.028 E.03275
G1 X104.894 Y133.972 E.44005
G1 X104.257 Y133.972 E.03275
G1 X110.313 Y140.028 E.44005
G1 X109.676 Y140.028 E.03275
G1 X103.619 Y133.972 E.44005
G1 X102.982 Y133.972 E.03275
G1 X109.038 Y140.028 E.44005
G1 X108.401 Y140.028 E.03275
G1 X102.345 Y133.972 E.44005
G1 X101.707 Y133.972 E.03275
G1 X107.764 Y140.028 E.44005
G1 X107.126 Y140.028 E.03275
G1 X101.07 Y133.972 E.44005
G1 X100.433 Y133.972 E.03275
G1 X106.489 Y140.028 E.44005
G1 X105.852 Y140.028 E.03275
G1 X99.795 Y133.972 E.44005
G1 X99.158 Y133.972 E.03275
G1 X105.214 Y140.028 E.44005
G1 X104.577 Y140.028 E.03275
G1 X98.972 Y134.423 E.40725
G1 X98.972 Y135.06 E.03275
G1 X103.94 Y140.028 E.36094
G1 X103.302 Y140.028 E.03275
G1 X98.972 Y135.698 E.31463
G1 X98.972 Y136.335 E.03275
G1 X102.665 Y140.028 E.26832
G1 X102.027 Y140.028 E.03275
G1 X98.972 Y136.973 E.22201
G1 X98.972 Y137.61 E.03275
G1 X101.39 Y140.028 E.1757
G1 X100.753 Y140.028 E.03275
G1 X98.972 Y138.247 E.12939
G1 X98.972 Y138.885 E.03275
G1 X100.115 Y140.028 E.08308
G1 X99.478 Y140.028 E.03275
G1 X98.769 Y139.32 E.05149
; CHANGE_LAYER
; Z_HEIGHT: 35.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F3000
G1 X99.478 Y140.028 E-.38081
G1 X100.115 Y140.028 E-.2422
G1 X99.86 Y139.773 E-.13699
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 177/180
; update layer progress
M73 L177
M991 S0 P176 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z35.6 I.13 J1.21 P1  F30000
G1 X157.398 Y133.602 Z35.6
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.234 Y134.534 Z35.8 F30000
G1 Z35.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42284
G1 F15000
G1 X156.636 Y133.935 E.02621
G1 X156.098 Y133.935 E.01663
G1 X157.065 Y134.902 E.0423
G1 X157.065 Y135.439 E.01663
G1 X155.561 Y133.935 E.06583
G1 X155.024 Y133.935 E.01663
G1 X157.065 Y135.976 E.08935
G1 X157.065 Y136.513 E.01663
G1 X154.487 Y133.935 E.11287
G1 X153.949 Y133.935 E.01663
G1 X157.065 Y137.051 E.1364
G1 X157.065 Y137.588 E.01663
G1 X153.412 Y133.935 E.15992
G1 X152.875 Y133.935 E.01663
G1 X157.065 Y138.125 E.18345
G1 X157.065 Y138.663 E.01663
G1 X152.337 Y133.935 E.20697
G1 X151.8 Y133.935 E.01663
G1 X157.065 Y139.2 E.23049
G1 X157.065 Y139.737 E.01663
G1 X151.263 Y133.935 E.25402
G1 X150.726 Y133.935 E.01663
G1 X156.855 Y140.065 E.26836
G1 X156.318 Y140.065 E.01663
G1 X150.188 Y133.935 E.26836
G1 X149.651 Y133.935 E.01663
G1 X155.78 Y140.065 E.26836
G1 X155.243 Y140.065 E.01663
G1 X149.114 Y133.935 E.26836
G1 X148.576 Y133.935 E.01663
G1 X154.706 Y140.065 E.26836
G1 X154.168 Y140.065 E.01663
G1 X148.039 Y133.935 E.26836
G1 X147.502 Y133.935 E.01663
G1 X153.631 Y140.065 E.26836
G1 X153.094 Y140.065 E.01663
G1 X146.965 Y133.935 E.26836
G1 X146.427 Y133.935 E.01663
G1 X152.557 Y140.065 E.26836
G1 X152.019 Y140.065 E.01663
G1 X145.89 Y133.935 E.26836
G1 X145.353 Y133.935 E.01663
G1 X151.482 Y140.065 E.26836
G1 X150.945 Y140.065 E.01663
G1 X144.815 Y133.935 E.26836
G1 X144.278 Y133.935 E.01663
G1 X150.407 Y140.065 E.26836
G1 X149.87 Y140.065 E.01663
G1 X143.741 Y133.935 E.26836
G1 X143.204 Y133.935 E.01663
G1 X149.333 Y140.065 E.26836
G1 X148.796 Y140.065 E.01663
G1 X142.666 Y133.935 E.26836
G1 X142.129 Y133.935 E.01663
G1 X148.258 Y140.065 E.26836
G1 X147.721 Y140.065 E.01663
G1 X141.592 Y133.935 E.26836
G1 X141.054 Y133.935 E.01663
G1 X147.184 Y140.065 E.26836
G1 X146.646 Y140.065 E.01663
G1 X140.517 Y133.935 E.26836
G1 X139.98 Y133.935 E.01663
G1 X146.109 Y140.065 E.26836
G1 X145.572 Y140.065 E.01663
G1 X139.443 Y133.935 E.26836
G1 X138.905 Y133.935 E.01663
G1 X145.035 Y140.065 E.26836
G1 X144.497 Y140.065 E.01663
G1 X138.368 Y133.935 E.26836
G1 X137.831 Y133.935 E.01663
G1 X143.96 Y140.065 E.26836
G1 X143.423 Y140.065 E.01663
G1 X137.293 Y133.935 E.26836
G1 X136.756 Y133.935 E.01663
G1 X142.885 Y140.065 E.26836
G1 X142.348 Y140.065 E.01663
G1 X136.219 Y133.935 E.26836
G1 X135.682 Y133.935 E.01663
G1 X141.811 Y140.065 E.26836
M73 P93 R1
G1 X141.274 Y140.065 E.01663
G1 X135.144 Y133.935 E.26836
G1 X134.607 Y133.935 E.01663
G1 X140.736 Y140.065 E.26836
G1 X140.199 Y140.065 E.01663
G1 X134.07 Y133.935 E.26836
G1 X133.532 Y133.935 E.01663
G1 X139.662 Y140.065 E.26836
G1 X139.124 Y140.065 E.01663
G1 X132.995 Y133.935 E.26836
G1 X132.458 Y133.935 E.01663
G1 X138.587 Y140.065 E.26836
G1 X138.05 Y140.065 E.01663
G1 X131.92 Y133.935 E.26836
G1 X131.383 Y133.935 E.01663
G1 X137.513 Y140.065 E.26836
G1 X136.975 Y140.065 E.01663
G1 X130.846 Y133.935 E.26836
G1 X130.309 Y133.935 E.01663
G1 X136.438 Y140.065 E.26836
G1 X135.901 Y140.065 E.01663
G1 X129.771 Y133.935 E.26836
G1 X129.234 Y133.935 E.01663
G1 X135.363 Y140.065 E.26836
G1 X134.826 Y140.065 E.01663
G1 X128.697 Y133.935 E.26836
G1 X128.159 Y133.935 E.01663
G1 X134.289 Y140.065 E.26836
G1 X133.752 Y140.065 E.01663
G1 X127.622 Y133.935 E.26836
G1 X127.085 Y133.935 E.01663
G1 X133.214 Y140.065 E.26836
G1 X132.677 Y140.065 E.01663
G1 X126.548 Y133.935 E.26836
G1 X126.01 Y133.935 E.01663
G1 X132.14 Y140.065 E.26836
G1 X131.602 Y140.065 E.01663
G1 X125.473 Y133.935 E.26836
G1 X124.936 Y133.935 E.01663
G1 X131.065 Y140.065 E.26836
G1 X130.528 Y140.065 E.01663
G1 X124.398 Y133.935 E.26836
G1 X123.861 Y133.935 E.01663
G1 X129.991 Y140.065 E.26836
G1 X129.453 Y140.065 E.01663
G1 X123.324 Y133.935 E.26836
G1 X122.787 Y133.935 E.01663
G1 X128.916 Y140.065 E.26836
G1 X128.379 Y140.065 E.01663
G1 X122.249 Y133.935 E.26836
G1 X121.712 Y133.935 E.01663
G1 X127.841 Y140.065 E.26836
G1 X127.304 Y140.065 E.01663
G1 X121.175 Y133.935 E.26836
G1 X120.637 Y133.935 E.01663
G1 X126.767 Y140.065 E.26836
G1 X126.23 Y140.065 E.01663
G1 X120.1 Y133.935 E.26836
G1 X119.563 Y133.935 E.01663
G1 X125.692 Y140.065 E.26836
G1 X125.155 Y140.065 E.01663
G1 X119.026 Y133.935 E.26836
G1 X118.488 Y133.935 E.01663
G1 X124.618 Y140.065 E.26836
G1 X124.08 Y140.065 E.01663
G1 X117.951 Y133.935 E.26836
G1 X117.414 Y133.935 E.01663
G1 X123.543 Y140.065 E.26836
G1 X123.006 Y140.065 E.01663
G1 X116.876 Y133.935 E.26836
G1 X116.339 Y133.935 E.01663
G1 X122.468 Y140.065 E.26836
G1 X121.931 Y140.065 E.01663
G1 X115.802 Y133.935 E.26836
G1 X115.265 Y133.935 E.01663
G1 X121.394 Y140.065 E.26836
G1 X120.857 Y140.065 E.01663
G1 X114.727 Y133.935 E.26836
G1 X114.19 Y133.935 E.01663
G1 X120.319 Y140.065 E.26836
G1 X119.782 Y140.065 E.01663
G1 X113.653 Y133.935 E.26836
G1 X113.115 Y133.935 E.01663
G1 X119.245 Y140.065 E.26836
G1 X118.707 Y140.065 E.01663
G1 X112.578 Y133.935 E.26836
G1 X112.041 Y133.935 E.01663
G1 X118.17 Y140.065 E.26836
G1 X117.633 Y140.065 E.01663
G1 X111.504 Y133.935 E.26836
G1 X110.966 Y133.935 E.01663
G1 X117.096 Y140.065 E.26836
G1 X116.558 Y140.065 E.01663
G1 X110.429 Y133.935 E.26836
G1 X109.892 Y133.935 E.01663
G1 X116.021 Y140.065 E.26836
G1 X115.484 Y140.065 E.01663
G1 X109.354 Y133.935 E.26836
G1 X108.817 Y133.935 E.01663
G1 X114.946 Y140.065 E.26836
G1 X114.409 Y140.065 E.01663
G1 X108.28 Y133.935 E.26836
G1 X107.743 Y133.935 E.01663
G1 X113.872 Y140.065 E.26836
G1 X113.335 Y140.065 E.01663
G1 X107.205 Y133.935 E.26836
G1 X106.668 Y133.935 E.01663
G1 X112.797 Y140.065 E.26836
G1 X112.26 Y140.065 E.01663
G1 X106.131 Y133.935 E.26836
G1 X105.593 Y133.935 E.01663
G1 X111.723 Y140.065 E.26836
G1 X111.185 Y140.065 E.01663
G1 X105.056 Y133.935 E.26836
M73 P93 R0
G1 X104.519 Y133.935 E.01663
G1 X110.648 Y140.065 E.26836
G1 X110.111 Y140.065 E.01663
G1 X103.982 Y133.935 E.26836
G1 X103.444 Y133.935 E.01663
G1 X109.574 Y140.065 E.26836
G1 X109.036 Y140.065 E.01663
G1 X102.907 Y133.935 E.26836
G1 X102.37 Y133.935 E.01663
G1 X108.499 Y140.065 E.26836
G1 X107.962 Y140.065 E.01663
G1 X101.832 Y133.935 E.26836
G1 X101.295 Y133.935 E.01663
G1 X107.424 Y140.065 E.26836
G1 X106.887 Y140.065 E.01663
G1 X100.758 Y133.935 E.26836
G1 X100.22 Y133.935 E.01663
G1 X106.35 Y140.065 E.26836
G1 X105.813 Y140.065 E.01663
G1 X99.683 Y133.935 E.26836
G1 X99.146 Y133.935 E.01663
G1 X105.275 Y140.065 E.26836
G1 X104.738 Y140.065 E.01663
G1 X98.935 Y134.262 E.25405
G1 X98.935 Y134.799 E.01663
G1 X104.201 Y140.065 E.23053
G1 X103.663 Y140.065 E.01663
G1 X98.935 Y135.337 E.20701
G1 X98.935 Y135.874 E.01663
G1 X103.126 Y140.065 E.18348
G1 X102.589 Y140.065 E.01663
G1 X98.935 Y136.411 E.15996
G1 X98.935 Y136.948 E.01663
G1 X102.052 Y140.065 E.13644
G1 X101.514 Y140.065 E.01663
G1 X98.935 Y137.486 E.11291
G1 X98.935 Y138.023 E.01663
G1 X100.977 Y140.065 E.08939
G1 X100.44 Y140.065 E.01663
G1 X98.935 Y138.56 E.06586
G1 X98.935 Y139.098 E.01663
G1 X99.902 Y140.065 E.04234
G1 X99.365 Y140.065 E.01663
G1 X98.766 Y139.465 E.02625
; CHANGE_LAYER
; Z_HEIGHT: 35.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F15000
G1 X99.365 Y140.065 E-.32216
G1 X99.902 Y140.065 E-.20417
G1 X99.468 Y139.63 E-.23368
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 178/180
; update layer progress
M73 L178
M991 S0 P177 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z35.8 I.126 J1.21 P1  F30000
G1 X157.398 Y133.602 Z35.8
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.466 Y140.234 Z36 F30000
G1 Z35.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42284
G1 F15000
G1 X157.065 Y139.636 E.02621
G1 X157.065 Y139.098 E.01663
G1 X156.098 Y140.065 E.0423
G1 X155.561 Y140.065 E.01663
G1 X157.065 Y138.561 E.06583
G1 X157.065 Y138.024 E.01663
G1 X155.024 Y140.065 E.08935
G1 X154.487 Y140.065 E.01663
G1 X157.065 Y137.487 E.11287
G1 X157.065 Y136.949 E.01663
G1 X153.949 Y140.065 E.1364
G1 X153.412 Y140.065 E.01663
G1 X157.065 Y136.412 E.15992
G1 X157.065 Y135.875 E.01663
G1 X152.875 Y140.065 E.18345
G1 X152.337 Y140.065 E.01663
G1 X157.065 Y135.337 E.20697
G1 X157.065 Y134.8 E.01663
G1 X151.8 Y140.065 E.23049
G1 X151.263 Y140.065 E.01663
G1 X157.065 Y134.263 E.25402
G1 X157.065 Y133.935 E.01014
G1 X156.855 Y133.935 E.00649
G1 X150.726 Y140.065 E.26836
G1 X150.188 Y140.065 E.01663
G1 X156.318 Y133.935 E.26836
G1 X155.78 Y133.935 E.01663
G1 X149.651 Y140.065 E.26836
G1 X149.114 Y140.065 E.01663
G1 X155.243 Y133.935 E.26836
G1 X154.706 Y133.935 E.01663
G1 X148.576 Y140.065 E.26836
G1 X148.039 Y140.065 E.01663
G1 X154.168 Y133.935 E.26836
G1 X153.631 Y133.935 E.01663
G1 X147.502 Y140.065 E.26836
G1 X146.965 Y140.065 E.01663
G1 X153.094 Y133.935 E.26836
G1 X152.557 Y133.935 E.01663
G1 X146.427 Y140.065 E.26836
G1 X145.89 Y140.065 E.01663
G1 X152.019 Y133.935 E.26836
G1 X151.482 Y133.935 E.01663
G1 X145.353 Y140.065 E.26836
G1 X144.815 Y140.065 E.01663
G1 X150.945 Y133.935 E.26836
G1 X150.407 Y133.935 E.01663
G1 X144.278 Y140.065 E.26836
G1 X143.741 Y140.065 E.01663
G1 X149.87 Y133.935 E.26836
G1 X149.333 Y133.935 E.01663
G1 X143.204 Y140.065 E.26836
G1 X142.666 Y140.065 E.01663
G1 X148.796 Y133.935 E.26836
G1 X148.258 Y133.935 E.01663
G1 X142.129 Y140.065 E.26836
M73 P94 R0
G1 X141.592 Y140.065 E.01663
G1 X147.721 Y133.935 E.26836
G1 X147.184 Y133.935 E.01663
G1 X141.054 Y140.065 E.26836
G1 X140.517 Y140.065 E.01663
G1 X146.646 Y133.935 E.26836
G1 X146.109 Y133.935 E.01663
G1 X139.98 Y140.065 E.26836
G1 X139.443 Y140.065 E.01663
G1 X145.572 Y133.935 E.26836
G1 X145.035 Y133.935 E.01663
G1 X138.905 Y140.065 E.26836
G1 X138.368 Y140.065 E.01663
G1 X144.497 Y133.935 E.26836
G1 X143.96 Y133.935 E.01663
G1 X137.831 Y140.065 E.26836
G1 X137.293 Y140.065 E.01663
G1 X143.423 Y133.935 E.26836
G1 X142.885 Y133.935 E.01663
G1 X136.756 Y140.065 E.26836
G1 X136.219 Y140.065 E.01663
G1 X142.348 Y133.935 E.26836
G1 X141.811 Y133.935 E.01663
G1 X135.682 Y140.065 E.26836
G1 X135.144 Y140.065 E.01663
G1 X141.274 Y133.935 E.26836
G1 X140.736 Y133.935 E.01663
G1 X134.607 Y140.065 E.26836
G1 X134.07 Y140.065 E.01663
G1 X140.199 Y133.935 E.26836
G1 X139.662 Y133.935 E.01663
G1 X133.532 Y140.065 E.26836
G1 X132.995 Y140.065 E.01663
G1 X139.124 Y133.935 E.26836
G1 X138.587 Y133.935 E.01663
G1 X132.458 Y140.065 E.26836
G1 X131.92 Y140.065 E.01663
G1 X138.05 Y133.935 E.26836
G1 X137.513 Y133.935 E.01663
G1 X131.383 Y140.065 E.26836
G1 X130.846 Y140.065 E.01663
G1 X136.975 Y133.935 E.26836
G1 X136.438 Y133.935 E.01663
G1 X130.309 Y140.065 E.26836
G1 X129.771 Y140.065 E.01663
G1 X135.901 Y133.935 E.26836
G1 X135.363 Y133.935 E.01663
G1 X129.234 Y140.065 E.26836
G1 X128.697 Y140.065 E.01663
G1 X134.826 Y133.935 E.26836
G1 X134.289 Y133.935 E.01663
G1 X128.159 Y140.065 E.26836
G1 X127.622 Y140.065 E.01663
G1 X133.752 Y133.935 E.26836
G1 X133.214 Y133.935 E.01663
G1 X127.085 Y140.065 E.26836
G1 X126.548 Y140.065 E.01663
G1 X132.677 Y133.935 E.26836
G1 X132.14 Y133.935 E.01663
G1 X126.01 Y140.065 E.26836
G1 X125.473 Y140.065 E.01663
G1 X131.602 Y133.935 E.26836
G1 X131.065 Y133.935 E.01663
G1 X124.936 Y140.065 E.26836
G1 X124.398 Y140.065 E.01663
G1 X130.528 Y133.935 E.26836
G1 X129.991 Y133.935 E.01663
G1 X123.861 Y140.065 E.26836
G1 X123.324 Y140.065 E.01663
G1 X129.453 Y133.935 E.26836
G1 X128.916 Y133.935 E.01663
G1 X122.787 Y140.065 E.26836
G1 X122.249 Y140.065 E.01663
G1 X128.379 Y133.935 E.26836
G1 X127.841 Y133.935 E.01663
G1 X121.712 Y140.065 E.26836
G1 X121.175 Y140.065 E.01663
G1 X127.304 Y133.935 E.26836
G1 X126.767 Y133.935 E.01663
G1 X120.637 Y140.065 E.26836
G1 X120.1 Y140.065 E.01663
G1 X126.23 Y133.935 E.26836
G1 X125.692 Y133.935 E.01663
G1 X119.563 Y140.065 E.26836
G1 X119.026 Y140.065 E.01663
G1 X125.155 Y133.935 E.26836
G1 X124.618 Y133.935 E.01663
G1 X118.488 Y140.065 E.26836
G1 X117.951 Y140.065 E.01663
G1 X124.08 Y133.935 E.26836
G1 X123.543 Y133.935 E.01663
G1 X117.414 Y140.065 E.26836
G1 X116.876 Y140.065 E.01663
G1 X123.006 Y133.935 E.26836
G1 X122.468 Y133.935 E.01663
G1 X116.339 Y140.065 E.26836
G1 X115.802 Y140.065 E.01663
G1 X121.931 Y133.935 E.26836
G1 X121.394 Y133.935 E.01663
G1 X115.265 Y140.065 E.26836
G1 X114.727 Y140.065 E.01663
G1 X120.857 Y133.935 E.26836
G1 X120.319 Y133.935 E.01663
G1 X114.19 Y140.065 E.26836
G1 X113.653 Y140.065 E.01663
G1 X119.782 Y133.935 E.26836
G1 X119.245 Y133.935 E.01663
G1 X113.115 Y140.065 E.26836
G1 X112.578 Y140.065 E.01663
G1 X118.707 Y133.935 E.26836
G1 X118.17 Y133.935 E.01663
G1 X112.041 Y140.065 E.26836
G1 X111.504 Y140.065 E.01663
G1 X117.633 Y133.935 E.26836
G1 X117.096 Y133.935 E.01663
G1 X110.966 Y140.065 E.26836
G1 X110.429 Y140.065 E.01663
G1 X116.558 Y133.935 E.26836
G1 X116.021 Y133.935 E.01663
G1 X109.892 Y140.065 E.26836
G1 X109.354 Y140.065 E.01663
G1 X115.484 Y133.935 E.26836
G1 X114.946 Y133.935 E.01663
G1 X108.817 Y140.065 E.26836
G1 X108.28 Y140.065 E.01663
G1 X114.409 Y133.935 E.26836
G1 X113.872 Y133.935 E.01663
G1 X107.743 Y140.065 E.26836
G1 X107.205 Y140.065 E.01663
G1 X113.335 Y133.935 E.26836
G1 X112.797 Y133.935 E.01663
G1 X106.668 Y140.065 E.26836
G1 X106.131 Y140.065 E.01663
G1 X112.26 Y133.935 E.26836
G1 X111.723 Y133.935 E.01663
G1 X105.593 Y140.065 E.26836
G1 X105.056 Y140.065 E.01663
G1 X111.185 Y133.935 E.26836
G1 X110.648 Y133.935 E.01663
G1 X104.519 Y140.065 E.26836
G1 X103.982 Y140.065 E.01663
G1 X110.111 Y133.935 E.26836
G1 X109.574 Y133.935 E.01663
G1 X103.444 Y140.065 E.26836
G1 X102.907 Y140.065 E.01663
G1 X109.036 Y133.935 E.26836
G1 X108.499 Y133.935 E.01663
G1 X102.37 Y140.065 E.26836
G1 X101.832 Y140.065 E.01663
G1 X107.962 Y133.935 E.26836
G1 X107.424 Y133.935 E.01663
G1 X101.295 Y140.065 E.26836
G1 X100.758 Y140.065 E.01663
G1 X106.887 Y133.935 E.26836
G1 X106.35 Y133.935 E.01663
G1 X100.22 Y140.065 E.26836
G1 X99.683 Y140.065 E.01663
G1 X105.813 Y133.935 E.26836
G1 X105.275 Y133.935 E.01663
G1 X99.146 Y140.065 E.26836
G1 X98.935 Y140.065 E.00652
G1 X98.935 Y139.738 E.01011
G1 X104.738 Y133.935 E.25405
G1 X104.201 Y133.935 E.01663
G1 X98.935 Y139.201 E.23053
G1 X98.935 Y138.663 E.01663
G1 X103.663 Y133.935 E.20701
G1 X103.126 Y133.935 E.01663
G1 X98.935 Y138.126 E.18348
G1 X98.935 Y137.589 E.01663
G1 X102.589 Y133.935 E.15996
G1 X102.052 Y133.935 E.01663
G1 X98.935 Y137.052 E.13644
G1 X98.935 Y136.514 E.01663
G1 X101.514 Y133.935 E.11291
G1 X100.977 Y133.935 E.01663
G1 X98.935 Y135.977 E.08939
G1 X98.935 Y135.44 E.01663
G1 X100.44 Y133.935 E.06586
G1 X99.902 Y133.935 E.01663
G1 X98.935 Y134.902 E.04234
G1 X98.935 Y134.365 E.01663
G1 X99.535 Y133.766 E.02625
; CHANGE_LAYER
; Z_HEIGHT: 35.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X98.935 Y134.365 E-.32216
G1 X98.935 Y134.902 E-.20417
G1 X99.37 Y134.468 E-.23368
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 179/180
; update layer progress
M73 L179
M991 S0 P178 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z36 I.018 J1.217 P1  F30000
G1 X157.398 Y133.602 Z36
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X157.398 Y140.398 E.22543
G1 X98.602 Y140.398 E1.95037
G1 X98.602 Y133.602 E.22543
G1 X157.338 Y133.602 E1.94838
M204 S250
G1 X157.79 Y133.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.234 Y134.534 Z36.2 F30000
G1 Z35.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42284
G1 F15000
G1 X156.636 Y133.935 E.02621
G1 X156.098 Y133.935 E.01663
G1 X157.065 Y134.902 E.0423
G1 X157.065 Y135.439 E.01663
G1 X155.561 Y133.935 E.06583
G1 X155.024 Y133.935 E.01663
G1 X157.065 Y135.976 E.08935
G1 X157.065 Y136.513 E.01663
G1 X154.487 Y133.935 E.11287
G1 X153.949 Y133.935 E.01663
G1 X157.065 Y137.051 E.1364
G1 X157.065 Y137.588 E.01663
G1 X153.412 Y133.935 E.15992
G1 X152.875 Y133.935 E.01663
G1 X157.065 Y138.125 E.18345
G1 X157.065 Y138.663 E.01663
G1 X152.337 Y133.935 E.20697
G1 X151.8 Y133.935 E.01663
G1 X157.065 Y139.2 E.23049
G1 X157.065 Y139.737 E.01663
G1 X151.263 Y133.935 E.25402
G1 X150.726 Y133.935 E.01663
G1 X156.855 Y140.065 E.26836
G1 X156.318 Y140.065 E.01663
G1 X150.188 Y133.935 E.26836
G1 X149.651 Y133.935 E.01663
G1 X155.78 Y140.065 E.26836
G1 X155.243 Y140.065 E.01663
G1 X149.114 Y133.935 E.26836
M73 P95 R0
G1 X148.576 Y133.935 E.01663
G1 X154.706 Y140.065 E.26836
G1 X154.168 Y140.065 E.01663
G1 X148.039 Y133.935 E.26836
G1 X147.502 Y133.935 E.01663
G1 X153.631 Y140.065 E.26836
G1 X153.094 Y140.065 E.01663
G1 X146.965 Y133.935 E.26836
G1 X146.427 Y133.935 E.01663
G1 X152.557 Y140.065 E.26836
G1 X152.019 Y140.065 E.01663
G1 X145.89 Y133.935 E.26836
G1 X145.353 Y133.935 E.01663
G1 X151.482 Y140.065 E.26836
G1 X150.945 Y140.065 E.01663
G1 X144.815 Y133.935 E.26836
G1 X144.278 Y133.935 E.01663
G1 X150.407 Y140.065 E.26836
G1 X149.87 Y140.065 E.01663
G1 X143.741 Y133.935 E.26836
G1 X143.204 Y133.935 E.01663
G1 X149.333 Y140.065 E.26836
G1 X148.796 Y140.065 E.01663
G1 X142.666 Y133.935 E.26836
G1 X142.129 Y133.935 E.01663
G1 X148.258 Y140.065 E.26836
G1 X147.721 Y140.065 E.01663
G1 X141.592 Y133.935 E.26836
G1 X141.054 Y133.935 E.01663
G1 X147.184 Y140.065 E.26836
G1 X146.646 Y140.065 E.01663
G1 X140.517 Y133.935 E.26836
G1 X139.98 Y133.935 E.01663
G1 X146.109 Y140.065 E.26836
G1 X145.572 Y140.065 E.01663
G1 X139.443 Y133.935 E.26836
G1 X138.905 Y133.935 E.01663
G1 X145.035 Y140.065 E.26836
G1 X144.497 Y140.065 E.01663
G1 X138.368 Y133.935 E.26836
G1 X137.831 Y133.935 E.01663
G1 X143.96 Y140.065 E.26836
G1 X143.423 Y140.065 E.01663
G1 X137.293 Y133.935 E.26836
G1 X136.756 Y133.935 E.01663
G1 X142.885 Y140.065 E.26836
G1 X142.348 Y140.065 E.01663
G1 X136.219 Y133.935 E.26836
G1 X135.682 Y133.935 E.01663
G1 X141.811 Y140.065 E.26836
G1 X141.274 Y140.065 E.01663
G1 X135.144 Y133.935 E.26836
G1 X134.607 Y133.935 E.01663
G1 X140.736 Y140.065 E.26836
G1 X140.199 Y140.065 E.01663
G1 X134.07 Y133.935 E.26836
G1 X133.532 Y133.935 E.01663
G1 X139.662 Y140.065 E.26836
G1 X139.124 Y140.065 E.01663
G1 X132.995 Y133.935 E.26836
G1 X132.458 Y133.935 E.01663
G1 X138.587 Y140.065 E.26836
G1 X138.05 Y140.065 E.01663
G1 X131.92 Y133.935 E.26836
G1 X131.383 Y133.935 E.01663
G1 X137.513 Y140.065 E.26836
G1 X136.975 Y140.065 E.01663
G1 X130.846 Y133.935 E.26836
G1 X130.309 Y133.935 E.01663
G1 X136.438 Y140.065 E.26836
G1 X135.901 Y140.065 E.01663
G1 X129.771 Y133.935 E.26836
G1 X129.234 Y133.935 E.01663
G1 X135.363 Y140.065 E.26836
G1 X134.826 Y140.065 E.01663
G1 X128.697 Y133.935 E.26836
G1 X128.159 Y133.935 E.01663
G1 X134.289 Y140.065 E.26836
G1 X133.752 Y140.065 E.01663
G1 X127.622 Y133.935 E.26836
G1 X127.085 Y133.935 E.01663
G1 X133.214 Y140.065 E.26836
G1 X132.677 Y140.065 E.01663
G1 X126.548 Y133.935 E.26836
G1 X126.01 Y133.935 E.01663
G1 X132.14 Y140.065 E.26836
G1 X131.602 Y140.065 E.01663
G1 X125.473 Y133.935 E.26836
G1 X124.936 Y133.935 E.01663
G1 X131.065 Y140.065 E.26836
G1 X130.528 Y140.065 E.01663
G1 X124.398 Y133.935 E.26836
G1 X123.861 Y133.935 E.01663
G1 X129.991 Y140.065 E.26836
G1 X129.453 Y140.065 E.01663
G1 X123.324 Y133.935 E.26836
G1 X122.787 Y133.935 E.01663
G1 X128.916 Y140.065 E.26836
G1 X128.379 Y140.065 E.01663
G1 X122.249 Y133.935 E.26836
G1 X121.712 Y133.935 E.01663
G1 X127.841 Y140.065 E.26836
G1 X127.304 Y140.065 E.01663
G1 X121.175 Y133.935 E.26836
G1 X120.637 Y133.935 E.01663
G1 X126.767 Y140.065 E.26836
G1 X126.23 Y140.065 E.01663
G1 X120.1 Y133.935 E.26836
G1 X119.563 Y133.935 E.01663
G1 X125.692 Y140.065 E.26836
G1 X125.155 Y140.065 E.01663
G1 X119.026 Y133.935 E.26836
G1 X118.488 Y133.935 E.01663
G1 X124.618 Y140.065 E.26836
G1 X124.08 Y140.065 E.01663
G1 X117.951 Y133.935 E.26836
G1 X117.414 Y133.935 E.01663
G1 X123.543 Y140.065 E.26836
G1 X123.006 Y140.065 E.01663
G1 X116.876 Y133.935 E.26836
G1 X116.339 Y133.935 E.01663
G1 X122.468 Y140.065 E.26836
G1 X121.931 Y140.065 E.01663
G1 X115.802 Y133.935 E.26836
G1 X115.265 Y133.935 E.01663
G1 X121.394 Y140.065 E.26836
G1 X120.857 Y140.065 E.01663
G1 X114.727 Y133.935 E.26836
G1 X114.19 Y133.935 E.01663
G1 X120.319 Y140.065 E.26836
G1 X119.782 Y140.065 E.01663
G1 X113.653 Y133.935 E.26836
G1 X113.115 Y133.935 E.01663
G1 X119.245 Y140.065 E.26836
G1 X118.707 Y140.065 E.01663
G1 X112.578 Y133.935 E.26836
G1 X112.041 Y133.935 E.01663
G1 X118.17 Y140.065 E.26836
G1 X117.633 Y140.065 E.01663
G1 X111.504 Y133.935 E.26836
G1 X110.966 Y133.935 E.01663
G1 X117.096 Y140.065 E.26836
G1 X116.558 Y140.065 E.01663
G1 X110.429 Y133.935 E.26836
G1 X109.892 Y133.935 E.01663
G1 X116.021 Y140.065 E.26836
G1 X115.484 Y140.065 E.01663
G1 X109.354 Y133.935 E.26836
G1 X108.817 Y133.935 E.01663
G1 X114.946 Y140.065 E.26836
G1 X114.409 Y140.065 E.01663
G1 X108.28 Y133.935 E.26836
G1 X107.743 Y133.935 E.01663
G1 X113.872 Y140.065 E.26836
G1 X113.335 Y140.065 E.01663
G1 X107.205 Y133.935 E.26836
G1 X106.668 Y133.935 E.01663
G1 X112.797 Y140.065 E.26836
G1 X112.26 Y140.065 E.01663
G1 X106.131 Y133.935 E.26836
G1 X105.593 Y133.935 E.01663
G1 X111.723 Y140.065 E.26836
G1 X111.185 Y140.065 E.01663
G1 X105.056 Y133.935 E.26836
G1 X104.519 Y133.935 E.01663
G1 X110.648 Y140.065 E.26836
G1 X110.111 Y140.065 E.01663
G1 X103.982 Y133.935 E.26836
G1 X103.444 Y133.935 E.01663
G1 X109.574 Y140.065 E.26836
G1 X109.036 Y140.065 E.01663
G1 X102.907 Y133.935 E.26836
G1 X102.37 Y133.935 E.01663
G1 X108.499 Y140.065 E.26836
G1 X107.962 Y140.065 E.01663
G1 X101.832 Y133.935 E.26836
G1 X101.295 Y133.935 E.01663
G1 X107.424 Y140.065 E.26836
G1 X106.887 Y140.065 E.01663
G1 X100.758 Y133.935 E.26836
G1 X100.22 Y133.935 E.01663
G1 X106.35 Y140.065 E.26836
G1 X105.813 Y140.065 E.01663
G1 X99.683 Y133.935 E.26836
G1 X99.146 Y133.935 E.01663
G1 X105.275 Y140.065 E.26836
G1 X104.738 Y140.065 E.01663
G1 X98.935 Y134.262 E.25405
G1 X98.935 Y134.799 E.01663
G1 X104.201 Y140.065 E.23053
G1 X103.663 Y140.065 E.01663
G1 X98.935 Y135.337 E.20701
G1 X98.935 Y135.874 E.01663
G1 X103.126 Y140.065 E.18348
G1 X102.589 Y140.065 E.01663
G1 X98.935 Y136.411 E.15996
G1 X98.935 Y136.948 E.01663
G1 X102.052 Y140.065 E.13644
G1 X101.514 Y140.065 E.01663
G1 X98.935 Y137.486 E.11291
G1 X98.935 Y138.023 E.01663
G1 X100.977 Y140.065 E.08939
G1 X100.44 Y140.065 E.01663
G1 X98.935 Y138.56 E.06586
G1 X98.935 Y139.098 E.01663
G1 X99.902 Y140.065 E.04234
G1 X99.365 Y140.065 E.01663
G1 X98.766 Y139.465 E.02625
; CHANGE_LAYER
; Z_HEIGHT: 36
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X99.365 Y140.065 E-.32216
G1 X99.902 Y140.065 E-.20417
G1 X99.468 Y139.63 E-.23368
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 180/180
; update layer progress
M73 L180
M991 S0 P179 ;notify layer change
; OBJECT_ID: 58
G17
G3 Z36.2 I.133 J1.21 P1  F30000
G1 X157.79 Y133.21 Z36.2
G1 Z36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X157.79 Y140.79 E.23291
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.21 Y140.79 E1.83073
G1 X98.21 Y133.21 E.23291
G1 X157.73 Y133.21 E1.82888
; WIPE_START
M204 S10000
G1 X157.746 Y135.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.213 Y140.583 Z36.4 F30000
G1 Z36
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X157.583 Y140.213 E.01608
G1 X157.583 Y139.679
G1 X156.679 Y140.583 E.03925
G1 X156.146 Y140.583
G1 X157.583 Y139.146 E.06242
G1 X157.583 Y138.613
G1 X155.613 Y140.583 E.0856
G1 X155.08 Y140.583
G1 X157.583 Y138.08 E.10877
G1 X157.583 Y137.546
G1 X154.546 Y140.583 E.13194
G1 X154.013 Y140.583
G1 X157.583 Y137.013 E.15511
G1 X157.583 Y136.48
G1 X153.48 Y140.583 E.17829
M73 P96 R0
G1 X152.947 Y140.583
G1 X157.583 Y135.947 E.20146
G1 X157.583 Y135.413
G1 X152.413 Y140.583 E.22463
G1 X151.88 Y140.583
G1 X157.583 Y134.88 E.2478
G1 X157.583 Y134.347
G1 X151.347 Y140.583 E.27098
G1 X150.814 Y140.583
G1 X157.583 Y133.814 E.29415
G1 X157.446 Y133.417
G1 X150.28 Y140.583 E.31137
G1 X149.747 Y140.583
G1 X156.912 Y133.417 E.31137
G1 X156.379 Y133.417
G1 X149.214 Y140.583 E.31137
G1 X148.681 Y140.583
G1 X155.846 Y133.417 E.31137
G1 X155.313 Y133.417
G1 X148.147 Y140.583 E.31137
G1 X147.614 Y140.583
G1 X154.779 Y133.417 E.31137
G1 X154.246 Y133.417
G1 X147.081 Y140.583 E.31137
G1 X146.547 Y140.583
G1 X153.713 Y133.417 E.31137
G1 X153.179 Y133.417
G1 X146.014 Y140.583 E.31137
G1 X145.481 Y140.583
G1 X152.646 Y133.417 E.31137
G1 X152.113 Y133.417
G1 X144.948 Y140.583 E.31137
G1 X144.414 Y140.583
G1 X151.58 Y133.417 E.31137
G1 X151.046 Y133.417
G1 X143.881 Y140.583 E.31137
G1 X143.348 Y140.583
G1 X150.513 Y133.417 E.31137
G1 X149.98 Y133.417
G1 X142.815 Y140.583 E.31137
G1 X142.281 Y140.583
G1 X149.447 Y133.417 E.31137
G1 X148.913 Y133.417
G1 X141.748 Y140.583 E.31137
G1 X141.215 Y140.583
G1 X148.38 Y133.417 E.31137
G1 X147.847 Y133.417
G1 X140.682 Y140.583 E.31137
G1 X140.148 Y140.583
G1 X147.314 Y133.417 E.31137
G1 X146.78 Y133.417
G1 X139.615 Y140.583 E.31137
G1 X139.082 Y140.583
G1 X146.247 Y133.417 E.31137
G1 X145.714 Y133.417
G1 X138.549 Y140.583 E.31137
G1 X138.015 Y140.583
G1 X145.181 Y133.417 E.31137
G1 X144.647 Y133.417
G1 X137.482 Y140.583 E.31137
G1 X136.949 Y140.583
G1 X144.114 Y133.417 E.31137
G1 X143.581 Y133.417
G1 X136.416 Y140.583 E.31137
G1 X135.882 Y140.583
G1 X143.048 Y133.417 E.31137
G1 X142.514 Y133.417
G1 X135.349 Y140.583 E.31137
G1 X134.816 Y140.583
G1 X141.981 Y133.417 E.31137
G1 X141.448 Y133.417
G1 X134.283 Y140.583 E.31137
G1 X133.749 Y140.583
G1 X140.915 Y133.417 E.31137
G1 X140.381 Y133.417
G1 X133.216 Y140.583 E.31137
G1 X132.683 Y140.583
G1 X139.848 Y133.417 E.31137
G1 X139.315 Y133.417
G1 X132.15 Y140.583 E.31137
G1 X131.616 Y140.583
G1 X138.782 Y133.417 E.31137
G1 X138.248 Y133.417
G1 X131.083 Y140.583 E.31137
G1 X130.55 Y140.583
G1 X137.715 Y133.417 E.31137
G1 X137.182 Y133.417
G1 X130.017 Y140.583 E.31137
G1 X129.483 Y140.583
G1 X136.649 Y133.417 E.31137
G1 X136.115 Y133.417
G1 X128.95 Y140.583 E.31137
G1 X128.417 Y140.583
G1 X135.582 Y133.417 E.31137
G1 X135.049 Y133.417
G1 X127.883 Y140.583 E.31137
G1 X127.35 Y140.583
G1 X134.515 Y133.417 E.31137
G1 X133.982 Y133.417
G1 X126.817 Y140.583 E.31137
G1 X126.284 Y140.583
G1 X133.449 Y133.417 E.31137
G1 X132.916 Y133.417
G1 X125.75 Y140.583 E.31137
M73 P97 R0
G1 X125.217 Y140.583
G1 X132.382 Y133.417 E.31137
G1 X131.849 Y133.417
G1 X124.684 Y140.583 E.31137
G1 X124.151 Y140.583
G1 X131.316 Y133.417 E.31137
G1 X130.783 Y133.417
G1 X123.617 Y140.583 E.31137
G1 X123.084 Y140.583
G1 X130.249 Y133.417 E.31137
G1 X129.716 Y133.417
G1 X122.551 Y140.583 E.31137
G1 X122.018 Y140.583
G1 X129.183 Y133.417 E.31137
G1 X128.65 Y133.417
G1 X121.484 Y140.583 E.31137
G1 X120.951 Y140.583
G1 X128.116 Y133.417 E.31137
G1 X127.583 Y133.417
G1 X120.418 Y140.583 E.31137
G1 X119.885 Y140.583
G1 X127.05 Y133.417 E.31137
G1 X126.517 Y133.417
G1 X119.351 Y140.583 E.31137
G1 X118.818 Y140.583
G1 X125.983 Y133.417 E.31137
G1 X125.45 Y133.417
G1 X118.285 Y140.583 E.31137
G1 X117.752 Y140.583
G1 X124.917 Y133.417 E.31137
G1 X124.384 Y133.417
G1 X117.218 Y140.583 E.31137
G1 X116.685 Y140.583
G1 X123.85 Y133.417 E.31137
G1 X123.317 Y133.417
G1 X116.152 Y140.583 E.31137
G1 X115.619 Y140.583
G1 X122.784 Y133.417 E.31137
G1 X122.251 Y133.417
G1 X115.085 Y140.583 E.31137
G1 X114.552 Y140.583
G1 X121.717 Y133.417 E.31137
G1 X121.184 Y133.417
G1 X114.019 Y140.583 E.31137
G1 X113.486 Y140.583
G1 X120.651 Y133.417 E.31137
G1 X120.118 Y133.417
G1 X112.952 Y140.583 E.31137
G1 X112.419 Y140.583
G1 X119.584 Y133.417 E.31137
G1 X119.051 Y133.417
G1 X111.886 Y140.583 E.31137
G1 X111.352 Y140.583
G1 X118.518 Y133.417 E.31137
G1 X117.984 Y133.417
G1 X110.819 Y140.583 E.31137
G1 X110.286 Y140.583
G1 X117.451 Y133.417 E.31137
G1 X116.918 Y133.417
G1 X109.753 Y140.583 E.31137
G1 X109.219 Y140.583
G1 X116.385 Y133.417 E.31137
G1 X115.851 Y133.417
G1 X108.686 Y140.583 E.31137
G1 X108.153 Y140.583
G1 X115.318 Y133.417 E.31137
G1 X114.785 Y133.417
G1 X107.62 Y140.583 E.31137
G1 X107.086 Y140.583
G1 X114.252 Y133.417 E.31137
G1 X113.718 Y133.417
G1 X106.553 Y140.583 E.31137
G1 X106.02 Y140.583
G1 X113.185 Y133.417 E.31137
G1 X112.652 Y133.417
G1 X105.487 Y140.583 E.31137
G1 X104.953 Y140.583
G1 X112.119 Y133.417 E.31137
G1 X111.585 Y133.417
G1 X104.42 Y140.583 E.31137
G1 X103.887 Y140.583
G1 X111.052 Y133.417 E.31137
G1 X110.519 Y133.417
G1 X103.354 Y140.583 E.31137
G1 X102.82 Y140.583
G1 X109.986 Y133.417 E.31137
G1 X109.452 Y133.417
G1 X102.287 Y140.583 E.31137
M73 P98 R0
G1 X101.754 Y140.583
G1 X108.919 Y133.417 E.31137
G1 X108.386 Y133.417
G1 X101.221 Y140.583 E.31137
G1 X100.687 Y140.583
G1 X107.853 Y133.417 E.31137
G1 X107.319 Y133.417
G1 X100.154 Y140.583 E.31137
G1 X99.621 Y140.583
G1 X106.786 Y133.417 E.31137
G1 X106.253 Y133.417
G1 X99.088 Y140.583 E.31137
G1 X98.554 Y140.583
G1 X105.72 Y133.417 E.31137
G1 X105.186 Y133.417
G1 X98.417 Y140.186 E.29414
G1 X98.417 Y139.653
G1 X104.653 Y133.417 E.27097
G1 X104.12 Y133.417
G1 X98.417 Y139.12 E.2478
G1 X98.417 Y138.587
G1 X103.587 Y133.417 E.22463
G1 X103.053 Y133.417
G1 X98.417 Y138.053 E.20145
G1 X98.417 Y137.52
G1 X102.52 Y133.417 E.17828
G1 X101.987 Y133.417
G1 X98.417 Y136.987 E.15511
G1 X98.417 Y136.453
G1 X101.454 Y133.417 E.13193
G1 X100.92 Y133.417
G1 X98.417 Y135.92 E.10876
G1 X98.417 Y135.387
G1 X100.387 Y133.417 E.08559
G1 X99.854 Y133.417
G1 X98.417 Y134.854 E.06242
G1 X98.417 Y134.32
G1 X99.32 Y133.417 E.03924
G1 X98.787 Y133.417
G1 X98.417 Y133.787 E.01607
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
M204 S10000
G1 X98.787 Y133.417 E-.19876
G1 X99.32 Y133.417 E-.20264
G1 X98.653 Y134.085 E-.3586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I1.217 J0 P1  F30000
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
G1 Z36.5 F900 ; lower z a little
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

    G1 Z136 F600
    G1 Z134

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

