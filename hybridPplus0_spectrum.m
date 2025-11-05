% --------------------------------------------------
% Hybrid: P+0 
% Potential: ?_u^- 
% J total angular momentum
% J=0 and L=J+1
% states named: p_0
% states named2: H3
% computation for charm and bottom quarks
% --------------------------------------------------

clear; clc;

% Define quark masses [GeV]
mass_c = 1.4702;
mass_b = 4.8802;
masses = [mass_c, mass_b];

% Quantum numbers
J = 0;                          % fixed total angular momentum
Vname_H = '\Sigma_u^-(braaten)'; % potential name

% Initialize results array
results_H = [];

% Create output directory if it doesn't exist
if ~exist('output', 'dir')
    mkdir('output');
end

disp('**************************************************')

% Loop over masses
for im = 1:length(masses)
    mass = masses(im);

    % Loop over principal quantum number n_H = 1,...,7
    for n_H = 1:7

        % Solve hybrid state equation
        [Energy_H, Y_H, x_H] = hybridPplus0_equation(mass, n_H, Vname_H);

        % Compute integrals
        Int_HxH = trapz(x_H, Y_H .* x_H .* Y_H);  % <r>
        Int_HH  = trapz(x_H, Y_H .* Y_H);         % normalization check

        % Display progress
        fprintf('mass = %.4f GeV | J = %d | n_H = %d | E = %.6f GeV\n', ...
                mass, J, n_H, Energy_H);

        % Store results
        results_H = [results_H; mass, J, n_H, Energy_H, Int_HxH, Int_HH];
    end
end

% -------------------------------
% WRITE RESULTS TO .dat FILE
% -------------------------------
filename = 'output/hybridPplus0_spectrum.dat';
fileID = fopen(filename, 'w');

% Metadata header
fprintf(fileID, '# Hybrid P+0 (H3) states generated on %s\n', datestr(now));
fprintf(fileID, '# Potential: %s\n', Vname_H);
fprintf(fileID, '# Quark masses used: %.4f %.4f [GeV]\n', masses);
fprintf(fileID, '#\n');
fprintf(fileID, '# Columns:\n');
fprintf(fileID, '#   1  mass          (quark mass in GeV)\n');
fprintf(fileID, '#   2  J             (total angular momentum)\n');
fprintf(fileID, '#   3  n_H           (principal quantum number)\n');
fprintf(fileID, '#   4  Energy_H      (Hybrid energy in GeV)\n');
fprintf(fileID, '#   5  Int Y_H x Y_H (Integral for expected value of position (x); in GeV^-1)\n');
fprintf(fileID, '#   6  Int Y_H Y_H   (Normalization integral, dimensionless)\n');
fprintf(fileID, '# -------------------------------------------------------------------------\n');

% Write results
for i = 1:size(results_H, 1)
    fprintf(fileID, '%8.4f  %3d  %3d  %15.8f  %15.8e  %15.8e\n', ...
        results_H(i,1), results_H(i,2), results_H(i,3), ...
        results_H(i,4), results_H(i,5), results_H(i,6));
end

fclose(fileID);

fprintf('Results saved in: %s\n', filename);
