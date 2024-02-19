function plot_stacked_bar_charts(MCS_output_array, filename_base)





n_module_groups = 4;

plotMatrix = zeros( length(MCS_output_array),n_module_groups);

nets = zeros(1,length(MCS_output_array));
means = zeros(1,length(MCS_output_array));
std_around_mean   = zeros(1,length(MCS_output_array));

A = [0 0.5 0.587 1];
B = [0 0.3 0.5 0.587 1];

for k_A = 1:length(A)
    for l_B = 1:length(B)
        filename = ['output/' filename_base '_A_' num2str(A(k_A)) '_B_' num2str(B(l_B)) '.pdf'];
        filename_src = ['output/' filename_base '_A_' num2str(A(k_A)) '_B_' num2str(B(l_B)) '.mat']

        if exist(['output/' filename], 'file')
            delete(['output/' filename])
        end

        for i = 1:length(MCS_output_array)


            plotMatrix(i,1) = MCS_output_array(i).modules_A_C_ghg_emissions_kgCO2eq(1);
            plotMatrix(i,2) = MCS_output_array(i).modules_A_C_biogenic_CDR_kgCO2eq(1);
            plotMatrix(i,3) = MCS_output_array(i).module_D_avoided_fossil_GHG_emissions_kgCO2eq(1);
            plotMatrix(i,4) = MCS_output_array(i).module_D_lost_biogenic_CDR_kgCO2eq(1);

            nets(i) = MCS_output_array(i).net_modules_A_D_kgCO2eq(1);
            means(i) = mean([MCS_output_array(i).net_modules_A_D_kgCO2eq]);
            std_around_mean(i) = std([MCS_output_array(i).net_modules_A_D_kgCO2eq]);

            labels{i} = MCS_output_array(i).label;

            x_vec(i) = i;

            if MCS_output_array(i).is_recycling
                plotMatrix(i,:) = plotMatrix(i,:)*(1-A(k_A));
                nets(i) = nets(i)*(1-A(k_A));
                means(i) = means(i)*(1-A(k_A));
                std_around_mean(i) = std_around_mean(i)*(1-A(k_A));

            elseif MCS_output_array(i).is_incineration
                plotMatrix(i,:) = plotMatrix(i,:)*(1-B(l_B));
                nets(i) = nets(i)*(1-B(l_B));
                means(i) = means(i)*(1-B(l_B));
                std_around_mean(i) = std_around_mean(i)*(1-B(l_B));
            end

        end



        figure
        stack = bar(plotMatrix, 'stacked');
        hold on
        xticks([1:1:length(MCS_output_array)]);
        xticklabels(labels);
        ylim([-4000 8000]);

        scatter(x_vec,means,"MarkerEdgeColor", 'blue', 'LineWidth', 1)
        errorbar(x_vec,means, 2*std_around_mean,"Color", 'blue', 'LineWidth', 1, 'LineStyle','none');

        ylabel('kg CO_{2}eq')
        %legend({'Modules A-C, fossile utslipp', 'Moduler A-C, CDR ', 'Modul D, ungåtte/økte fossile utslipp', 'Modul D, mistet/økt CDR', 'Net'}, ...
        %"location", "southoutside")

        title(['A=' num2str(A(k_A)) ' B=' num2str(B(l_B))])

        stack(2).FaceColor = [0.4660 0.6740 0.1880];
        stack(4).FaceColor = [0.4660 0.6740 0.1880];
        stack(1).FaceColor = [.7 .7 .7];
        stack(3).FaceColor = [.7 .7 .7];

        stack(3).LineStyle = '--';
        stack(4).LineStyle = '--';
        stack(3).LineWidth = 2;
        stack(4).LineWidth = 2;
        stack(1).LineWidth = 2;
        stack(2).LineWidth = 2;

        print('-vector','-dpdf', '-r1000', filename);

        save(filename_src, 'plotMatrix', 'nets', 'means', 'std_around_mean');

    end
end

close all

A_cont = [0:0.01:1];
B_cont = [0:0.01:1];

A = [0 0.5 1]




nets_cont = zeros(length(nets),length(A_cont), length(B_cont));
std_cont =  zeros(length(nets),length(A_cont), length(B_cont));
mean_cont =  zeros(length(nets),length(A_cont), length(B_cont));


end

