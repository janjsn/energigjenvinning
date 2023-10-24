function plot_modB6_Trd_Osl(Trondheim, Oslo)

B_cont = Trondheim.B_factor;

COP_hp = 3;
lca_em_hp_production_gCO2eq_per_kWh = 21;

em_hp_nor_ns3720 = zeros(1,length(B_cont));
em_hp_eu_ns3720 = zeros(1,length(B_cont));

em_hp_nor_ns3720(1:end) = lca_em_hp_production_gCO2eq_per_kWh + (Trondheim.emission_intensity_nor_ns3720_2019_2075_gCO2eq_per_kWh)/COP_hp;
em_hp_eu_ns3720(1:end) = lca_em_hp_production_gCO2eq_per_kWh + (Trondheim.emission_intensity_eu28_nor_ns3720_2019_2075_gCO2eq_per_kWh)/COP_hp;


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
plot(B_cont, em_hp_eu_ns3720, 'LineWidth', 2,'Color', colors(4,:), 'LineStyle', '--');

legend({ '','Fjernvarme - Trondheim',  '','Fjernvarme - Oslo', 'Varmepumpe - norsk elektrisitet', 'Varmepumpe - europeisk elektrisitet'} )
box on

ylabel('gCO2eq kWh^{-1}')
xlabel('B')
end

