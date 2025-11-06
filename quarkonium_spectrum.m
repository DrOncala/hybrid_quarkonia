% --------------------------------------------------
% Quarkonium 
% Potential: \Sigma_g^+ 
% L angular momentum
% states named: s,p,d
% computation for charm and bottom quarks
% --------------------------------------------------

mass_c = 1.4702;  % [GeV]
mass_b = 4.8802;  % [GeV]
masses = [mass_c, mass_b];

Vname_Q = '\Sigma_g^+(braaten)';
disp('**************************************************')

results = []; % matrix to store results
addpath('./source')
for im = 1:length(masses)
    mass = masses(im);

    for L = 0:7
        for index_n = 1:7
            [Energy_Q, Y_Q, x] = quarkonium_equation(mass, L, index_n, Vname_Q);

            % Compute integrals
            int_QxQ = trapz(x, Y_Q .* x .* Y_Q);  % <x>
            int_QQ  = trapz(x, Y_Q .* Y_Q);       % normalization test

            % Display progress
            fprintf('mass = % .4f GeV | L = % d | n = % d | E = % .6f GeV \n', ...
                    mass, L, index_n, Energy_Q);

            % Store results:
            % [mass(GeV), L, n, Energy(GeV), <x>(GeV^-1), ?Y2dx]
            results = [results; mass, L, index_n, Energy_Q, int_QxQ, int_QQ];
        end
    end
end

% -------------------------------
% WRITE RESULTS TO .dat FILE
% -------------------------------
filename = 'output/quarkonium_spectrum.dat';
fileID = fopen(filename, 'w');

% Metadata header
fprintf(fileID, '# Quarkonium results generated on %s\n', datestr(now));
fprintf(fileID, '# Potential: %s\n', Vname_Q);
fprintf(fileID, '# Quark masses used: %.4f %.4f [GeV]\n', masses);
fprintf(fileID, '#\n');
fprintf(fileID, '# Columns:\n');
fprintf(fileID, '#   1  mass          (quark mass in GeV)\n');
fprintf(fileID, '#   2  L             (angular momentum quantum number)\n');
fprintf(fileID, '#   3  n             (principal quantum number)\n');
fprintf(fileID, '#   4  Energy_Q      (Energy in GeV)\n');
fprintf(fileID, '#   5  Int Y_Q x Y_Q (Integral for expected value of position (x); in GeV^-1)\n');
fprintf(fileID, '#   6  Int Y_Q Y_Q   (Normalization integral, dimensionless)\n');
fprintf(fileID, '# -------------------------------------------------------------------------\n');

% Data columns (space-separated)
for i = 1:size(results, 1)
    fprintf(fileID, '%8.4f  %3d  %3d  %15.8f  %15.8e  %15.8e \n', ...
        results(i,1), results(i,2), results(i,3), results(i,4), results(i,5), results(i,6));
end

fclose(fileID);

fprintf('Results saved in: %s\n', filename);

