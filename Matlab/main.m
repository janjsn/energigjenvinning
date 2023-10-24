
import_data = 1;
export = 0;

addpath(genpath(pwd()));

% Import data from Lausselet et al. (2022)
if import_data == 1
    data = readtable("Lausselet_data.xlsx", "Sheet","Lausselet et al.");
end


lat = data{:,"lat"};
lon = data{:,"lon"};

bra_bolig = data{:,"BRA_bolig"};
bra_tot = data{:,"BRA_totalt"};

share_bolig = bra_bolig./bra_tot;

fe_dh_2020 = data{:,"FV_b_20a"};
fe_tot_2020 = data{:,"Tot_le_20a"};
dh_share = fe_dh_2020./fe_tot_2020;

fe_dh_2030_baseline = data{:,"FV_b_30a"};
fe_tot_2030_baseline = data{:,"Tot_le_30a"};
fe_dh_2030_energy_efficiency = data{:,"FV_b_30b"};
fe_tot_2030_energy_efficiency = data{:,"Tot_le_30b"};
fe_dh_2030_max_dh = data{:,"FV_b_30c"};
fe_tot_2030_max_dh = data{:,"Tot_le_30c"};
fe_dh_2030_max_dh_energy_efficiency = data{:,"FV_b_30d"};
fe_tot_2030_max_dh_energy_efficiency = data{:,"Tot_le_30d"};
fe_dh_2030_max_hp = data{:,"FV_b_30e"};
fe_tot_2030_max_hp = data{:,"Tot_le_30e"};
fe_dh_2030_max_hp_energy_efficiency = data{:,"FV_b_30f"};
fe_tot_2030_max_hp_energy_efficiency = data{:,"Tot_le_30f"};

fe_dh_2040_baseline = data{:,"FV_b_40a"};
fe_tot_2040_baseline = data{:,"Tot_le_40a"};
fe_dh_2040_energy_efficiency = data{:,"FV_b_40b"};
fe_tot_2040_energy_efficiency = data{:,"Tot_le_40b"};
fe_dh_2040_max_dh = data{:,"FV_b_40c"};
fe_tot_2040_max_dh = data{:,"Tot_le_40c"};
fe_dh_2040_max_dh_energy_efficiency = data{:,"FV_b_40d"};
fe_tot_2040_max_dh_energy_efficiency = data{:,"Tot_le_40d"};
fe_dh_2040_max_hp = data{:,"FV_b_40e"};
fe_tot_2040_max_hp = data{:,"Tot_le_40e"};
fe_dh_2040_max_hp_energy_efficiency = data{:,"FV_b_40f"};
fe_tot_2040_max_hp_energy_efficiency = data{:,"Tot_le_40f"};

fe_dh_2050_baseline = data{:,"FV_b_50a"};
fe_tot_2050_baseline = data{:,"Tot_le_50a"};
fe_dh_2050_energy_efficiency = data{:,"FV_b_50b"};
fe_tot_2050_energy_efficiency = data{:,"Tot_le_50b"};
fe_dh_2050_max_dh = data{:,"FV_b_50c"};
fe_tot_2050_max_dh = data{:,"Tot_le_50c"};
fe_dh_2050_max_dh_energy_efficiency = data{:,"FV_b_50d"};
fe_tot_2050_max_dh_energy_efficiency = data{:,"Tot_le_50d"};
fe_dh_2050_max_hp = data{:,"FV_b_50e"};
fe_tot_2050_max_hp = data{:,"Tot_le_50e"};
fe_dh_2050_max_hp_energy_efficiency = data{:,"FV_b_50f"};
fe_tot_2050_max_hp_energy_efficiency = data{:,"Tot_le_50f"};

built_year = data{:,"Byggeaar"};
demolished_year = data{:,"Rives"};

binary_knowledge_axis = data{:,"Kunnskapsa"};
binary_knowledge_axis = binary_knowledge_axis == 1;

clear("data")

binary_exists_2020 = built_year < 2021;
binary_exists_2030 = built_year < 2031;
binary_exists_2030(demolished_year == 2030) = false;

binary_exists_2040 = built_year < 2041;
binary_exists_2040(demolished_year == 2030) = false;
binary_exists_2040(demolished_year == 2040) = false;

binary_exists_2050 = built_year < 2051;
binary_exists_2050(demolished_year == 2030) = false;
binary_exists_2050(demolished_year == 2040) = false;
binary_exists_2050(demolished_year == 2050) = false;



fe_dh_baseline = [sum(fe_dh_2020(binary_exists_2020)) sum(fe_dh_2030_baseline(binary_exists_2030)) sum(fe_dh_2040_baseline(binary_exists_2040)) sum(fe_dh_2050_baseline(binary_exists_2050))];
fe_dh_energy_efficiency = [sum(fe_dh_2020(binary_exists_2020)) sum(fe_dh_2030_energy_efficiency(binary_exists_2030)) sum(fe_dh_2040_energy_efficiency(binary_exists_2040)) sum(fe_dh_2050_energy_efficiency(binary_exists_2050))];


