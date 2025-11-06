% --------------------------------------------------
% Hybrid: P0 
% Potential: \Pi_u
% J total angular momentum
% J>0 and L=J
% states named: p_1, d_2,...
% states named2: H2
% computation for charm and bottom quarks
% --------------------------------------------------


mass_c = 1.4702;  % [GeV]
mass_b = 4.8802;  % [GeV]
masses = [mass_c, mass_b];

disp('**************************************************')

Vname_H = '\Pi_u(braaten)';
results_H = [];    % matrix to store results

% Loop over quark masses
addpath('./source')
for im = 1:length(masses)
    mass = masses(im);

    % Loop over total angular momentum J>0
    for J = 1:7

        % Loop over principal quantum number n_H
        for index_n_H = 1:7

            % Hybrid state calculation
            [Energy_H0, Y_H0, x_H0] = hybridP0_equation(mass, J, index_n_H, Vname_H);

            % Integrals
            Int_H0H0  = trapz(x_H0, Y_H0 .* Y_H0);          % normalization
            Int_H0xH0 = trapz(x_H0, Y_H0 .* x_H0 .* Y_H0);  % r expectation

            % Display progress
            fprintf('mass = %.4f GeV | J = %d | n_H = %d | E = %.6f GeV\n', ...
                    mass, J, index_n_H, Energy_H0);

            % Store results: [mass, J, n_H, Energy, <x>, ?Y²dx]
            results_H = [results_H; mass, J, index_n_H, Energy_H0, Int_H0xH0, Int_H0H0];
        end
    end
end


% -------------------------------
% WRITE RESULTS TO .dat FILE
% -------------------------------
filename = 'output/hybridP0_spectrum.dat';
fileID = fopen(filename, 'w');

% Metadata header
fprintf(fileID, '# Hybrid P0 (H2) states generated on %s\n', datestr(now));
fprintf(fileID, '# Potential: %s\n', Vname_H);
fprintf(fileID, '# Quark masses used: ');
fprintf(fileID, '%.4f ', masses);
fprintf(fileID, '[GeV]\n');
fprintf(fileID, '#\n');
fprintf(fileID, '# Columns:\n');
fprintf(fileID, '#   1  mass             (quark mass in GeV)\n');
fprintf(fileID, '#   2  J                (total angular momentum)\n');
fprintf(fileID, '#   3  n_H              (principal quantum number)\n');
fprintf(fileID, '#   4  Energy_H0        (Hybrid energy in GeV)\n');
fprintf(fileID, '#   5  Int Y_H0 x Y_H0  (integral for expected value of position (x); in GeV^-1)\n');
fprintf(fileID, '#   6  Int Y_H0 Y_H0    (Normalization integral, dimensionless)\n');
fprintf(fileID, '# -------------------------------------------------------------------------\n');

% Write data in aligned columns
for i = 1:size(results_H, 1)
    fprintf(fileID, '%8.4f  %3d  %3d  %15.8f  %15.8e  %15.8e\n', ...
        results_H(i,1), results_H(i,2), results_H(i,3), ...
        results_H(i,4), results_H(i,5), results_H(i,6));
end

fclose(fileID);

fprintf('Results saved in: %s\n', filename);

