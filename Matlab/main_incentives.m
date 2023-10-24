addpath(genpath(pwd()));

Input = Namelist;

MCS = Namelist;

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