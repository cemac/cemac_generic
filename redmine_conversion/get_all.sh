#!/bin/bash

siteaddress='https://www.see.leeds.ac.uk/redmine/public/projects/glamleeds/wiki/'

# To get past login page, bring up your browsers consol and select network, click on a link
# right click on a "file" and select copy as cCURL
# copy and paste the command below
# Do not versiosn control this command
# Remove the bit before -H as we will alter the addresss in the script
curloptions=

echo "glamleeds pages"
# A script to download all the wiki pages of a redmine
declare -a  Wikipages=("Background" "TDS_(terminal_drought_stress)" "Calculations_order_each_day" "Shape_of_thermal_time_calculation_function" "Calculation_root_length_density_at_the_surface" "Lethal_temperatures" "Including_intelligent_emergence" "Calculation_of_Biomass" "Water_stress_around_flowering" "GLAM-maize_options_for_simulating_phenology" "GLAM-wspr_increased_senescence_with_high_temperatures" "Option_harvest_if_LAI=0_(all_crops)" "Running_water_balance_before_start_of_intelligent_planting_window" "Temperature-water_limited_intelligent_planting_window" "Water_Harvesting_routine" "Supplementary_Irrigation_routine" "Biomass_reduction_due_to_leaf_senescence" "Issues__Development" "CEMAC_work_with_GLAM" "SLA_control" "Suleiman_Ritchie_2001_ASAE.pdf" "Hughes_MResPresentation.pptx" "VPD-Discussions.pptx_" "Medlyn.pdf" "HHughes_HHughes_Thesis_Final.pdf" "Draft_results_section_JGS.docx" "Jack_Gerrard-stevenson-Gerrard-Stevenson_Jack_SOEE3030_Dissertation.pdf" "Specific_GLAM_versions" "GLAM-Soybean" "GLAM-ROC" "GLAM-PARTI" "GLAM-classic_(saved_version_before_GLAM-PARTI_added_to_repository)" "GLAM-Millet" "GLAM-NITRO" "Group_meetings" "Topic_discussions" "Group_strategy" "Criteria_for_choosing_climate_ensembles" "Land_use" "Food_systems" "climate_model_data_and_bias_correction__downscaling_and_scenarios" "Transformation_Adaptation" "Detrending_yield_data" "Improved_use_of_observed_data" "Notes_from_Ann_on_remote_sensing_from_2012" "LindsayLee_PNAS_submissionpdf.pdf" "remotesensing_india_cd.pptx" "Carbon_cycling_of_European_croplands_A_framework_for_the_assimilation.pdf" "Rocha2009.pdf_" "Guests" "Group_skills_and_current_work_chat" "Summer_meeting" "CIG_Intro_Conference" "Climate_smart_agriculture" "Past_work" "Group_EQUIP_password" "Old_Current_Work_Page" "Unilever_final_report.pdf_" "Topics_we_are_currently_working_on" "Interesting_people" "Publications_and_Reports" "Journal_Articles" "Master_Thesis" "PhD_Dissertation" "Reports" "200886240_dissertation_starbuck.pdf" "Crop_Modelling_Koehler_Cahllinor_2017.pdf" "Food-An_Atlas.pdf" "Ideas_for_Projects" "3rd_Year_Undergrad_Project" "3rd_Year_Undergrad_Projects" "Ummar_Kasujee_-_heat_stress_in_GLAM" "PhD_Project" "Funding_Ideas" "Speculative_Ideas" "Key_concepts" "Current_Projects" "Ag-impactsorg" "Tutorial_bulk_upload.pdf" "Tutorial_individual_study.pdf" "Methods_for_global_crop_modelling" "Soil_codes_from_FAO_Digital_Soil_Map_of_the_World" "Make_soil_files_code.zip" "Python_interface_to_GLAM" "eg-fig.png" "Software_Tools" "view_spatial.py" "view_spatial_thumbnail.png" "view_spatial_test.txt" "optimiser.py" "glam_V3.py" "Analogue_tool" "Summary_of_expertise_within_the_group" "List_of_data_from_Jim_Hansen_at_the_IRI" "Jones_Thornton_soils_2015.pdf" "Sources_of_Input_data_and_observed_yield_data" "Preparation_of_input_data" "Detrending_yield_data" "Criteria_for_choosing_climate_ensembles" "Climate_model_data_and_bias_correction__downscaling_and_scenarios" "Data")

for val in ${Wikipages[@]}; do
  echo ${siteaddress}${val}'.txt'
  curl ${siteaddress}${val}'.txt' ${curloptions} > ${val}.txt
  echo ${val}'.txt'
done

echo "glam pages"
siteaddress='https://www.see.leeds.ac.uk/redmine/public/projects/glam/wiki/'
declare -a  Wikipages=("Contents_of_the_GLAM_zip_file" "Quick_Start_Guide" "Input_files" "Model_run_modes_and_output_files" "FAQ" "Troubleshooting" "Contacts" "References" "Answers_to_test_questions" "Using_Subversion_with_GLAM" "Introduction" "Baseline_simulations" "Future_climate_simulations" "Discussion_questions" "Worksheet_and_GLAM_model" "Model_run_modes_and_output_files" "Input_files" "Answers_to_test_questions")


for val in ${Wikipages[@]}; do
  echo ${siteaddress}${val}'.txt'
  curl ${siteaddress}${val}'.txt' ${curloptions} > ${val}.txt
  echo ${val}'.txt'
done
