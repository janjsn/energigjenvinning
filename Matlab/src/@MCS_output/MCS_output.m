classdef MCS_output
    %MCS_OUTPUT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        label
        is_fossil_ethylene = 0;
        is_biopolyethylene = 0;
        is_recycling = 0;
        is_incineration = 0;
        incineration_overcapacity = 0;
        waste_replaced_to_European_incineration =0;
        waste_replaced_to_European_landfill = 0;
        waste_replaced_to_European_landfill_without_methane_collection = 0;
        incineration_coupled_to_ccs = 0;

        energy_produced_heat_kWh
        primary_energy_produced_in_Europe_natural_gas_kWh
        electricity_production_Europe_kWh
        electricity_production_from_waste_incineration_Europe_kWh
        electricity_production_from_natural_gas_Europe_kWh

        incineration_Norway_CO2_emitted_to_air_fossil_kgCO2
        incineration_Norway_CO2_emitted_to_air_biogenic_kgCO2       
        incineration_Norway_CO2_removal_biogenic_kgCO2
        incineration_Norway_CO2_fossil_captured_kgCO2

        incineration_Europe_CO2_emitted_to_air_fossil_kgCO2
        incineration_Europe_CO2_emitted_to_air_biogenic_kgCO2       
        incineration_Europe_CO2_removal_biogenic_kgCO2

        landfill_Europe_CH4_emitted_to_air_biogenic_kgCH4
        landfill_Europe_CH4_emitted_to_air_fossil_kgCH4
        landfill_Europe_CO2_emitted_to_air_biogenic_kgCO2
        landfill_Europe_CO2_emitted_to_air_fossil_kgCO2

        landfill_Europe_C_stored_long_term_fossil_kgC
        landfill_Europe_C_stored_long_term_biogenic_kgC

        landfill_gas_CH4_Europe_collected_kgCH4

        lhv_displaced_waste_GJ_per_ton
        carbon_fraction_displaced_waste_kgC_per_kgWaste
        biogenic_carbon_fraction_displaced_waste_kgC_per_kgWaste
        fossil_carbon_fraction_displaced_waste_kgC_per_kgWaste
        biogenic_share_of_all_displaced_carbon_kgC_per_kgC

        electricity_use_CCS_biogenic_CO2_kWh
        electricity_use_CCS_fossil_CO2_kWh

        mass_ratio_displaced_waste_to_incinerated_waste

        % GWP100
        recycling_emissions_incl_pretreatment_kgCO2eq
        local_transportation_during_waste_collection_kgCO2eq
        avoided_polyethylene_production_kgCO2eq
        incineration_Norway_fossil_emissions_kgCO2eq
        avoided_energy_production_Norway_kgCO2eq %% HAVE ANOTHER LOOK AT THIS ONE. MIGHT NOT BE RIGHT TO CONSIDER IF POLYETHYLENE REPLACES MSW AND THEN GIVE CREDIT FOR AVOIDED HP.
        
        avoided_incineration_Norway_kgCO2eq
        increased_incineration_Europe_kgCO2eq
        avoided_waste_transportation_Europe_to_Norway_kgCO2eq
        avoided_average_electricity_production_Europe_kgCO2eq
        increased_landfilling_Europe_emissions_to_air_kgCO2eq
        increased_landfilling_Europe_biogenic_carbon_stored_kgCO2eq
        increased_electricity_production_landfill_gas_Europe_kgCO2eq
        avoided_natural_gas_fossil_electr_production_Europe_kgCO2eq

        %CCS supply chain
        electricity_use_CCS_biogenic_CO2_kgCO2eq
        electricity_use_CCS_fossil_CO2_kgCO2eq
        transport_of_fossil_CO2_to_reservoir_kgCO2eq
        transport_of_biogenic_CO2_to_reservoir_kgCO2eq

        leakage_CCS_supply_chain_biogenic_CO2_kgCO2eq
        leakage_CCS_supply_chain_fossil_CO2_kgCO2eq

        avoided_electricity_use_CCS_biogenic_CO2_kgCO2eq
        avoided_electricity_use_CCS_fossil_CO2_kgCO2eq
        avoided_leakage_CCS_supply_chain_biogenic_CO2_kgCO2eq
        avoided_leakage_CCS_supply_chain_fossil_CO2_kgCO2eq
        avoided_transport_of_fossil_CO2_to_reservoir_kgCO2eq
        avoided_transport_of_biogenic_CO2_to_reservoir_kgCO2eq
        
        
        carbon_dioxide_removal_kgCO2eq
        lost_biogenic_carbon_dioxide_removal_kgCO2eq


        modules_A_C_ghg_emissions_kgCO2eq
        modules_A_C_biogenic_CDR_kgCO2eq
        module_D_avoided_fossil_GHG_emissions_kgCO2eq
        module_D_lost_biogenic_CDR_kgCO2eq

        net_modules_A_D_kgCO2eq

        delta_net_vs_recycling_kgCO2eq
        delta_net_to_recycling_benefit_ratio
        
    end
    
    methods
        
    end
end