fe_dh_max_dh = [sum(fe_dh_2020(binary_exists_2020)) sum(fe_dh_2030_max_dh(binary_exists_2030)) sum(fe_dh_2040_max_dh(binary_exists_2040)) sum(fe_dh_2050_max_dh(binary_exists_2050))];
fe_dh_max_dh_energy_efficiency = [sum(fe_dh_2020) sum(fe_dh_2030_max_dh_energy_efficiency(binary_exists_2030)) sum(fe_dh_2040_max_dh_energy_efficiency(binary_exists_2040)) sum(fe_dh_2050_max_dh_energy_efficiency(binary_exists_2050))];

fe_dh_max_hp = [sum(fe_dh_2020(binary_exists_2020)) sum(fe_dh_2030_max_hp(binary_exists_2030)) sum(fe_dh_2040_max_hp(binary_exists_2040)) sum(fe_dh_2050_max_hp(binary_exists_2050))];
fe_dh_max_hp_energy_efficiency = [sum(fe_dh_2020(binary_exists_2020)) sum(fe_dh_2030_max_hp_energy_efficiency(binary_exists_2030)) sum(fe_dh_2040_max_hp_energy_efficiency(binary_exists_2040)) sum(fe_dh_2050_max_hp_energy_efficiency(binary_exists_2050))];

KA_fe_dh_baseline = [sum(fe_dh_2020(binary_exists_2020 & binary_knowledge_axis)) sum(fe_dh_2030_baseline(binary_exists_2030 & binary_knowledge_axis)) sum(fe_dh_2040_baseline(binary_exists_2040 & binary_knowledge_axis)) sum(fe_dh_2050_baseline(binary_exists_2050 & binary_knowledge_axis))];
KA_fe_dh_energy_efficiency = [sum(fe_dh_2020(binary_exists_2020 & binary_knowledge_axis)) sum(fe_dh_2030_energy_efficiency(binary_exists_2030 & binary_knowledge_axis)) sum(fe_dh_2040_energy_efficiency(binary_exists_2040 & binary_knowledge_axis)) sum(fe_dh_2050_energy_efficiency(binary_exists_2050 & binary_knowledge_axis))];


KA_fe_dh_max_dh = [sum(fe_dh_2020(binary_exists_2020 & binary_knowledge_axis)) sum(fe_dh_2030_max_dh(binary_exists_2030 & binary_knowledge_axis)) sum(fe_dh_2040_max_dh(binary_exists_2040 & binary_knowledge_axis)) sum(fe_dh_2050_max_dh(binary_exists_2050 & binary_knowledge_axis))];
KA_fe_dh_max_dh_energy_efficiency = [sum(fe_dh_2020(binary_exists_2020  & binary_knowledge_axis)) sum(fe_dh_2030_max_dh_energy_efficiency(binary_exists_2030 & binary_knowledge_axis)) sum(fe_dh_2040_max_dh_energy_efficiency(binary_exists_2040 & binary_knowledge_axis)) sum(fe_dh_2050_max_dh_energy_efficiency(binary_exists_2050 & binary_knowledge_axis))];

KA_fe_dh_max_hp = [sum(fe_dh_2020(binary_exists_2020 & binary_knowledge_axis)) sum(fe_dh_2030_max_hp(binary_exists_2030 & binary_knowledge_axis)) sum(fe_dh_2040_max_hp(binary_exists_2040 & binary_knowledge_axis)) sum(fe_dh_2050_max_hp(binary_exists_2050 & binary_knowledge_axis))];
KA_fe_dh_max_hp_energy_efficiency = [sum(fe_dh_2020(binary_exists_2020 & binary_knowledge_axis)) sum(fe_dh_2030_max_hp_energy_efficiency(binary_exists_2030 & binary_knowledge_axis)) sum(fe_dh_2040_max_hp_energy_efficiency(binary_exists_2040 & binary_knowledge_axis)) sum(fe_dh_2050_max_hp_energy_efficiency(binary_exists_2050 & binary_knowledge_axis))];


ncid_dem = netcdf.open('data/demografi.nc');
[~,nvars,~,~] = netcdf.inq(ncid_dem);
for i = 1:length(1:nvars)
    varname_this = netcdf.inqVar(ncid_dem,i-1);
    if strcmp(varname_this,'gridx')
        gridx = netcdf.getVar(ncid_dem,i-1);
    elseif strcmp(varname_this,'gridy')
        gridy = netcdf.getVar(ncid_dem,i-1);
    elseif strcmp(varname_this, 'kommune_id')
        kommune_id = netcdf.getVar(ncid_dem,i-1);
    elseif strcmp(varname_this, 'antall_personer')
        population = netcdf.getVar(ncid_dem,i-1);
    end
end

x_buildings = zeros(1,length(lat));
y_buildings = zeros(1,length(lat));

for i = 1:length(lat)
    [x_buildings(i),y_buildings(i),~,~] = wgs2utm(lat(i),lon(i),33,'N');
end

id_Trondheim = 5001;
binary_trd = kommune_id == id_Trondheim;

