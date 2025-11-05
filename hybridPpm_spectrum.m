% Potential: Coupled hybrid quarkonium (\Sigma_u^- and \Pi_u)
% J total angular momentum
% J>0 and L=J+-1
% states named: (s/d)_1, ()_2,...
% states named2: H1
% computation for charm and bottom quarks
% --------------------------------------------------

clear; clc;

% Define quark masses [GeV]
mass_c = 1.4702;
mass_b = 4.8802;
masses = [mass_c, mass_b];

% Potentials
Vname_S = '\Sigma_u^-(braaten)';
Vname_P = '\Pi_u(braaten)';

% Initialize result storage
results_H = [];

% Create output directory if it doesn't exist
if ~exist('output', 'dir')
    mkdir('output');
end

disp('**************************************************')
disp('Computing coupled hybrid states for potentials \Sigma_u^- and \Pi_u ...')

% Loop over quark masses
for im = 1:length(masses)
    mass = masses(im);

    % Loop over J = 1..7
    for J = 1:7

        % Loop over principal quantum number n_H = 1..7
        for n_H = 1:7

            % Compute hybrid coupled system
            [Energy_Hpm, Y_Hm, Y_Hp, x] = hybridPpm_equation(mass, J, n_H, Vname_S, Vname_P);

            % Compute integrals
            Int_HpxHp = trapz(x, Y_Hp .* x .* Y_Hp);
            Int_HpxHm = trapz(x, Y_Hp .* x .* Y_Hm);
            Int_HmxHm = trapz(x, Y_Hm .* x .* Y_Hm);

            Int_HpHp = trapz(x, Y_Hp .* Y_Hp);
            Int_HpHm = trapz(x, Y_Hp .* Y_Hm);
            Int_HmHm = trapz(x, Y_Hm .* Y_Hm);

            % Display progress
            fprintf('mass = %.4f GeV | J = %d | n_H = %d | E = %.6f GeV\n', ...
                mass, J, n_H, Energy_Hpm);

            % Store results
            results_H = [results_H; mass, J, n_H, Energy_Hpm, ...
                         Int_HpxHp, Int_HpxHm, Int_HmxHm, ...
                         Int_HpHp, Int_HpHm, Int_HmHm];
        end
    end
end

% -------------------------------
% WRITE RESULTS TO .dat FILE
% -------------------------------
filename = 'output/hybridPpm_spectrum.dat';
fileID = fopen(filename, 'w');

% Metadata header
fprintf(fileID, '# Coupled hybrid Ppm results generated on %s\n', datestr(now));
fprintf(fileID, '# Potentials: %s and %s\n', Vname_S, Vname_P);
fprintf(fileID, '# Quark masses used: %.4f %.4f [GeV]\n', masses);
fprintf(fileID, '#\n');
fprintf(fileID, '# Columns:\n');
fprintf(fileID, '#   1  mass         (quark mass in GeV)\n');
fprintf(fileID, '#   2  J            (total angular momentum)\n');
fprintf(fileID, '#   3  n_H          (principal quantum number)\n');
fprintf(fileID, '#   4  Energy_Hpm   (Hybrid coupled-state energy in GeV)\n');
fprintf(fileID, '#   5  Int Y_Hp x Y_Hp       (Integral for expected value of (x); in GeV^-1)\n');
fprintf(fileID, '#   6  Int Y_Hp x Y_Hm       (Integral for expected value of (x); in GeV^-1)\n');
fprintf(fileID, '#   7  Int Y_Hm x Y_Hm       (Integral for expected value of (x); in GeV^-1)\n');
fprintf(fileID, '#   8  Int Y_Hp Y_Hp         (Integral for normalization P+)\n');
fprintf(fileID, '#   9  Int Y_Hp Y_Hm         (Integral for cross term P+ P-)\n');
fprintf(fileID, '#  10  Int Y_Hm Y_Hm         (Integral for normalization P-)\n');
fprintf(fileID, '# -------------------------------------------------------------------------\n');

% Write results
for i = 1:size(results_H, 1)
    fprintf(fileID, ...
        '%8.4f  %3d  %3d  %15.8f  %15.8e  %15.8e  %15.8e  %15.8e  %15.8e  %15.8e\n', ...
        results_H(i,1), results_H(i,2), results_H(i,3), ...
        results_H(i,4), results_H(i,5), results_H(i,6), results_H(i,7), ...
        results_H(i,8), results_H(i,9), results_H(i,10));
end

fclose(fileID);

fprintf('results saved in: %s\n', filename);
