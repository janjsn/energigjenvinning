classdef Mod_B6
    %MOD_B6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        emission_intensity_recovered_heat_gCO2eq_per_kWh 
        emission_intensity_recovered_heat_gCO2eq_per_kWh_std;
        emission_intensity_recovered_heat_gCO2eq_per_kWh_mean;

        emission_intensity_electricity_boiler_gCO2eq_per_kWh = 31;
        emission_intensity_bioenergy_briquettes_gCO2eq_per_kWh = 15;
        emission_intensity_bioenergy_biooil_gCO2eq_per_kWh = 4;
        emission_intensity_bioenergy_municipal_waste_gCO2eq_per_kWh = 11;
        emission_intensity_natural_gas_gCO2eq_per_kWh = 241;
        emission_intensity_light_oil_gCO2eq_per_kWh = 286;
        emission_intensity_electricity_heat_pump_gCO2eq_per_kWh = 31;
        emission_intensity_bioenergy_pellets_gCO2eq_per_kWh = 13;
        emission_intensity_bioenergy_biogas_gCO2eq_per_kWh = 11;
        emission_intensity_smoke_gas_gCO2eq_per_kWh = 0;
        emission_intensity_drainage_heat_gCO2eq_per_kWh = 0;
        emission_intensity_waste_heat_computer_centre_gCO2eq_per_kWh = 0;

        emission_intensity_norwegian_electricity_gCO2eq_per_kWh = 31;
        emission_intensity_european_electricity_gCO2eq_per_kWh = 334;
        emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh = 136;
        emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh = 18;

        year_FutureBuilt = 2023;
        emission_intensity_dh_FutureBuilt_tech_t_weight_gCO2eq_per_kWh = 0.067*2;
        emission_intensity_el_eu_FutBuilt_tech_t_weight_gCO2eq_per_kWh = 0.071;

        share_recovered_heat = 0.762;
        share_electricity_boiler = 0.153;
        share_bioenergy_briquettes = 0.021;
        share_bioenergy_biooil = 0.008;
        share_bioenergy_pellets = 0;
        share_bioenergy_biogas = 0.006;
        share_natural_gas = 0.026;
        share_light_oil = 0.025;
        share_drainage_heat = 0;
        share_smoke_gas = 0;
        share_waste_heat_computer_centre = 0;
        share_electricity_heat_pump =0;
        
        efficiency_dh_network = 0.85;
        cop_heat_pump = 2.25;
        lca_emissions_other_life_cycle_stages_heat_pump_gCO2eq_per_kWh = 21;

        emission_intensity_dh_delivered_heat_gCO2eq_per_kWh
        emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_low
        emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high

        emission_intensity_weu28_el_dh_del_heat_gCO2eq_per_kWh
        emission_intensity_weu28_el_dh_del_heat_gCO2eq_per_kWh_std_low
        emission_intensity_weu28_el_dh_del_heat_gCO2eq_per_kWh_std_high

        emission_intensity_dh_del_heat_w2030CCS_gCO2eq_per_kWh
        emission_intensity_dh_del_heat_w2030CCS_gCO2eq_per_kWh_std_low
        emission_intensity_dh_del_heat_w2030CCS_gCO2eq_per_kWh_std_high
        
        B_factor = [0:0.01:1];
        B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh
        B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_low
        B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high


        
    end
    
    methods

        function obj = set_european_electricity_parameterization_and_recalculate(obj)
            obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh = obj.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh;
            obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh = obj.lca_emissions_other_life_cycle_stages_heat_pump_gCO2eq_per_kWh+obj.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh/obj.cop_heat_pump;

            obj = obj.calculate_emission_intensity_of_dh;
        end

        function obj = set_norwegian_electricity_parameterization_and_recalculate(obj)
            obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh = obj.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh;
            obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh = obj.lca_emissions_other_life_cycle_stages_heat_pump_gCO2eq_per_kWh+obj.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh/obj.cop_heat_pump;

            obj = obj.calculate_emission_intensity_of_dh;
        end

        function obj = set_new_heat_pump_COP(obj, COP)
            obj.cop_heat_pump = COP;
        end
        
        function obj = set_Oslo_parameterization_2016(obj)

            obj.share_recovered_heat = 0.576;
            obj.share_electricity_boiler = 0.280;
            obj.share_bioenergy_briquettes = 0.0;
            obj.share_bioenergy_biooil = 0.0018;
            obj.share_bioenergy_pellets = 0.0355;
            obj.share_bioenergy_biogas = 0.0;
            obj.share_natural_gas = 0.008;
            obj.share_light_oil = 0.002;
            obj.share_drainage_heat = 0.0;
            obj.share_smoke_gas = 0.0;
            obj.share_waste_heat_computer_centre = 0.054;
            obj.share_electricity_heat_pump = 0.032;
        end
        
        function obj = set_Trondheim_parameterization_2016(obj)

            obj.share_recovered_heat = 0.784;
            obj.share_electricity_boiler = 0.065;
            obj.share_bioenergy_briquettes = 0.021;
            obj.share_bioenergy_biooil = 0;
            obj.share_bioenergy_pellets = 0;
            obj.share_bioenergy_biogas = 0.0044;
            obj.share_natural_gas = 0.114;
            obj.share_light_oil = 0.006;
            obj.share_drainage_heat = 0;
            obj.share_smoke_gas = 0;
            obj.share_waste_heat_computer_centre = 0;
            obj.share_electricity_heat_pump = 0;
        end


        function obj = set_Oslo_parameterization(obj)
            
        obj.share_recovered_heat = 0.560;
        obj.share_electricity_boiler = 0.125;
        obj.share_bioenergy_briquettes = 0.0;
        obj.share_bioenergy_biooil = 0.08;
        obj.share_bioenergy_pellets = 0.107;
        obj.share_bioenergy_biogas = 0.0;
        obj.share_natural_gas = 0.014;
        obj.share_light_oil = 0.001;
        obj.share_drainage_heat = 0.038;
        obj.share_smoke_gas = 0.033;
        obj.share_waste_heat_computer_centre = 0.007;
        obj.share_electricity_heat_pump = 0.034;
        end

        function obj = set_Stockholm_parameterization(obj)
            
        obj.share_recovered_heat = 0.568;
        obj.share_electricity_boiler = 0;
        obj.share_bioenergy_briquettes = 0.0;
        obj.share_bioenergy_biooil = 0.0;
        obj.share_bioenergy_pellets = 0.0;
        obj.share_bioenergy_biogas = 0.0;
        obj.share_natural_gas = 0.0;
        obj.share_light_oil = 0.0;
        obj.share_drainage_heat = 0.0;
        obj.share_smoke_gas = 0.0;
        obj.share_waste_heat_computer_centre = 0.0;
        obj.share_electricity_heat_pump = 0.0;
        end

        function obj = set_Gothenborg_parameterization(obj)
            %% Current source, Holm & Ottosson (2016) - The future development of district heating in Gothenburg
        obj.share_recovered_heat = 0.568;
        obj.share_electricity_boiler = 0;
        obj.share_bioenergy_briquettes = 0.095;
        obj.share_bioenergy_biooil = 0.02;
        obj.share_bioenergy_pellets = 0.031;
        obj.share_bioenergy_biogas = 0.0;
        obj.share_natural_gas = 0.189;
        obj.share_light_oil = 0.0;
        obj.share_drainage_heat = 0.0;
        obj.share_smoke_gas = 0.0;
        obj.share_waste_heat_computer_centre = 0.0;
        obj.share_electricity_heat_pump = 0.116;
        
        obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh = obj.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh*1.3;
        obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh = obj.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh*1.3/obj.cop_heat_pump;

        end
        
        function obj = calculate_emission_intensity_of_dh(obj)

           

            obj.emission_intensity_dh_delivered_heat_gCO2eq_per_kWh = ( obj.emission_intensity_recovered_heat_gCO2eq_per_kWh.*obj.share_recovered_heat ... 
                + obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh*obj.share_electricity_boiler ...
                + obj.share_bioenergy_briquettes*obj.emission_intensity_bioenergy_briquettes_gCO2eq_per_kWh...
                + obj.share_bioenergy_biooil*obj.emission_intensity_bioenergy_biooil_gCO2eq_per_kWh ...
                + obj.share_bioenergy_pellets*obj.emission_intensity_bioenergy_pellets_gCO2eq_per_kWh ...
                + obj.share_bioenergy_biogas*obj.emission_intensity_bioenergy_biogas_gCO2eq_per_kWh ...
                + obj.share_natural_gas*obj.emission_intensity_natural_gas_gCO2eq_per_kWh ...
                + obj.share_light_oil*obj.emission_intensity_light_oil_gCO2eq_per_kWh ...
                + obj.share_smoke_gas*obj.emission_intensity_smoke_gas_gCO2eq_per_kWh ...
                + obj.share_drainage_heat*obj.emission_intensity_drainage_heat_gCO2eq_per_kWh ...
                + obj.share_waste_heat_computer_centre*obj.emission_intensity_waste_heat_computer_centre_gCO2eq_per_kWh ...
                + obj.share_electricity_heat_pump*obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh...
                )/obj.efficiency_dh_network;
                
            obj.emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_low = ( (obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_mean-obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_std).*obj.share_recovered_heat ... 
                + obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh*obj.share_electricity_boiler ...
                + obj.share_bioenergy_briquettes*obj.emission_intensity_bioenergy_briquettes_gCO2eq_per_kWh...
                + obj.share_bioenergy_biooil*obj.emission_intensity_bioenergy_biooil_gCO2eq_per_kWh ...
                + obj.share_bioenergy_pellets*obj.emission_intensity_bioenergy_pellets_gCO2eq_per_kWh ...
                + obj.share_bioenergy_biogas*obj.emission_intensity_bioenergy_biogas_gCO2eq_per_kWh ...
                + obj.share_natural_gas*obj.emission_intensity_natural_gas_gCO2eq_per_kWh ...
                + obj.share_light_oil*obj.emission_intensity_light_oil_gCO2eq_per_kWh ...
                + obj.share_smoke_gas*obj.emission_intensity_smoke_gas_gCO2eq_per_kWh ...
                + obj.share_drainage_heat*obj.emission_intensity_drainage_heat_gCO2eq_per_kWh ...
                + obj.share_waste_heat_computer_centre*obj.emission_intensity_waste_heat_computer_centre_gCO2eq_per_kWh ...
                + obj.share_electricity_heat_pump*obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh...
                )/obj.efficiency_dh_network;

            obj.emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high = ( (obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_mean+obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_std).*obj.share_recovered_heat ... 
                + obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh*obj.share_electricity_boiler ...
                + obj.share_bioenergy_briquettes*obj.emission_intensity_bioenergy_briquettes_gCO2eq_per_kWh...
                + obj.share_bioenergy_biooil*obj.emission_intensity_bioenergy_biooil_gCO2eq_per_kWh ...
                + obj.share_bioenergy_pellets*obj.emission_intensity_bioenergy_pellets_gCO2eq_per_kWh ...
                + obj.share_bioenergy_biogas*obj.emission_intensity_bioenergy_biogas_gCO2eq_per_kWh ...
                + obj.share_natural_gas*obj.emission_intensity_natural_gas_gCO2eq_per_kWh ...
                + obj.share_light_oil*obj.emission_intensity_light_oil_gCO2eq_per_kWh ...
                + obj.share_smoke_gas*obj.emission_intensity_smoke_gas_gCO2eq_per_kWh ...
                + obj.share_drainage_heat*obj.emission_intensity_drainage_heat_gCO2eq_per_kWh ...
                + obj.share_waste_heat_computer_centre*obj.emission_intensity_waste_heat_computer_centre_gCO2eq_per_kWh ...
                + obj.share_electricity_heat_pump*obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh...
                )/obj.efficiency_dh_network;

            obj.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh = ( obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_mean.*obj.share_recovered_heat.*obj.B_factor ... 
                + obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh*obj.share_electricity_boiler ...
                + obj.share_bioenergy_briquettes*obj.emission_intensity_bioenergy_briquettes_gCO2eq_per_kWh...
                + obj.share_bioenergy_biooil*obj.emission_intensity_bioenergy_biooil_gCO2eq_per_kWh ...
                + obj.share_bioenergy_pellets*obj.emission_intensity_bioenergy_pellets_gCO2eq_per_kWh ...
                + obj.share_bioenergy_biogas*obj.emission_intensity_bioenergy_biogas_gCO2eq_per_kWh ...
                + obj.share_natural_gas*obj.emission_intensity_natural_gas_gCO2eq_per_kWh ...
                + obj.share_light_oil*obj.emission_intensity_light_oil_gCO2eq_per_kWh ...
                + obj.share_smoke_gas*obj.emission_intensity_smoke_gas_gCO2eq_per_kWh ...
                + obj.share_drainage_heat*obj.emission_intensity_drainage_heat_gCO2eq_per_kWh ...
                + obj.share_waste_heat_computer_centre*obj.emission_intensity_waste_heat_computer_centre_gCO2eq_per_kWh ...
                + obj.share_electricity_heat_pump*obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh...
                )/obj.efficiency_dh_network;
                
            obj.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_low = ( (obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_mean-obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_std).*obj.share_recovered_heat.*obj.B_factor ... 
                + obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh*obj.share_electricity_boiler ...
                + obj.share_bioenergy_briquettes*obj.emission_intensity_bioenergy_briquettes_gCO2eq_per_kWh...
                + obj.share_bioenergy_biooil*obj.emission_intensity_bioenergy_biooil_gCO2eq_per_kWh ...
                + obj.share_bioenergy_pellets*obj.emission_intensity_bioenergy_pellets_gCO2eq_per_kWh ...
                + obj.share_bioenergy_biogas*obj.emission_intensity_bioenergy_biogas_gCO2eq_per_kWh ...
                + obj.share_natural_gas*obj.emission_intensity_natural_gas_gCO2eq_per_kWh ...
                + obj.share_light_oil*obj.emission_intensity_light_oil_gCO2eq_per_kWh ...
                + obj.share_smoke_gas*obj.emission_intensity_smoke_gas_gCO2eq_per_kWh ...
                + obj.share_drainage_heat*obj.emission_intensity_drainage_heat_gCO2eq_per_kWh ...
                + obj.share_waste_heat_computer_centre*obj.emission_intensity_waste_heat_computer_centre_gCO2eq_per_kWh ...
                + obj.share_electricity_heat_pump*obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh...
                )/obj.efficiency_dh_network;

            obj.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high = ( (obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_mean+obj.emission_intensity_recovered_heat_gCO2eq_per_kWh_std).*obj.share_recovered_heat.*obj.B_factor ... 
                + obj.emission_intensity_electricity_boiler_gCO2eq_per_kWh*obj.share_electricity_boiler ...
                + obj.share_bioenergy_briquettes*obj.emission_intensity_bioenergy_briquettes_gCO2eq_per_kWh...
                + obj.share_bioenergy_biooil*obj.emission_intensity_bioenergy_biooil_gCO2eq_per_kWh ...
                + obj.share_bioenergy_pellets*obj.emission_intensity_bioenergy_pellets_gCO2eq_per_kWh ...
                + obj.share_bioenergy_biogas*obj.emission_intensity_bioenergy_biogas_gCO2eq_per_kWh ...
                + obj.share_natural_gas*obj.emission_intensity_natural_gas_gCO2eq_per_kWh ...
                + obj.share_light_oil*obj.emission_intensity_light_oil_gCO2eq_per_kWh ...
                + obj.share_smoke_gas*obj.emission_intensity_smoke_gas_gCO2eq_per_kWh ...
                + obj.share_drainage_heat*obj.emission_intensity_drainage_heat_gCO2eq_per_kWh ...
                + obj.share_waste_heat_computer_centre*obj.emission_intensity_waste_heat_computer_centre_gCO2eq_per_kWh ...
                + obj.share_electricity_heat_pump*obj.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh...
                )/obj.efficiency_dh_network;

           
        end

    end
end