gridx_trd = gridx(binary_trd);
gridy_trd = gridy(binary_trd);

pop_trd = population(binary_trd);


% Set up Trondhiem UTM grid
gridx_max = max(gridx_trd);
gridx_min = min(gridx_trd);
gridy_max = max(gridy_trd);
gridy_min = min(gridy_trd);

% gridx_b_max = max(x_buildings);
% gridy_b_max = max(y_buildings);
% gridx_b_min = min(x_buildings);
% gridy_b_min = min(y_buildings);

% Grid dimension
margin = 1000;
step = 100;
x_trd = [gridx_min-margin:step:gridx_max+margin];
y_trd = [gridy_max+margin:-step:gridy_min-margin];

trd_bra = zeros(length(x_trd),length(y_trd));
trd_bra_bolig = zeros(length(x_trd),length(y_trd));

trd_fe_dh = zeros(length(x_trd),length(y_trd));
trd_fe_tot = zeros(length(x_trd),length(y_trd));
trd_pop = zeros(length(x_trd),length(y_trd));

trd_lat = zeros(length(x_trd),length(y_trd));
trd_lon = zeros(length(x_trd),length(y_trd));


% Allocate
for i = 1:length(gridx_trd)
    [~,idx_1] = min(abs(gridx_trd(i)-x_trd));
    [~,idx_2] = min(abs(gridy_trd(i)-y_trd));

    trd_pop(idx_1,idx_2) = trd_pop(idx_1,idx_2)+pop_trd(i);
end


for i = 1:length(x_buildings)
    [~,idx_1] = min(abs(x_buildings(i)-x_trd));
    [~,idx_2] = min(abs(y_buildings(i)-y_trd));

    trd_bra(idx_1,idx_2) = trd_bra(idx_1, idx_2) + bra_tot(i);
    trd_bra_bolig(idx_1,idx_2) = trd_bra_bolig(idx_1, idx_2) + bra_bolig(i);
    trd_fe_dh(idx_1, idx_2) = trd_fe_dh(idx_1, idx_2) + fe_dh_2020(i);
    trd_fe_tot(idx_1, idx_2) = trd_fe_tot(idx_1, idx_2) + fe_tot_2020(i);

end


trd_share_bolig = trd_bra_bolig./trd_bra;
trd_share_bolig(isnan(trd_share_bolig)) = -999;

trd_dh_share = trd_fe_dh./trd_fe_tot;
trd_dh_share(isnan(trd_dh_share)) = -999;

trd_fe_dh_bolig = trd_fe_dh.*trd_share_bolig;

for i = 1:length(x_trd)
    for j = 1:length(y_trd)
        [trd_lat(i,j), trd_lon(i,j)] = utm2deg(x_trd(i), y_trd(j), '33 N');
    end
end

%% CALC WASTE
trd_incinerated_waste_ton = 43362; % SSB, 2021
trd_mixed_waste_generated_by_households_ton = 37740;

heat_to_dh_kWh_per_ton_waste = 1912; % Lausselet et al. (2016)
lca_emissions_kgCO2eq_per_ton_waste = 498;
direct_emissions_at_plant_fossil_kgCO2_per_kgWaste = 0.453;
direct_emissions_at_plant_biogenic_kgCO2_per_kgWaste = 0.755;

lca_emissions_waste_kgCO2eq_per_kWh_dh = lca_emissions_kgCO2eq_per_ton_waste/heat_to_dh_kWh_per_ton_waste;

carbon_content_waste = 0.33;

trd_incinerated_waste_ton_per_cap = trd_incinerated_waste_ton/sum(sum(trd_pop));


trd_waste_generation_for_incineration_ton = trd_incinerated_waste_ton_per_cap.*trd_pop;

trd_biogenic_pipe_emissions_ton_CO2eq = trd_waste_generation_for_incineration_ton.*direct_emissions_at_plant_biogenic_kgCO2_per_kgWaste;
trd_fossil_pipe_emissions_ton_CO2 =  trd_waste_generation_for_incineration_ton.*direct_emissions_at_plant_fossil_kgCO2_per_kgWaste;
trd_lca_emissions_waste_treatment_ton_CO2eq = 10^-3*trd_waste_generation_for_incineration_ton.*lca_emissions_kgCO2eq_per_ton_waste;

%% LCA DH
emission_factor_waste_DH_gCO2eq_per_kWh = 216; % Lausselet et al. (2022)

energy_carriers = {'biogas', 'biofuel', 'wood chips', 'el_boiler', 'light_oil', 'lpg', 'heat_from_waste_incineration', 'waste_heat_industry' };
share_energy_carriers_2022 = [0.0058 0.0083 0.0206 0.1528 0.0247 0.0259 0.7612 0.0007 ];
emission_factors_energy_carriers_gCO2eq_per_kWh = [11 4 15 18 286 271 0 0];
emission_factors_energy_carriers_energy_alloc_gCO2eq_per_kWh = [11 4 15 18 286 271 10^3*lca_emissions_waste_kgCO2eq_per_kWh_dh 0];
emission_factors_energy_carriers_50_50_alloc_gCO2eq_per_kWh = [11 4 15 18 286 271 10^3*lca_emissions_waste_kgCO2eq_per_kWh_dh/2 0];

