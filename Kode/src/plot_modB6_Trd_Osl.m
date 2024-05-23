function plot_modB6_Trd_Osl(Trondheim, Oslo)

B_cont = Trondheim.B_factor;

COP_hp = [2.25];

lca_em_hp_production_gCO2eq_per_kWh = 21;
lca_em_gshp_production_gCO2eq_per_kWh = 21;

em_hp_nor_ns3720 = zeros(1,length(B_cont));
em_hp_eu_ns3720 = zeros(1,length(B_cont));
em_hp_nor_ns3720_chp_5 = zeros(1,length(B_cont));
em_hp_eu_ns3720_chp_5= zeros(1,length(B_cont));

em_hp_nor_ns3720(1:end) = lca_em_hp_production_gCO2eq_per_kWh + (Trondheim.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh)/COP_hp(1);
em_hp_eu_ns3720(1:end) = lca_em_hp_production_gCO2eq_per_kWh + (Trondheim.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh)/COP_hp(1);

em_hp_nor_ns3720_chp_5(1:end) = lca_em_gshp_production_gCO2eq_per_kWh +(Trondheim.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh)/5;
em_hp_eu_ns3720_chp_5(1:end) = lca_em_gshp_production_gCO2eq_per_kWh +(Trondheim.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh)/5;

% em_hp_g2w_nor_ns3720(1:end) = lca_em_hp_production_gCO2eq_per_kWh + (Trondheim.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh)/COP_hp(2);
% em_hp_g2w_eu_ns3720(1:end) = lca_em_hp_production_gCO2eq_per_kWh + (Trondheim.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh)/COP_hp(2);

% Update CHP for HPs

Trondheim = Trondheim.set_new_heat_pump_COP(COP_hp);
Oslo = Oslo.set_new_heat_pump_COP(COP_hp);

Trondheim = Trondheim.calculate_emission_intensity_of_dh();
Oslo = Oslo.calculate_emission_intensity_of_dh();

plot_2016_values = 0;

if plot_2016_values == 1
Trondheim = Trondheim.set_Trondheim_parameterization_2016;
Oslo = Oslo.set_Oslo_parameterization_2016;

Trondheim = Trondheim.calculate_emission_intensity_of_dh();
Oslo = Oslo.calculate_emission_intensity_of_dh();
end


em_Trd_dh = Trondheim.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;
em_Oslo_dh = Oslo.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;

err_Trd = Trondheim.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Trd_dh;
err_Oslo = Oslo.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Oslo_dh;

figure

colors = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250
    0.4940 0.1840 0.5560
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840];

boundedline(B_cont, em_Trd_dh, 2*err_Trd, 'alpha', 'Color', colors(1,:), 'LineWidth', 2);
hold on
boundedline(B_cont, em_Oslo_dh, 2*err_Oslo, 'alpha', 'Color', colors(2,:), 'LineWidth', 2);

