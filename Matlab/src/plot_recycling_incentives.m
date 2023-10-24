function plot_recycling_incentives(MCS_output_array)

%% Compare recycling to incineration across simulations
pos_fos_pe_recycling = find([MCS_output_array.is_recycling] & [MCS_output_array.is_fossil_ethylene]);
pos_bio_pe_recycling = find([MCS_output_array.is_recycling] & [MCS_output_array.is_biopolyethylene]);

net_fos_pe_rec = MCS_output_array(pos_fos_pe_recycling).net_modules_A_D_kgCO2eq(1);
net_bio_pe_rec = MCS_output_array(pos_bio_pe_recycling).net_modules_A_D_kgCO2eq(1);

n_simulations = length(MCS_output_array(pos_fos_pe_recycling).net_modules_A_D_kgCO2eq);

marker_A = [0 0.25 0.5 0.75 1];
B_cont = [0:0.01:1];

figure
c=1;

for i = 1:length(MCS_output_array)

    delta = zeros(length(marker_A),length(B_cont));
    recycling_incentive = zeros(length(marker_A),length(B_cont));
    
    mean_recycling_incentive_across_simulations = zeros(length(marker_A),length(B_cont));
    err_ri = zeros(length(marker_A),length(B_cont));

    if i == pos_fos_pe_recycling
        MCS_output_array(i).delta_net_vs_recycling_kgCO2eq = 1;
        MCS_output_array(i).delta_net_to_recycling_benefit_ratio = NaN;
        continue
    elseif i == pos_bio_pe_recycling
        MCS_output_array(i).delta_net_vs_recycling_kgCO2eq = 1;
        MCS_output_array(i).delta_net_to_recycling_benefit_ratio = NaN;
        continue
    end

    if MCS_output_array(i).is_fossil_ethylene == 1
        for a = 1:length(marker_A)
            for b = 1:length(B_cont)
                delta(a,b) = -MCS_output_array(i).net_modules_A_D_kgCO2eq(1)*(1-B_cont(b))+(net_fos_pe_rec*(1-marker_A(a)));
                recycling_incentive(a,b) = delta(a,b)/net_fos_pe_rec;

                delta_all_simulations = MCS_output_array(pos_fos_pe_recycling).net_modules_A_D_kgCO2eq*(1-marker_A(a))-MCS_output_array(i).net_modules_A_D_kgCO2eq*(1-B_cont(b));
                recycling_incentive_all_simulations = delta_all_simulations./MCS_output_array(pos_fos_pe_recycling).net_modules_A_D_kgCO2eq;
                mean_recycling_incentive_across_simulations(a,b) = mean(recycling_incentive_all_simulations);
                err_ri(a,b) = std(recycling_incentive_all_simulations);

            end
        end
    elseif MCS_output_array(i).is_biopolyethylene == 1
        for a = 1:length(marker_A)
            for b = 1:length(B_cont)
                delta(a,b) = -MCS_output_array(i).net_modules_A_D_kgCO2eq(1)*(1-B_cont(b))+(net_bio_pe_rec*(1-marker_A(a)));

                delta_all_simulations = (MCS_output_array(pos_bio_pe_recycling).net_modules_A_D_kgCO2eq*(1-marker_A(a)))-MCS_output_array(i).net_modules_A_D_kgCO2eq*(1-B_cont(b));

                recycling_incentive(a,b) = delta(a,b)/net_bio_pe_rec;
                recycling_incentive_all_simulations = delta_all_simulations./MCS_output_array(pos_bio_pe_recycling).net_modules_A_D_kgCO2eq;

                mean_recycling_incentive_across_simulations(a,b) = mean(recycling_incentive_all_simulations);
                err_ri(a,b) = std(recycling_incentive_all_simulations);
            end
        end
    end

    colors = [0 0.4470 0.7410
        0.8500 0.3250 0.0980
        0.9290 0.6940 0.1250
        0.4940 0.1840 0.5560
        0.4660 0.6740 0.1880
        0.3010 0.7450 0.9330
        0.6350 0.0780 0.1840];
    
    if length(MCS_output_array) > 9
    subplot(4,4,c);
    elseif length(MCS_output_array) > 4
    subplot(3,3,c)    
    end
    
    c=c+1;
    ylim([-2 6]);

    for a = 1:length(marker_A)
        %plot(B_cont, recycling_incentive(a,:))
        boundedline(B_cont, mean_recycling_incentive_across_simulations(a,:), err_ri(a,:), 'alpha', 'Color', colors(a,:), 'LineWidth', 2);
        
        legend_labels{a} = ['A = ' num2str(marker_A(a))];
        hold on
        box on
    end

    xlabel('B');
    ylabel('I_{R}')
    
    title([MCS_output_array(i).label]);
    legend(legend_labels);


end


end

