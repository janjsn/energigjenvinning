classdef Namelist
    %NAMELIST Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        note = 'Values for polyethylene describes low density polyethylene'
        description_vectors = '(1) most likely value, (2) high, (3) low, (4) mean, (5) standard deviation'
        virgin_polyethylene_production_kgco2eq_per_ton = [1900 2300 1400];
        mechanical_recycling_polyethylene_kg_co2eq_per_ton = [51 56 46];
        carbon_content_polyethylene = [0.8585 0.8623 0.8560];
        lower_heating_value_polyethylene = [41.13 44.16 37.44];
        lower_heating_value_methane = 50.06; % Phyllis2
        ccs_efficiency = [0.90 0.95 0.85];
        ccs_electricity_use_kWh_per_kg_CO2 = [0.24 0.28 0.20 ]; %Lausselet et al. (2017)
        local_waste_transport_distance = [30 100 5];
        international_waste_transport_distance = [1500 3000 250];
        road_transport_energy_use_MJ_per_ton_km = [0.811 1.0 0.6];
        emission_intensity_diesel_gCO2eq_per_MJ = 84.2;
        emissions_intensity_ship_freight_container_ship_gCO2eq_p_ton_km = 10^3*[0.0070844 0.010164 0.0070844]
        
        efficiency_district_heating_grid = [0.85 0.90 0.80];

%         msw_share_plastic_mass = [18.0 20.3 8.6];
% %         msw_share_biowaste_mass = [35.0  43.0 26.6];
% %         msw_share_paper_mass = [14.5 15.6 7.4];
%         msw_share_inert_mass = [6.7  11.0 5.5];
%         msw_share_paper = [18.3 18.3 10.5];
%         msw_share_biowaste = [24.8 36.2 17.7]
        
        msw_share_plastic_mass = [0.139 0.179 0.11]; % Avfallsanalyse Oslo og Avfall Norge 2019
        msw_share_inert_mass = [0.079 0.149 0.047];
        msw_share_paper_mass = [0.134 0.21 0.096];
        msw_share_biowaste_mass = [0.354 0.441 0.264];


        plastic_biogenic_fraction_carbon = [0]; % Hellweig (2020), sec author?
        lower_heating_value_mixed_plastics =  [30.79]
        carbon_content_mixed_plastics = [0.634];

        lower_heating_value_biogenic_waste = [5.3];
        carbon_content_biogenic_waste = 0.142;

        lower_heating_value_paper = 14.12
        carbon_content_paper = 0.404;
        biogenic_fraction_paper = 1;

        lower_heating_value_msw = 12.17;
        carbon_content_msw = 0.310;
        biogenic_fraction_msw = 0.52;

        share_of_biogenic_carbon_degradable = 1;
        share_of_fossil_carbon_degradable = 0;
        
        fraction_degradable_organic_carbon_dissimilated = [0.77  0.80 0.6];

        fraction_of_ch4_in_landfill_gas = [0.5 0.6 0.4]; % Rest is CO2.
        landfill_methane_oxidation_factor = [0.1 0.15 0]; % IPCC default = 0, Most industrialized countries use 0.1.
        methane_correction_factor = [1];
        methane_collection_rate = [0.7 0.9 0.5]; % IPCC, Duan et al., Ekvall et al.

        
        thermal_energy_efficiency_waste_incineration = [0.82 0.85 0.78 ];
        heat_pump_efficiency = [3 4 2.5];
        
        efficiency_thermal_power_plant_electricity_waste_incineration = [0.33 0.4 0.3 ];
        efficiency_natural_gas_electricity_production = [0.4 0.438 0.3 ]; % Poullikas et al
        
        lca_emissions_non_energy_heat_pump_gCO2eq_per_kWh = 21;
        
        emission_intensity_norwegian_electricity_gCO2eq_per_kWh = 18; % 31 Scarlat et al, 18 NS3720
        emission_intensity_european_electricity_gCO2eq_per_kWh = 334;
        emission_intensity_natural_gas_gCO2eq_per_kWh = 537;
        emission_intensity_PV_gCO2eq_per_kWh = 31;

        molar_mass_CH4 = 16.043;
        molar_mass_CO2 = 44.01;
        molar_mass_C = 12.01;
        molar_mass_N = 14.0067;
        molar_mass_N2O = 44.013;
        conversion_factor_kWH_per_GJ = 277.8;

        transfer_coefficient_waste_incineration_C_to_air = 0.984;
        
        gwp100_metric_biogenic_ch4 = 34;
        gwp100_metric_fossil_ch4 = 36;
        gwp100_metric_co2 = 1;

        replacement_rate_recycled_polyethylene = [1 1 0.9];

        CCS_supply_chain_co2_leakage_rate_kgCO2_per_kgCO2 = [0.04 0.06 0.018];
        CCS_transport_emissions_kgCO2eq_per_kgCO2 = [0.015 0.020 0.01];
        
     
        binary_avoided_Norwegian_heat_is_electricity_boiler = 0; % OTHERWISE TAKEN AS HEAT PUMP
        binary_avoided_international_waste_transport_is_ship = 1; % OTHERWISE TAKEN AS ROAD TRANSPORT
        
    end
    
    methods

    end
end