trd_dh_emissions_tonCO2eq = zeros(length(x_trd),length(y_trd));
trd_dh_emissions_energy_alloc_tonCO2eq = zeros(length(x_trd),length(y_trd));
trd_dh_emissions_50_50_alloc_tonCO2eq = zeros(length(x_trd),length(y_trd));

for i = 1:length(share_energy_carriers_2022)
    trd_dh_emissions_tonCO2eq = trd_dh_emissions_tonCO2eq + 10^-6*(trd_fe_dh_bolig.*share_energy_carriers_2022(i).*emission_factors_energy_carriers_gCO2eq_per_kWh(i));
    trd_dh_emissions_energy_alloc_tonCO2eq = trd_dh_emissions_energy_alloc_tonCO2eq + 10^-6*(trd_fe_dh_bolig.*share_energy_carriers_2022(i).*emission_factors_energy_carriers_energy_alloc_gCO2eq_per_kWh(i));
    trd_dh_emissions_50_50_alloc_tonCO2eq = trd_dh_emissions_50_50_alloc_tonCO2eq + 10^-6*(trd_fe_dh_bolig.*share_energy_carriers_2022(i).*emission_factors_energy_carriers_50_50_alloc_gCO2eq_per_kWh(i));

end

binary_no_energy = trd_fe_tot == 0;

trd_dh_emissions_tonCO2eq(binary_no_energy) = -999;
trd_dh_emissions_energy_alloc_tonCO2eq(binary_no_energy) = -999;
trd_dh_emissions_50_50_alloc_tonCO2eq(binary_no_energy) = -999;


% Ratios
ratio_energy_allocation_divided_by_waste_allocation = trd_dh_emissions_energy_alloc_tonCO2eq./(trd_lca_emissions_waste_treatment_ton_CO2eq+trd_dh_emissions_tonCO2eq);
ratio_50_50_allocation_divided_by_waste_allocation = trd_dh_emissions_energy_alloc_tonCO2eq./(trd_lca_emissions_waste_treatment_ton_CO2eq+trd_dh_emissions_tonCO2eq);


sum(sum(trd_dh_emissions_tonCO2eq))
sum(sum(trd_dh_emissions_energy_alloc_tonCO2eq))
sum(sum(trd_lca_emissions_waste_treatment_ton_CO2eq))

%% RUN INCENTIVES CODE
main_incentives

%% Calculate pipe-emissions from district heating
pos_lf = 5;
pos_modern_lf = 4;
pos_wi_oc = 2;
grid_loss = 1-Input.efficiency_district_heating_grid;
energy_share_from_waste_incineration_w_energy_recovery = 0.762;

do_KA_analysis = 0;

if do_KA_analysis == 1
mcs_delivered_heat_dh_mixed_waste_GJ = MCS_output(pos_lf).mass_ratio_displaced_waste_to_incinerated_waste(1)*MCS_output(pos_lf).lhv_displaced_waste_GJ_per_ton(1)*MCS.thermal_energy_efficiency_waste_incineration(1)*(1-grid_loss);
mcs_fossil_carbon_mixed_waste_tonC = MCS_output(pos_lf).mass_ratio_displaced_waste_to_incinerated_waste(1)*MCS_output(pos_lf).fossil_carbon_fraction_displaced_waste_kgC_per_kgWaste(1);
mcs_biogenic_carbon_mixed_waste_tonC = MCS_output(pos_lf).mass_ratio_displaced_waste_to_incinerated_waste(1)*MCS_output(pos_lf).biogenic_carbon_fraction_displaced_waste_kgC_per_kgWaste(1);

mcs_fossil_carbon_dioxide_mixed_waste_tonCO2_per_GJ = mcs_fossil_carbon_mixed_waste_tonC*3.67/mcs_delivered_heat_dh_mixed_waste_GJ;
mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_MJ = mcs_fossil_carbon_dioxide_mixed_waste_tonCO2_per_GJ*10^3;
mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_kWh = 10^6*mcs_fossil_carbon_dioxide_mixed_waste_tonCO2_per_GJ/277.8;

KA_fossil_co2em_baseline = (KA_fe_dh_baseline*energy_share_from_waste_incineration_w_energy_recovery)*(mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_kWh*10^-6);
KA_fossil_co2em_energy_efficiency = (KA_fe_dh_energy_efficiency*energy_share_from_waste_incineration_w_energy_recovery)*(mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_kWh*10^-6);
KA_fossil_co2em_max_hp = (KA_fe_dh_max_hp*energy_share_from_waste_incineration_w_energy_recovery)*(mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_kWh*10^-6);
KA_fossil_co2em_max_hp_energy_efficiency = (KA_fe_dh_max_hp_energy_efficiency*energy_share_from_waste_incineration_w_energy_recovery)*(mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_kWh*10^-6);
KA_fossil_co2em_max_dh = (KA_fe_dh_max_dh*energy_share_from_waste_incineration_w_energy_recovery)*(mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_kWh*10^-6);
KA_fossil_co2em_max_dh_energy_efficiency = (KA_fe_dh_max_dh_energy_efficiency*energy_share_from_waste_incineration_w_energy_recovery)*(mcs_fossil_carbon_dioxide_mixed_waste_gCO2_per_kWh*10^-6);

