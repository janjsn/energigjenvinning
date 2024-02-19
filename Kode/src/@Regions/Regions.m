classdef Regions
    %REGIONS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        region_name
        region_ID
        time
        emission_intensity_avg_electricity_gCO2eq_per_kWh
        emission_intensity_avg_heat_gCO2eq_per_kWh
        
        wi_energy_efficiency_heat = 0.77;
        wi_energy_efficiency_electricity = 0;

        functional_unit = 'Treatment of 1 ton mixed waste'


        %% FROM TREATMENT OF 1 ton waste
        heat_produced_kWh
        electricity_produced_kWh

        %% Emissions
        emissions_to_air_kgCO2

        

        %% Avoided emission
        avoided_emissions_heat_production_gwp100_kgCO2eq
        avoided_emissions_electricity_production_gwp100_kgCO2eq

        %% CCS
        CCS_emissions_to_air_kgCO2

    end
    
    methods

    end
end

