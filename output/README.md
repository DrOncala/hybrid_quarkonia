## Data Description

### Quarkonium

For **quarkonium** states with the $\Sigma_g^+$ potential, denoted as `quarkonium`,  
the spectrum file contains the following columns:

| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `L` | Quarkonium angular momentum | — |
| 3 | `n` | Quarkonium principal quantum number | — |
| 4 | `Energy_Q` | Quarkonium energy | GeV |
| 5 | `Int_YQxYQ` | $\int Y_Q(r) \ r \ Y_Q(r) \ dr$ — Quarkonium expectation of position $\langle r \rangle_Q$ | GeV⁻¹ |
| 6 | `Int_YQYQ` | $\int Y_Q(r) \ Y_Q(r) \ dr$ — Quarkonium normalization test | dimensionless |

---

### Hybrid $P^+_0$  (H3)

For the **decoupled hybrid** at $J=0$ with the $\Sigma_u^-$ potential  (also named $p_0$ or *H3*), denoted as `hybridPplus0`,
the results include:

#### Spectrum file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Hybrid total angular momentum (fixed at J = 0) | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `Energy_H` | Hybrid energy | GeV |
| 5 | `Int_YHxYH` | $\int Y_H(r) \ r \ Y_H(r) \ dr$ — Hybrid expectation of position | GeV⁻¹ |
| 6 | `Int_YHYH` | $\int Y_H(r) \ Y_H(r) \ dr$ — Hybrid normalization test | dimensionless |

#### Decay file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Hybrid total angular momentum (fixed at J = 0) | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `L` | Quarkonium angular momentum | — |
| 5 | `n_Q` | Quarkonium principal quantum number | — |
| 6 | `E_H` | Hybrid energy | GeV |
| 7 | `E_Q` | Quarkonium energy | GeV |
| 8 | `DeltaE` | $E_H - E_Q$ | GeV |
| 9 | `Int_HxQ` | $\int Y_H(r) \ r \ Y_Q(r) \ dr$ — Overlap expectation of position  | GeV⁻¹ | 
| 10 | `Int_HQ` | $\int Y_H(r)  \ Y_Q(r) \ dr$ — Overlap integral | dimensionless |
| 11 | `Int_QxQ` | $\int Y_Q(r) \ r \ Y_Q(r) \ dr$ — Quarkonium  expectation of position $\langle r \rangle_Q$| GeV⁻¹ |
| 12 | `Int_QQ` | $\int Y_Q(r) \ Y_Q(r) \ dr$ — Quarkonium normalization test | dimensionless |
| 13 | `C` | $C = 3 (0.215 \langle r \rangle_Q - 0.028)/\Delta E$ | dimensionless |

> **Note:**  
> `C` is the coefficient of the dominant uncertainty source, this is the "Confining vs. Coulomb potential" in the reference $3(\sigma \langle r \rangle_Q+\mu)/\Delta E$  
> For decay calculations, only results with `C < 1e-01` shall be considered reliable.

---

### Hybrid $P^0$  (H2)

For the **decoupled hybrid** at $J>0$ and $J=L$ with the $\Pi_u$ potential  (also named $p_1$, $d_2$, ... or *H2*), denoted as `hybridP0`,
the results include:

#### Spectrum file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Hybrid total angular momentum | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `Energy_H` | Hybrid energy | GeV |
| 5 | `Int_YHxYH` | $\int Y_H(r) r Y_H(r) dr$ — Hybrid expectation of position | GeV⁻¹ |
| 6 | `Int_YHYH` | $\int Y_H(r) Y_H(r) dr$ — Hybrid normalization test | dimensionless |