KA_waste_incinerated_baseline = (KA_fe_dh_baseline*energy_share_from_waste_incineration_w_energy_recovery/277.8)/(MCS_output(pos_lf).lhv_displaced_waste_GJ_per_ton(1)*MCS.thermal_energy_efficiency_waste_incineration(1)*(1-grid_loss));
KA_waste_incinerated_energy_efficiency = (KA_fe_dh_energy_efficiency*energy_share_from_waste_incineration_w_energy_recovery/277.8)/(MCS_output(pos_lf).lhv_displaced_waste_GJ_per_ton(1)*MCS.thermal_energy_efficiency_waste_incineration(1)*(1-grid_loss));
KA_waste_incinerated_max_hp = (KA_fe_dh_max_hp*energy_share_from_waste_incineration_w_energy_recovery/277.8)/(MCS_output(pos_lf).lhv_displaced_waste_GJ_per_ton(1)*MCS.thermal_energy_efficiency_waste_incineration(1)*(1-grid_loss));
KA_waste_incinerated_max_hp_energy_efficiency = (KA_fe_dh_max_hp_energy_efficiency*energy_share_from_waste_incineration_w_energy_recovery/277.8)/(MCS_output(pos_lf).lhv_displaced_waste_GJ_per_ton(1)*MCS.thermal_energy_efficiency_waste_incineration(1)*(1-grid_loss));
KA_waste_incinerated_max_dh = (KA_fe_dh_max_dh*energy_share_from_waste_incineration_w_energy_recovery/277.8)/(MCS_output(pos_lf).lhv_displaced_waste_GJ_per_ton(1)*MCS.thermal_energy_efficiency_waste_incineration(1)*(1-grid_loss));
KA_waste_incinerated_max_dh_energy_efficiency = (KA_fe_dh_max_dh_energy_efficiency*energy_share_from_waste_incineration_w_energy_recovery/277.8)/(MCS_output(pos_lf).lhv_displaced_waste_GJ_per_ton(1)*MCS.thermal_energy_efficiency_waste_incineration(1)*(1-grid_loss));

%% Alternative treatment of KA mixed waste 
mcs_mixed_waste_to_lf_no_ch4_collection_em2air_gwp100 = MCS_output(pos_lf).increased_landfilling_Europe_emissions_to_air_kgCO2eq(1);
mcs_mixed_waste_to_lf_no_ch4_col_stored_biogenic_carbon_gwp100 = MCS_output(pos_lf).increased_landfilling_Europe_biogenic_carbon_stored_kgCO2eq(1);

mcs_mixed_waste_to_modern_lf_em2air_gwp100 = MCS_output(pos_modern_lf).increased_landfilling_Europe_emissions_to_air_kgCO2eq(1);
mcs_mixed_waste_to_modern_lf_stored_biogenic_carbon_gwp100 = MCS_output(pos_modern_lf).increased_landfilling_Europe_biogenic_carbon_stored_kgCO2eq(1);
mcs_mixed_waste_to_modern_lf_replaced_natural_gas_gwp100 = MCS_output(pos_modern_lf).avoided_natural_gas_fossil_electr_production_Europe_kgCO2eq(1);

mcs_mixed_waste_to_lf_no_ch4_collection_em2air_gwp100_per_GJ = mcs_mixed_waste_to_lf_no_ch4_collection_em2air_gwp100/mcs_delivered_heat_dh_mixed_waste_GJ;
mcs_mixed_waste_to_lf_no_ch4_col_strd_bio_carbon_gwp100_per_GJ = mcs_mixed_waste_to_lf_no_ch4_col_stored_biogenic_carbon_gwp100/mcs_delivered_heat_dh_mixed_waste_GJ;

mcs_mixed_waste_to_modern_lf_em2air_gwp100_per_GJ = mcs_mixed_waste_to_modern_lf_em2air_gwp100/mcs_delivered_heat_dh_mixed_waste_GJ;
mcs_mixed_waste_to_modern_lf_stored_biogen_carbon_gwp100_per_GJ = mcs_mixed_waste_to_modern_lf_stored_biogenic_carbon_gwp100/mcs_delivered_heat_dh_mixed_waste_GJ;
mcs_mixed_waste_to_modern_lf_replaced_natural_gas_gwp100_per_GJ = mcs_mixed_waste_to_modern_lf_replaced_natural_gas_gwp100/mcs_delivered_heat_dh_mixed_waste_GJ;
%% BASELINE
KA_alt_treatment_mixed_waste_lf_no_ch4_collection_em2air_gwp100 = mcs_mixed_waste_to_lf_no_ch4_collection_em2air_gwp100_per_GJ*KA_fe_dh_baseline/277.8;
KA_alt_treatment_mixed_waste_lf_no_ch4_col_strd_biog_C_gwp100 = mcs_mixed_waste_to_lf_no_ch4_col_strd_bio_carbon_gwp100_per_GJ*KA_fe_dh_baseline/277.8;


