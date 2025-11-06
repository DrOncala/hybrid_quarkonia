% --------------------------------------------------
% Hybrid \Pi_u Quarkonium decay overlap computation
% with C coefficient: confining vs coulomb potential
% --------------------------------------------------
clear; clc;

% Quark masses [GeV]
mass_c = 1.4702;
mass_b = 4.8802;
masses = [mass_c, mass_b];

% Potentials
Vname_H = '\Pi_u(braaten)';
Vname_Q = '\Sigma_g^+(braaten)';

% Number of interpolation points
m_points = 150;

% Initialize storage
results = [];

% Create output folder if missing
if ~exist('output', 'dir')
    mkdir('output');
end

disp('**************************************************')
disp('Computing overlaps Hybrid(\Pi_u) to Quarkonium(\Sigma_g^+) ...')

% Loop over quark masses
addpath('./source')
for im = 1:length(masses)
    mass = masses(im);

    J=1;
        for n_H = 1:3

            % Compute hybrid state
            [Energy_H, Y_H, x_H] = hybridP0_equation(mass, J, n_H, Vname_H);

            % Quarkonium: L = 0..3, n_Q = 1..3
            for L = 0:2
                for n_Q = 1:2

                    % Compute quarkonium state
                    [Energy_Q, Y_Q, x_Q] = quarkonium_equation(mass, L, n_Q, Vname_Q);

                    % Interpolate both wavefunctions on a common grid
                    new_x = linspace(max(min(x_H), min(x_Q)), ...
                                     min(max(x_H), max(x_Q)), m_points);

                    new_Y_H = interp1(x_H, Y_H, new_x, 'linear', 0);
                    new_Y_Q = interp1(x_Q, Y_Q, new_x, 'linear', 0);

                    % Integrals for decay overlap
                    Int_HxQ = trapz(new_x, new_Y_H .* new_x .* new_Y_Q);
                    Int_HQ  = trapz(new_x, new_Y_H .* new_Y_Q);
                    Int_QxQ = trapz(new_x, new_Y_Q .* new_x .* new_Y_Q); % <r>_Q

                    % Energy difference (GeV)
                    DeltaE = Energy_H - Energy_Q;

                    % Derived coefficient C
                    C = 3 * (0.215 * Int_QxQ - 0.028) / DeltaE;

                    % Display progress
                    fprintf('mass=%.4f GeV | J=%d n_H=%d | L=%d n_Q=%d | DeltaE=%.6f GeV | C=%.6e\n', ...
                            mass, J, n_H, L, n_Q, DeltaE, C);

                    % Store results
                    results = [results; mass, J, n_H, L, n_Q, ...
                               Energy_H, Energy_Q, DeltaE, ...
                               Int_HxQ, Int_HQ, Int_QxQ, C];
                end
            end
        end
    
end

% -------------------------------
% WRITE RESULTS TO .dat FILE
% -------------------------------
filename = 'output/hybridP0_decay.dat';
fileID = fopen(filename, 'w');

% Metadata header
fprintf(fileID, '# Hybrid to Quarkonium overlap results with C coefficient\n');
fprintf(fileID, '# Generated on %s\n', datestr(now));
fprintf(fileID, '# Hybrid potential: %s\n', Vname_H);
fprintf(fileID, '# Quarkonium potential: %s\n', Vname_Q);
fprintf(fileID, '# Quark masses used: %.4f %.4f [GeV]\n', masses);
fprintf(fileID, '#\n');
fprintf(fileID, '# Columns:\n');
fprintf(fileID, '#   1  mass        (GeV)\n');
fprintf(fileID, '#   2  J           (hybrid angular momentum)\n');
fprintf(fileID, '#   3  n_H         (hybrid principal quantum number)\n');
fprintf(fileID, '#   4  L           (quarkonium angular momentum)\n');
fprintf(fileID, '#   5  n_Q         (quarkonium principal quantum number)\n');
fprintf(fileID, '#   6  E_H         (hybrid energy in GeV)\n');
fprintf(fileID, '#   7  E_Q         (quarkonium energy in GeV)\n');
fprintf(fileID, '#   8  DeltaE           (E_H - E_Q in GeV)\n');
fprintf(fileID, '#   9  Int Y_H x Y_Q    (overlap integral)\n');
fprintf(fileID, '#  10  Int Y_H Y_Q      (wavefunction overlap)\n');
fprintf(fileID, '#  11  Int Y_Q x Y_Q    (expectation value for quarkonium)\n');
fprintf(fileID, '#  12  C                (C = 3*(0.215*<r>_Q - 0.028)/DeltaE)\n');
fprintf(fileID, '# -------------------------------------------------------------------------\n');

% Write numerical results
for i = 1:size(results, 1)
    fprintf(fileID, ...
        '%8.4f  %3d  %3d  %3d  %3d  %15.8f  %15.8f  %15.8f  %15.8e  %15.8e  %15.8e  %15.8e\n', ...
        results(i,1), results(i,2), results(i,3), results(i,4), results(i,5), ...
        results(i,6), results(i,7), results(i,8), results(i,9), ...
        results(i,10), results(i,11), results(i,12));
end

fclose(fileID);

fprintf('Results saved in: %s\n', filename);

