% ------------------------------------------------------------
% Hybrid (Sigma_u^-) to Quarkonium (Sigma_g^+) decay overlaps
% Includes C coefficient and integral outputs
% ------------------------------------------------------------
clear; clc;

% Quark masses [GeV]
mass_c = 1.4702;
mass_b = 4.8802;
masses = [mass_c, mass_b];

% Potentials
Vname_H_S = '\Sigma_u^-(braaten)';
Vname_H_P = '\Pi_u(braaten)';
Vname_Q   = '\Sigma_g^+(braaten)';

% Number of interpolation points
m_points = 150;

% Create output folder if missing
if ~exist('output', 'dir')
    mkdir('output');
end

disp('**************************************************')
disp('Computing overlaps Hybrid(Sigma_u^- and \Pi_u) to Quarkonium(Sigma_g^+) ...')

% Initialize storage
results = [];

addpath('./source')
for im = 1:length(masses)
    mass = masses(im);

    % Loop over hybrid n_H
    J=1;
        for n_H = 1:3

            % Hybrid state (coupled Sigma_u^- and Pi_u)
            [Energy_Hpm, Y_Hm, Y_Hp, x_Hpm] = hybridPpm_equation(mass, J, n_H, Vname_H_S, Vname_H_P);

            % Loop over quarkonium L and n_Q
            for L = 0:2
                for n_Q = 1:2

                    % Quarkonium state
                    [Energy_Q, Y_Q, x_Q] = quarkonium_equation(mass, L, n_Q, Vname_Q);

                    % Define common interpolation grid
                    new_x = linspace(max(min(x_Hpm), min(x_Q)), ...
                                     min(max(x_Hpm), max(x_Q)), m_points);

                    % Interpolated wavefunctions
                    new_Y_Q  = interp1(x_Q,  Y_Q,  new_x, 'linear', 0);
                    new_Y_Hp = interp1(x_Hpm, Y_Hp, new_x, 'linear', 0);
                    new_Y_Hm = interp1(x_Hpm, Y_Hm, new_x, 'linear', 0);

                    % Overlap integrals
                    Int_HpxQ = trapz(new_x, new_Y_Hp .* new_x .* new_Y_Q);
                    Int_HmxQ = trapz(new_x, new_Y_Hm .* new_x .* new_Y_Q);
                    Int_HpQ  = trapz(new_x, new_Y_Hp .* new_Y_Q);
                    Int_HmQ  = trapz(new_x, new_Y_Hm .* new_Y_Q);
                    Int_QxQ  = trapz(new_x, new_Y_Q  .* new_x .* new_Y_Q);

                    % Energy difference (GeV)
                    DeltaE = Energy_Hpm - Energy_Q;

                    % Derived coefficient C
                    C = 3 * (0.215 * Int_QxQ - 0.028) / DeltaE;

                    % Display progress
                    fprintf('mass=%.4f GeV | J=%d n_H=%d | L=%d n_Q=%d | DeltaE=%.6f GeV | C=%.6e\n', ...
                        mass, J, n_H, L, n_Q, DeltaE, C);

                    % Store results
                    results = [results; mass, J, n_H, L, n_Q, ...
                               Energy_Hpm, Energy_Q, DeltaE, ...
                               Int_HpxQ, Int_HmxQ, Int_HpQ, Int_HmQ, Int_QxQ, C];
                end
            end
        end
    
end

% ------------------------------------------------
% WRITE RESULTS TO FILE
% ------------------------------------------------
filename = 'output/hybridPpm_decay.dat';
fileID = fopen(filename, 'w');

% Metadata header
fprintf(fileID, '# Hybrid(Sigma_u^-) to Quarkonium(Sigma_g^+) overlap results\n');
fprintf(fileID, '# Generated on %s\n', datestr(now));
fprintf(fileID, '# Potentials: %s and %s\n', Vname_H_S, Vname_Q);
fprintf(fileID, '# Quark masses: %.4f %.4f [GeV]\n', masses);
fprintf(fileID, '#\n');
fprintf(fileID, '# Columns:\n');
fprintf(fileID, '#   1  mass       (GeV)\n');
fprintf(fileID, '#   2  J          (hybrid angular momentum)\n');
fprintf(fileID, '#   3  n_H        (hybrid principal quantum number)\n');
fprintf(fileID, '#   4  L          (quarkonium angular momentum)\n');
fprintf(fileID, '#   5  n_Q        (quarkonium principal quantum number)\n');
fprintf(fileID, '#   6  E_H        (hybrid energy, GeV)\n');
fprintf(fileID, '#   7  E_Q        (quarkonium energy, GeV)\n');
fprintf(fileID, '#   8  DeltaE     (E_H - E_Q, GeV)\n');
fprintf(fileID, '#   9  Int_Hp x Q (Hp overlap integral)\n');
fprintf(fileID, '#  10  Int_Hm x Q (Hm overlap integral)\n');
fprintf(fileID, '#  11  Int_Hp Q   (Hp wavefunction overlap)\n');
fprintf(fileID, '#  12  Int_Hm Q   (Hm wavefunction overlap)\n');
fprintf(fileID, '#  13  Int_QxQ    (<r>_Q, expectation value)\n');
fprintf(fileID, '#  14  C          (C = 3*(0.215*<r>_Q - 0.028)/DeltaE)\n');
fprintf(fileID, '# ----------------------------------------------------------\n');

% Data rows
for i = 1:size(results, 1)
    fprintf(fileID, ...
        '%8.4f  %3d  %3d  %3d  %3d  %15.8f  %15.8f  %15.8f  %15.8e  %15.8e  %15.8e  %15.8e  %15.8e  %15.8e\n', ...
        results(i,1), results(i,2), results(i,3), results(i,4), results(i,5), ...
        results(i,6), results(i,7), results(i,8), results(i,9), results(i,10), ...
        results(i,11), results(i,12), results(i,13), results(i,14));
end

fclose(fileID);

fprintf('Results saved in: %s\n', filename);