KA_alt_treatment_mixed_waste_modern_lf_em2air_gwp100 = mcs_mixed_waste_to_modern_lf_em2air_gwp100_per_GJ*KA_fe_dh_baseline/277.8;
KA_alt_treatment_mixed_waste_modern_lf_strd_biog_C_gwp100 = mcs_mixed_waste_to_modern_lf_stored_biogen_carbon_gwp100_per_GJ*KA_fe_dh_baseline/277.8;
KA_alt_treatment_mixed_waste_modern_lf_replaced_nat_gas_gwp100 = mcs_mixed_waste_to_modern_lf_replaced_natural_gas_gwp100_per_GJ*KA_fe_dh_baseline/277.8;
%% PER TON WASTE
alt_treatment_mixed_waste_lf_no_ch4_col_em2air_gwp100_per_ton = KA_alt_treatment_mixed_waste_lf_no_ch4_collection_em2air_gwp100/KA_waste_incinerated_baseline;
alt_treatment_mix_waste_lf_no_ch4_col_strd_bio_C_gwp100_per_ton = KA_alt_treatment_mixed_waste_lf_no_ch4_col_strd_biog_C_gwp100/KA_waste_incinerated_baseline;

alt_treatment_mixed_waste_modern_lf_em2air_gwp100_per_ton = KA_alt_treatment_mixed_waste_modern_lf_em2air_gwp100/KA_waste_incinerated_baseline;
alt_treatment_mix_waste_modern_lf_strd_bio_C_gwp100_per_ton = KA_alt_treatment_mixed_waste_modern_lf_strd_biog_C_gwp100/KA_waste_incinerated_baseline;
alt_treatment_mixed_waste_modern_lf_repl_nat_gas_gwp100_per_ton = KA_alt_treatment_mixed_waste_modern_lf_replaced_nat_gas_gwp100/KA_waste_incinerated_baseline;

alt_treatment_mixed_waste_lf_no_ch4_col_net_gwp100_per_ton = alt_treatment_mixed_waste_lf_no_ch4_col_em2air_gwp100_per_ton-alt_treatment_mix_waste_lf_no_ch4_col_strd_bio_C_gwp100_per_ton;
alt_treatment_mixed_waste_modern_lf_net_gwp100_per_ton = alt_treatment_mixed_waste_modern_lf_em2air_gwp100_per_ton-alt_treatment_mix_waste_modern_lf_strd_bio_C_gwp100_per_ton-alt_treatment_mixed_waste_modern_lf_repl_nat_gas_gwp100_per_ton;

wi_em2air_gwp100_kgCO2eq_per_ton = 10^3*MCS_output(pos_lf).fossil_carbon_fraction_displaced_waste_kgC_per_kgWaste(1)*3.67; 
wi_replaced_heat_kgCO2eq_per_ton = (MCS_output(pos_wi_oc).avoided_energy_production_Norway_kgCO2eq(1)*(1-grid_loss))/MCS_output(pos_wi_oc).mass_ratio_displaced_waste_to_incinerated_waste(1);

wi_ccs_biogenic_captured_carbon_kgCO2_per_ton = 10^3*MCS_output(pos_lf).biogenic_carbon_fraction_displaced_waste_kgC_per_kgWaste(1)*3.67*(MCS.ccs_efficiency(1));
wi_ccs_em2air_gwp100_kgCO2eq_per_ton = wi_em2air_gwp100_kgCO2eq_per_ton*(1-MCS.ccs_efficiency(1))+(wi_em2air_gwp100_kgCO2eq_per_ton*MCS.ccs_efficiency(1)*(MCS.CCS_supply_chain_co2_leakage_rate_kgCO2_per_kgCO2(1)+MCS.CCS_transport_emissions_kgCO2eq_per_kgCO2(1)))...
    + wi_ccs_biogenic_captured_carbon_kgCO2_per_ton*MCS.CCS_transport_emissions_kgCO2eq_per_kgCO2(1);

wi_ccs_biogenic_cdr_kgCO2eq_per_ton = wi_ccs_biogenic_captured_carbon_kgCO2_per_ton*(1-MCS.CCS_supply_chain_co2_leakage_rate_kgCO2_per_kgCO2(1));
wi_ccs_replaced_heat_kgCO2eq_per_ton  = wi_replaced_heat_kgCO2eq_per_ton;
end

%% Module B6
Trondheim = Mod_B6;

gwp100_heat_from_dh_facility_kgCO2eq_per_kWh = MCS_output(pos_modern_lf).avoided_incineration_Norway_kgCO2eq./MCS_output(pos_modern_lf).energy_produced_heat_kWh;
gwp100_heat_from_dh_facility_actually_delivered_kgCO2eq_per_kWh = gwp100_heat_from_dh_facility_kgCO2eq_per_kWh./MCS.efficiency_district_heating_grid;
gwp100_heat_from_dh_facility_actually_delivered_std = std(gwp100_heat_from_dh_facility_actually_delivered_kgCO2eq_per_kWh);
gwp100_heat_from_dh_facility_actually_delivered_mean = mean(gwp100_heat_from_dh_facility_actually_delivered_kgCO2eq_per_kWh);

