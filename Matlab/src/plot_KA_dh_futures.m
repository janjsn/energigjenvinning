%% ENERGI

figure

x_vec = [2020 2030 2040 2050];

lw = 2;

plot(x_vec, KA_fe_dh_baseline*10^-6,'-o', "LineWidth",lw, "Color","Blue");
hold on
plot(x_vec, KA_fe_dh_max_dh*10^-6, '-o', "LineWidth",lw, "Color", "Red" );
plot(x_vec,KA_fe_dh_max_hp*10^-6, '-o', "LineWidth",lw, "Color", "Magenta");

plot(x_vec, KA_fe_dh_energy_efficiency*10^-6, '-o', "LineWidth",lw, "Color", "Blue", "LineStyle","--");
plot(x_vec, KA_fe_dh_max_dh_energy_efficiency*10^-6, '-o', "LineWidth",lw, "Color", "Red", "LineStyle", "--");
plot(x_vec,KA_fe_dh_max_hp_energy_efficiency*10^-6, '-o', "LineWidth",lw, "Color", "Magenta", "LineStyle","--");


%plot(x_vec, 10^-6*[KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) ], "LineWidth", 2, "Color", "Black", "LineStyle", "-.")

ylim([0 400])

legend({'Baseline', 'Maks fjernvarme', 'Maks varmepumpe', 'Energieffektivisering', 'Maks fjernvarme - energieffektivisering', 'Maks varmepumpe - energieffektivisering'})
ylabel('Gwh');
xlabel('År');

figure

x_vec = [2020 2030 2040 2050];

lw = 2;

plot(x_vec, KA_fe_dh_baseline*10^-6,'-o', "LineWidth",lw, "Color","Blue");
hold on
plot(x_vec, KA_fe_dh_max_dh*10^-6, '-o', "LineWidth",lw, "Color", "Red" );
plot(x_vec,KA_fe_dh_max_hp*10^-6, '-o', "LineWidth",lw, "Color", "Magenta");




%plot(x_vec, 10^-6*[KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) ], "LineWidth", 2, "Color", "Black", "LineStyle", "-.")

ylim([0 400])

legend({'Baseline', 'Maks fjernvarme', 'Maks varmepumpe', 'Energieffektivisering'})
ylabel('Gwh');
xlabel('År');

%% Klimagasser

figure

x_vec = [2020 2030 2040 2050];

lw = 2;

plot(x_vec, KA_fossil_co2em_baseline*10^-3,'-o', "LineWidth",lw, "Color","Blue");
hold on
plot(x_vec, KA_fossil_co2em_max_dh*10^-3, '-o', "LineWidth",lw, "Color", "Red" );
plot(x_vec,KA_fossil_co2em_max_hp*10^-3, '-o', "LineWidth",lw, "Color", "Magenta");

plot(x_vec, KA_fossil_co2em_energy_efficiency*10^-3, '-o', "LineWidth",lw, "Color", "Blue", "LineStyle","--");
plot(x_vec, KA_fossil_co2em_max_dh_energy_efficiency*10^-3, '-o', "LineWidth",lw, "Color", "Red", "LineStyle", "--");
plot(x_vec,KA_fossil_co2em_max_hp_energy_efficiency*10^-3, '-o', "LineWidth",lw, "Color", "Magenta", "LineStyle","--");


%plot(x_vec, 10^-6*[KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) ], "LineWidth", 2, "Color", "Black", "LineStyle", "-.")

ylim([0 60])

legend({'Baseline', 'Maks fjernvarme', 'Maks varmepumpe', 'Energieffektivisering', 'Maks fjernvarme - energieffektivisering', 'Maks varmepumpe - energieffektivisering'})
ylabel('kilotonn fossil CO2');
xlabel('År');

figure

x_vec = [2020 2030 2040 2050];

lw = 2;

plot(x_vec, KA_fossil_co2em_baseline*10^-3,'-o', "LineWidth",lw, "Color","Blue");
hold on
plot(x_vec, KA_fossil_co2em_max_dh*10^-3, '-o', "LineWidth",lw, "Color", "Red" );
plot(x_vec,KA_fossil_co2em_max_hp*10^-3, '-o', "LineWidth",lw, "Color", "Magenta");




%plot(x_vec, 10^-6*[KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) KA_fe_dh_baseline(1) ], "LineWidth", 2, "Color", "Black", "LineStyle", "-.")

ylim([0 60])

legend({'Baseline', 'Maks fjernvarme', 'Maks varmepumpe', 'Energieffektivisering'})
ylabel('kilotonn fossil CO2');
xlabel('År');