plot(B_cont, em_hp_nor_ns3720, 'LineWidth', 2,'Color', colors(3,:), 'LineStyle', '--');
%plot(B_cont, em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');
plot(B_cont, em_hp_nor_ns3720_chp_5, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');

legend({ '','Fjernvarme - Trondheim',  '','Fjernvarme - Oslo', 'Luft-til-vann varmepumpe', 'Grunnvarmepumpe'} )
box on

ylabel('gCO2eq kWh^{-1}')
xlabel('B')

figure

colors = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250
    0.4940 0.1840 0.5560
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840];

boundedline(B_cont, em_Trd_dh./em_hp_nor_ns3720, 2*err_Trd./em_hp_nor_ns3720, 'alpha', 'Color', colors(1,:), 'LineWidth', 2);
hold on
boundedline(B_cont, em_Oslo_dh./em_hp_nor_ns3720, 2*err_Oslo./em_hp_nor_ns3720, 'alpha', 'Color', colors(2,:), 'LineWidth', 2);

plot(B_cont, em_hp_nor_ns3720./em_hp_nor_ns3720, 'LineWidth', 2,'Color', colors(3,:), 'LineStyle', '--');
%plot(B_cont, em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');
plot(B_cont, em_hp_nor_ns3720_chp_5./em_hp_nor_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');

legend({ '','Fjernvarme - Trondheim',  '','Fjernvarme - Oslo', 'Luft-til-vann varmepumpe', 'Grunnvarmepumpe'} )
box on

ylabel('Relative insentiver for energieffektivisering')
xlabel('B')

%% Norway, european electricity
Trondheim_eur = Trondheim.set_european_electricity_parameterization_and_recalculate;
Oslo_eur = Oslo.set_european_electricity_parameterization_and_recalculate;


em_Trd_dh = Trondheim_eur.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;
em_Oslo_dh = Oslo_eur.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;

err_Trd = Trondheim_eur.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Trd_dh;
err_Oslo = Oslo_eur.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Oslo_dh;

figure

colors = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250
    0.4940 0.1840 0.5560
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840];

boundedline(B_cont, em_Trd_dh, 2*err_Trd, 'alpha', 'Color', colors(1,:), 'LineWidth', 2);
hold on
boundedline(B_cont, em_Oslo_dh, 2*err_Oslo, 'alpha', 'Color', colors(2,:), 'LineWidth', 2);

plot(B_cont, em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(3,:), 'LineStyle', '--');
%plot(B_cont, em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');
plot(B_cont, em_hp_eu_ns3720_chp_5, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');

legend({ '','Fjernvarme - Trondheim',  '','Fjernvarme - Oslo', 'Luft-til-vann varmepumpe', 'Grunnvarmepumpe'} )
box on

ylabel('gCO2eq kWh^{-1}')
xlabel('B')


figure

colors = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250
    0.4940 0.1840 0.5560
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840];

boundedline(B_cont, em_Trd_dh./em_hp_eu_ns3720, 2*err_Trd./em_hp_eu_ns3720, 'alpha', 'Color', colors(1,:), 'LineWidth', 2);
hold on
boundedline(B_cont, em_Oslo_dh./em_hp_eu_ns3720, 2*err_Oslo./em_hp_eu_ns3720, 'alpha', 'Color', colors(2,:), 'LineWidth', 2);

plot(B_cont, em_hp_eu_ns3720./em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(3,:), 'LineStyle', '--');
%plot(B_cont, em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');
plot(B_cont, em_hp_eu_ns3720_chp_5./em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');

legend({ '','Fjernvarme - Trondheim',  '','Fjernvarme - Oslo', 'Luft-til-vann varmepumpe', 'Grunnvarmepumpe'} )
box on

ylabel('I_{E}')
xlabel('B')

%% Plot Sweden
Gothenborg = Trondheim.set_Gothenborg_parameterization();
Gothenborg = Gothenborg.calculate_emission_intensity_of_dh();

em_Gothenborg_dh = Gothenborg.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;
err_Gothenborg_dh = Gothenborg.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Gothenborg_dh;



figure

colors = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250
    0.4940 0.1840 0.5560
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840];

boundedline(B_cont, em_Gothenborg_dh, 2*err_Gothenborg_dh, 'alpha', 'Color', colors(1,:), 'LineWidth', 2);
hold on

em_hp_Swe(1:length(B_cont)) = Gothenborg.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh+lca_em_hp_production_gCO2eq_per_kWh;
em_hp_Swe_chp_5(1:length(B_cont)) = lca_em_hp_production_gCO2eq_per_kWh+Gothenborg.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh*1.3/5;

plot(B_cont,em_hp_Swe , 'LineWidth', 2,'Color', colors(3,:), 'LineStyle', '--');
plot(B_cont, em_hp_Swe_chp_5, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');
ylim([0 250]);
legend({ '','Fjernvarme - Gøteborg',  'Luft-til-vann varmepumpe - svensk elektrisitet', 'Grunnvarmepumpe - svensk elektrisitet'} )
box on
%title('Gothenborg, swedish electricity mix');

ylabel('gCO2eq kWh^{-1}')
xlabel('B')

%% Gothenborg, european el

Gothenborg.emission_intensity_electricity_boiler_gCO2eq_per_kWh = Gothenborg.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh;
Gothenborg.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh = lca_em_hp_production_gCO2eq_per_kWh+Gothenborg.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh/Gothenborg.cop_heat_pump;

Gothenborg = Gothenborg.calculate_emission_intensity_of_dh();

em_Gothenborg_dh = Gothenborg.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;
err_Gothenborg_dh = Gothenborg.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Gothenborg_dh;

figure

colors = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250
    0.4940 0.1840 0.5560
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840];

boundedline(B_cont, em_Gothenborg_dh, 2*err_Gothenborg_dh, 'alpha', 'Color', colors(1,:), 'LineWidth', 2);
hold on

em_hp_eur(1:length(B_cont)) = Gothenborg.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh;

em_hp_eur_chp_5(1:length(B_cont)) = lca_em_hp_production_gCO2eq_per_kWh+Gothenborg.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh/5;

plot(B_cont, em_hp_eur, 'LineWidth', 2,'Color', colors(3,:), 'LineStyle', '--');
plot(B_cont, em_hp_eur_chp_5, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');
ylim([0 250]);


legend({ '','Fjernvarme - Gøteborg', 'Luft-til-vann varmepumpe - europeisk elektrisitet', 'Grunnvarmepumpe - europeisk elektrisitet'} )
box on
%title('Gothenborg, european electricity mix');

ylabel('gCO2eq kWh^{-1}')
xlabel('B')


%% PLOT NATURAL GAS ON THE MARGIN

Trondheim_NG=Trondheim.set_natural_gas_electricity_parameterization_and_recalculate();
Oslo_NG = Oslo.set_natural_gas_electricity_parameterization_and_recalculate();

em_Trd_dh = Trondheim_NG.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;
em_Oslo_dh = Oslo_NG.B_emission_intensity_dh_delivered_heat_mean_gCO2eq_per_kWh;

err_Trd = Trondheim_NG.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Trd_dh;
err_Oslo = Oslo_NG.B_emission_intensity_dh_delivered_heat_gCO2eq_per_kWh_std_high-em_Oslo_dh;

figure

colors = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250
    0.4940 0.1840 0.5560
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840];

boundedline(B_cont, em_Trd_dh, 2*err_Trd, 'alpha', 'Color', colors(1,:), 'LineWidth', 2);
hold on
boundedline(B_cont, em_Oslo_dh, 2*err_Oslo, 'alpha', 'Color', colors(2,:), 'LineWidth', 2);


em_hp_ng(1:length(B_cont)) = Trondheim_NG.emission_intensity_electricity_heat_pump_gCO2eq_per_kWh;
em_hp_ng_cop5(1:length(B_cont)) = Trondheim_NG.emission_intensity_electricity_heat_pump_COP5_gCO2eq_per_kWh;

plot(B_cont, em_hp_ng, 'LineWidth', 2,'Color', colors(3,:), 'LineStyle', '--');
%plot(B_cont, em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');
plot(B_cont, em_hp_ng_cop5, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');

legend({ '','Fjernvarme - Trondheim',  '','Fjernvarme - Oslo', 'Luft-til-vann varmepumpe', 'Grunnvarmepumpe'} )
box on

ylabel('gCO2eq kWh^{-1}')
xlabel('B')
end