Trondheim.emission_intensity_recovered_heat_gCO2eq_per_kWh = 10^3*gwp100_heat_from_dh_facility_actually_delivered_kgCO2eq_per_kWh(1);
Trondheim.emission_intensity_recovered_heat_gCO2eq_per_kWh_std = 10^3*gwp100_heat_from_dh_facility_actually_delivered_std;
Trondheim.emission_intensity_recovered_heat_gCO2eq_per_kWh_mean = 10^3*gwp100_heat_from_dh_facility_actually_delivered_mean;

Oslo = Trondheim.set_Oslo_parameterization();

Trondheim = Trondheim.calculate_emission_intensity_of_dh;
Oslo = Oslo.calculate_emission_intensity_of_dh;

%wi_heat_produced_kWh_per_ton = 

%% EXPORT

if export == 1
    filename = 'output.nc';
    if exist(filename, 'file')
        delete(filename)
    end




    nccreate(filename, 'X', 'Dimensions', {'X' length(x_trd)});
    ncwriteatt(filename, 'X', 'standard_name', 'UTM 33V X-coordinate')
    ncwriteatt(filename, 'X', 'long_name', 'UTM 33V X-coordinate')

    nccreate(filename, 'Y', 'Dimensions', {'Y' length(y_trd)});
    ncwriteatt(filename, 'Y', 'standard_name', 'UTM 33V Y-coordinate')
    ncwriteatt(filename, 'Y', 'long_name', 'UTM 33V Y-coordinate')

    nccreate(filename,'lat','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'lat', 'standard_name', 'latitude');
    ncwriteatt(filename, 'lat', 'long_name', 'latitude');
    ncwriteatt(filename, 'lat', 'units', 'degrees_north');
    ncwriteatt(filename, 'lat', '_CoordinateAxisType', 'Lat');
    %ncwriteatt(filename, 'lat', 'axis', 'Y');

    nccreate(filename,'lon','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'lon', 'standard_name', 'longitude');
    ncwriteatt(filename, 'lon', 'long_name', 'longitude');
    ncwriteatt(filename, 'lon', 'units', 'degrees_east');
    ncwriteatt(filename, 'lon', '_CoordinateAxisType', 'Lon');
    %ncwriteatt(filename, 'lon', 'axis', 'X');

    ncwrite(filename, 'X', x_trd);
    ncwrite(filename, 'Y', y_trd);
    ncwrite(filename, 'lat', trd_lat);
    ncwrite(filename, 'lon', trd_lon);


    nccreate(filename,'population','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'population', 'standard_name', 'population');
    ncwriteatt(filename, 'population', 'long_name', 'population');
    ncwriteatt(filename, 'population', 'units', 'pop');
    ncwriteatt(filename, 'population', 'missing_value', '-999');

    nccreate(filename,'bra','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'bra', 'standard_name', 'floor_area');
    ncwriteatt(filename, 'bra', 'long_name', 'floor_area');
    ncwriteatt(filename, 'bra', 'units', 'm2');
    ncwriteatt(filename, 'bra', 'missing_value', '-999');

    nccreate(filename,'bra_dwelling','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'bra_dwelling', 'standard_name', 'floor_area_dwellings');
    ncwriteatt(filename, 'bra_dwelling', 'long_name', 'floor_area_dwellings');
    ncwriteatt(filename, 'bra_dwelling', 'units', 'm2');
    ncwriteatt(filename, 'bra_dwelling', 'missing_value', '-999');

    nccreate(filename,'fe_dh','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'fe_dh', 'standard_name', 'final_energy_district_heating');
    ncwriteatt(filename, 'fe_dh', 'long_name', 'final_energy_district_heating');
    ncwriteatt(filename, 'fe_dh', 'units', 'kWh');
    ncwriteatt(filename, 'fe_dh', 'missing_value', '-999');

    nccreate(filename,'fe','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'fe', 'standard_name', 'final_energy');
    ncwriteatt(filename, 'fe', 'long_name', 'final_energy');
    ncwriteatt(filename, 'fe', 'units', 'kWh');
    ncwriteatt(filename, 'fe', 'missing_value', '-999');

    nccreate(filename,'fe_dh_share','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'fe_dh_share', 'standard_name', 'district_heating_share_in_final_energy');
    ncwriteatt(filename, 'fe_dh_share', 'long_name', 'district_heating_share_in_final_energy');
    ncwriteatt(filename, 'fe_dh_share', 'units', '-');
    ncwriteatt(filename, 'fe_dh_share', 'missing_value', '-999');

    nccreate(filename,'dh_emissions_alloc_waste_treatment_tonCO2eq','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'dh_emissions_alloc_waste_treatment_tonCO2eq', 'standard_name', 'dh_emissions_alloc_waste_treatment_tonCO2eq');
    ncwriteatt(filename, 'dh_emissions_alloc_waste_treatment_tonCO2eq', 'long_name', 'dh_emissions_alloc_waste_treatment_tonCO2eq');
    ncwriteatt(filename, 'dh_emissions_alloc_waste_treatment_tonCO2eq', 'units', 'ton CO2eq yr-1');
    ncwriteatt(filename, 'dh_emissions_alloc_waste_treatment_tonCO2eq', 'missing_value', '-999');

    nccreate(filename,'dh_emissions_alloc_50_50_tonCO2eq','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'dh_emissions_alloc_50_50_tonCO2eq', 'standard_name', 'dh_emissions_alloc_50_50_tonCO2eq');
    ncwriteatt(filename, 'dh_emissions_alloc_50_50_tonCO2eq', 'long_name', 'dh_emissions_alloc_50_50_tonCO2eq');
    ncwriteatt(filename, 'dh_emissions_alloc_50_50_tonCO2eq', 'units', 'ton CO2eq yr-1');
    ncwriteatt(filename, 'dh_emissions_alloc_50_50_tonCO2eq', 'missing_value', '-999');

    nccreate(filename,'dh_emissions_alloc_energy_tonCO2eq','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'dh_emissions_alloc_energy_tonCO2eq', 'standard_name', 'dh_emissions_alloc_energy_tonCO2eq');
    ncwriteatt(filename, 'dh_emissions_alloc_energy_tonCO2eq', 'long_name', 'dh_emissions_alloc_energy_tonCO2eq');
    ncwriteatt(filename, 'dh_emissions_alloc_energy_tonCO2eq', 'units', 'ton CO2eq yr-1');
    ncwriteatt(filename, 'dh_emissions_alloc_energy_tonCO2eq', 'missing_value', '-999');



    nccreate(filename,'waste_treatment_emissions','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'waste_treatment_emissions', 'standard_name', 'waste_treatment_emissions');
    ncwriteatt(filename, 'waste_treatment_emissions', 'long_name', 'waste_treatment_emissions');
    ncwriteatt(filename, 'waste_treatment_emissions', 'units', 'ton CO2eq yr-1');
    ncwriteatt(filename, 'waste_treatment_emissions', 'missing_value', '-999');

    nccreate(filename,'ratio_energy_allocation_divided_by_waste_allocation','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'ratio_energy_allocation_divided_by_waste_allocation', 'standard_name', 'ratio_energy_allocation_divided_by_waste_allocation');
    ncwriteatt(filename, 'ratio_energy_allocation_divided_by_waste_allocation', 'long_name', 'ratio_energy_allocation_divided_by_waste_allocation');
    ncwriteatt(filename, 'ratio_energy_allocation_divided_by_waste_allocation', 'units', '-');
    ncwriteatt(filename, 'ratio_energy_allocation_divided_by_waste_allocation', 'missing_value', '-999');

    nccreate(filename,'ratio_50_50_allocation_divided_by_waste_allocation','Dimensions',{'X' length(x_trd) 'Y' length(y_trd) }, 'DeflateLevel', 4);
    ncwriteatt(filename, 'ratio_50_50_allocation_divided_by_waste_allocation', 'standard_name', 'ratio_50_50_allocation_divided_by_waste_allocation');
    ncwriteatt(filename, 'ratio_50_50_allocation_divided_by_waste_allocation', 'long_name', 'ratio_50_50_allocation_divided_by_waste_allocation');
    ncwriteatt(filename, 'ratio_50_50_allocation_divided_by_waste_allocation', 'units', '-');
    ncwriteatt(filename, 'ratio_50_50_allocation_divided_by_waste_allocation', 'missing_value', '-999');
    
    trd_lca_emissions_waste_treatment_ton_CO2eq(trd_pop <= 0) = -999;

    ncwrite(filename, 'bra', trd_bra);
    ncwrite(filename, 'bra_dwelling', trd_bra_bolig);
    ncwrite(filename, 'fe_dh', trd_fe_dh);
    ncwrite(filename, 'fe', trd_fe_tot);
    ncwrite(filename, 'fe_dh_share', trd_dh_share);
    ncwrite(filename, 'population', trd_pop);
    ncwrite(filename, 'dh_emissions_alloc_waste_treatment_tonCO2eq', trd_dh_emissions_tonCO2eq);
    ncwrite(filename, 'dh_emissions_alloc_50_50_tonCO2eq',trd_dh_emissions_50_50_alloc_tonCO2eq);
    ncwrite(filename, 'dh_emissions_alloc_energy_tonCO2eq', trd_dh_emissions_energy_alloc_tonCO2eq);
    ncwrite(filename, 'waste_treatment_emissions', trd_lca_emissions_waste_treatment_ton_CO2eq);
    ncwrite(filename, 'ratio_energy_allocation_divided_by_waste_allocation', ratio_energy_allocation_divided_by_waste_allocation);
    ncwrite(filename, 'ratio_50_50_allocation_divided_by_waste_allocation', ratio_50_50_allocation_divided_by_waste_allocation);

end


