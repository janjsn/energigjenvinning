classdef StegmannData
    %STEGMANNDATA Summary of this class goes here
    %   Detailed explanation goes here

    properties
        model
        scenario
        region
        variable
        unit
        time = [2005 2010 2015 2020 2025 2030 2035 2040 2045 2050 2060 2070 2080 2090 2100];
        data
    end

    methods
        function obj = StegmannData(input_file_xls, sheetname)
            data = readtable(input_file_xls, "Sheet",sheetname);
            obj.model = data{:,1};
            obj.scenario = data{:,2};
            obj.region = data{:,3};
            obj.variable = data{:,4};
            obj.unit = data{:,5};
            obj.data = data{:,6:end};
        end

        function Emission_intensities_array = get_emission_intensities(obj)

            n_regions = length(unique(obj.region));

            Emission_intensities_array(1:n_regions) = Emission_intensities;
            Emission_intensities_array_heat_tmp(1:n_regions) = Emission_intensities;

            c1=1;
            c2=1;

            C_to_CO2 = 3.67;
            GJ_to_kWh = 277.778;

            for i = 1:length(obj.variable)
                if strcmp(obj.variable{i}, "Emission Factor|Electricity")
                    Emission_intensities_array(c1).image_region_string = obj.region{i};
                    Emission_intensities_array(c1).scenario = obj.scenario{i};
                    Emission_intensities_array(c1).time = obj.time;
                    Emission_intensities_array(c1).emission_intensity_electricity = obj.data(i,:);
                    Emission_intensities_array(c1).unit_emission_intensity_electricity = 'kgC/GJ';
                    Emission_intensities_array(c1).unit_emission_intensity_heat = 'kgC/GJ';
                    c1=c1+1;
                elseif strcmp(obj.variable{i}, "Emission Factor|Heat")
                    Emission_intensities_array_heat_tmp(c2).image_region_string = obj.region{i};
                    Emission_intensities_array_heat_tmp(c2).scenario = obj.scenario{i};
                    Emission_intensities_array_heat_tmp(c2).time = obj.time;
                    Emission_intensities_array_heat_tmp(c2).emission_intensity_heat = obj.data(i,:);

                    c2=c2+1;
                end

            end
            %% ADD data from tmp to main array
            for i = 1:length(Emission_intensities_array)
                for j = 1:length(Emission_intensities_array_heat_tmp)
                    if strcmp(Emission_intensities_array(i).image_region_string, Emission_intensities_array_heat_tmp(j).image_region_string)
                        if strcmp(Emission_intensities_array(i).scenario, Emission_intensities_array_heat_tmp(j).scenario)
                            
                            Emission_intensities_array(i).emission_intensity_heat = Emission_intensities_array_heat_tmp(j).emission_intensity_heat;

                        end
                    end
                end

                Emission_intensities_array(i).emission_intensity_electricity_gco2eq_per_kWh = 10^3*Emission_intensities_array(i).emission_intensity_electricity*C_to_CO2/GJ_to_kWh;
                Emission_intensities_array(i).emission_intensity_heat_gco2eq_per_kWh = 10^3*Emission_intensities_array(i).emission_intensity_heat*C_to_CO2/GJ_to_kWh;

            end

        end % end function



    end
end