#### Decay file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Hybrid angular momentum | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `L` | Quarkonium angular momentum | — |
| 5 | `n_Q` | Quarkonium principal quantum number | — |
| 6 | `E_H` | Hybrid energy | GeV |
| 7 | `E_Q` | Quarkonium energy | GeV |
| 8 | `DeltaE` | $E_H - E_Q$ | GeV |
| 9 | `Int_YHxYQ` | $\int Y_H(r) \ r \ Y_Q(r) \ dr$ — Overlap expectation of position  | GeV⁻¹ | 
| 10 | `Int_YHYQ` | $\int Y_H(r)  \ Y_Q(r) \ dr$ — Overlap integral | dimensionless |
| 11 | `Int_YQxYQ` |  $\int Y_Q(r) \ r \ Y_Q(r) \ dr$ — Quarkonium  expectation of position $\langle r \rangle_Q$| GeV⁻¹ |
| 12 | `C` | $C = 3 (0.215 \langle r \rangle_Q - 0.028)/\Delta E$ | dimensionless |

> **Note:**  
> For decay calculations, only results with `C < 1e-01` shall be considered reliable.

---

### Hybrid $P^{\pm}$  (H1)

For the **coupled hybrid** at $J>0$ and $J=L\pm 1$ with $\Pi_u$ and $\Sigma_u^-$ potentials (also named $(s/d)_1$, $(p/f)_2$, ... or *H1*), denoted as `hybridPpm`,
the results include:

#### Spectrum file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Hybrid total angular momentum | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `Energy_Hpm` | Hybrid energy | GeV |
| 5 | `Int_YHp_x_YHp` | $\int P^{+}(r) \ r \ P^{+}(r) dr$ — Hybrid expectation of position component | GeV⁻¹ |
| 6 | `Int_YHp_x_YHm` | $\int P^{+}(r) \ r \ P^{-}(r) dr$ — Hybrid cross term of position integral | GeV⁻¹ |
| 7 | `Int_YHm_x_YHm` | $\int P^{-}(r) \ r \ P^{-}(r) dr$ — Hybrid expectation of position component | GeV⁻¹ |
| 8 | `Int_YHpYHp` |$\int P^{+}(r) \ P^{+}(r) dr$ — Hybrid normalization component | dimensionless |
| 9 | `Int_YHpYHm` | $\int P^{+}(r) \ P^{-}(r) dr$ — Hybrid cross term integral | dimensionless |
| 10 | `Int_YHmYHm` | $\int P^{-}(r) \ P^{-}(r) dr$ — Hybrid normalization component | dimensionless |
> **Note:**  
> We compute `Int_YHpYHm` but is not included in the normalization of the hybrid coupled state.

#### Decay file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` |Quark mass | GeV |
| 2 | `J` | Hybrid total angular momentum | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `L` | Quarkonium angular momentum | — |
| 5 | `n_Q` | Quarkonium principal quantum number | — |
| 6 | `E_H` | Hybrid energy | GeV |
| 7 | `E_Q` | Quarkonium energy | GeV |
| 8 | `DeltaE` | $E_H - E_Q$ | GeV |
| 9 | `Int_Hp_x_Q` | $\int P^{+}(r) \ r \ Y_Q(r) \ dr$ — Overlap expectation of position component | GeV⁻¹ | 
| 10 | `Int_Hm_x_Q` | $\int P^{-}(r) \ r \ Y_Q(r) \ dr$ — Overlap expectation of position component  | GeV⁻¹ | 
| 11 | `Int_Hp_Q` |  $\int P^{+}(r) \ Y_Q(r)  \ dr$ — Overlap integral component | dimensionless |
| 12 | `Int_Hm_Q` | $\int P^{-}(r) \ Y_Q(r)  \ dr$ — Overlap integral component | dimensionless |
| 13 | `Int_QxQ` | $\int Y_Q(r) \ r \ Y_Q(r) \ dr$ — Quarkonium  expectation of position $\langle r \rangle_Q$| GeV⁻¹ |
| 14 | `C` | $C = 3 (0.215 \langle r \rangle_Q - 0.028)/\Delta E$ | dimensionless |
> **Note:**  
> For decay calculations, only results with `C < 1e-01` shall be considered reliable.

---

### Summary

All `.dat` files use **column-based ASCII format**, easy to read from  
MATLAB, Python, or C++, e.g.:

```matlab
data = readmatrix('output/hybridPpm_decay.dat');

