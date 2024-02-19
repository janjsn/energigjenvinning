addpath(genpath(pwd()));

pos_lf = 5;
pos_modern_lf = 4;
pos_wi_oc = 2;


Input = Namelist;

do_household_and_CI_waste = 0;
do_only_wood = 0;
do_only_plastic = 0;
do_2035_scen3 = 0;
if do_household_and_CI_waste == 1
        % Data fra Lausselet et al. (2016)
        Input.msw_share_plastic_mass = [0.13];
        Input.msw_share_inert_mass = [0.13];
        Input.msw_share_paper_mass = [0.16];
        Input.msw_share_biowaste_mass = [0.26];
        Input.msw_share_wood_mass = [0.18];

elseif do_only_wood == 1
        Input.msw_share_plastic_mass = [0];
        Input.msw_share_inert_mass = [0];
        Input.msw_share_paper_mass = [0];
        Input.msw_share_biowaste_mass = [0];
        Input.msw_share_wood_mass = [1];

elseif do_only_plastic == 1
    Input.msw_share_plastic_mass = [1];
        Input.msw_share_inert_mass = [0];
        Input.msw_share_paper_mass = [0];
        Input.msw_share_biowaste_mass = [0];
        Input.msw_share_wood_mass = [0];
elseif do_2035_scen3 == 1
    Input.msw_share_plastic_mass = [0.219];
    Input.msw_share_inert_mass = [0.017];
    Input.msw_share_paper_mass = [0.03];
    Input.msw_share_biowaste_mass = [0.135];
    Input.msw_share_wood_mass = [0];
end

MCS = Input;

n_simulations = 10000;

n_steps = 200;

peak_location = 1;
min_location = 3;
max_location = 2;

fields = fieldnames(Input);


% Generate parameters through Monte Carlo Simulation. Triangular
% distribution.
for i = 3:length(fields)
    fields{i}
    var = Input.(fields{i});
    if length(Input.(fields{i})) == 3
        step = abs(var(max_location)-var(min_location))/n_steps;

        x = [var(min_location):step:var(max_location)];
        pd = makedist("Triangular", "a", var(min_location), "b", var(peak_location), "c", var(max_location));
        cdf_this = cdf(pd,x);
        
        rng(i, 'philox');
        random_seed = rand(1,n_simulations);

        output_this = zeros(1,n_simulations);
        for sims = 1:n_simulations
            [~,idx_this] = min(abs(cdf_this-random_seed(sims)));
            output_this(sims) = x(idx_this);

        end

        output_this(1) = var(peak_location);
    else
        
        output_this = zeros(1,n_simulations);
        output_this(1:end) = var(peak_location);
    end

    MCS.(fields{i}) = output_this;
end


MCS_output = do_MCS(MCS);