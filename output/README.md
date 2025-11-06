## Data Description

### Quarkonium

For **quarkonium** states with the $\Sigma_g^+$ potential (denoted as `quarkonium`),  
the spectrum file contains the following columns:

| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `L` | Angular momentum quantum number | — |
| 3 | `n` | Principal quantum number | — |
| 4 | `Energy_Q` | Energy eigenvalue | GeV |
| 5 | `Int_YQxYQ` | $\int Y_Q(r) \ r \ Y_Q(r) \ dr$ — expectation value of position $\langle r \rangle$ | GeV⁻¹ |
| 6 | `Int_YQYQ` | $\int Y_Q(r) \ Y_Q(r) \ dr$ — normalization test | dimensionless |

---

### Hybrid Pplus0  (H3)

For the **decoupled hybrid** at $J=0$ with the $\Sigma_u^-$ potential  
(also named *p₀* or *(H3)*), the results include:

#### Spectrum file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Total angular momentum (fixed = 0) | — |
| 3 | `n_H` | Principal quantum number | — |
| 4 | `Energy_H` | Hybrid energy | GeV |
| 5 | `Int_YHxYH` | $\int Y_H(r) \ r \ Y_H(r) \ dr$ — expectation of position | GeV⁻¹ |
| 6 | `Int_YHYH` | $\int Y_H(r) \ Y_H(r) \ dr$ — normalization test | dimensionless |

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
| 9 | `Int_HxQ` | Overlap integral with $r$ factor | — |
| 10 | `Int_HQ` | Wavefunction overlap | — |
| 11 | `Int_QxQ` | Quarkonium $\langle r \rangle$ | GeV⁻¹ |
| 12 | `Int_QQ` | Quarkonium normalization | — |
| 13 | `C` | $C = 3 (0.215 \langle r \rangle_Q - 0.028)/\Delta E$ | — |

> **Note:**  
> `C` is the coefficient of the dominant uncertainty source  
> (confining vs. Coulomb potential).  
> For decay calculations, only results with `C < 1e-1` are considered reliable.

---

### Hybrid P0  (H2)

For the **decoupled hybrid** at $J>0$ and $J=L$ with the $\Pi_u$ potential  
(also named *p₁*, *d₂*, ... or *(H2)*), we have:

#### Spectrum file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Total angular momentum | — |
| 3 | `n_H` | Principal quantum number | — |
| 4 | `Energy_H` | Hybrid energy | GeV |
| 5 | `Int_YHxYH` | $\int Y_H(r) r Y_H(r) dr$ | GeV⁻¹ |
| 6 | `Int_YHYH` | $\int Y_H(r) Y_H(r) dr$ | — |

#### Decay file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | GeV |
| 2 | `J` | Hybrid angular momentum | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `L` | Quarkonium angular momentum | — |
| 5 | `n_Q` | Quarkonium principal quantum number | — |
| 6 | `E_H` | Hybrid energy | GeV |
| 7 | `E_Q` | Quarkonium energy | GeV |
| 8 | `DeltaE` | $E_H - E_Q$ | GeV |
| 9 | `Int_YHxYQ` | Overlap integral | — |
| 10 | `Int_YHYQ` | Wavefunction overlap | — |
| 11 | `Int_YQxYQ` | $\langle r \rangle_Q$ | GeV⁻¹ |
| 12 | `C` | $C = 3 (0.215 \langle r \rangle_Q - 0.028)/\Delta E$ | — |

> **Note:**  
> For decay we shall consider only cases with `C < 1e-1`.

---

### Hybrid Ppm  (H1)

For the **coupled hybrid** at $J>0$ and $J=L±1$ with $\Pi_u$ and $\Sigma_u^-$ potentials  
(also named *(s/d)_1*, *(p/f)_2*, ... or *(H1)*), the output includes:

#### Spectrum file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | Quark mass | GeV |
| 2 | `J` | Total angular momentum | — |
| 3 | `n_H` | Principal quantum number | — |
| 4 | `Energy_Hpm` | Coupled hybrid energy | GeV |
| 5 | `Int_YHp_x_YHp` | $\int Y_{Hp}(r) r Y_{Hp}(r) dr$ | GeV⁻¹ |
| 6 | `Int_YHp_x_YHm` | $\int Y_{Hp}(r) r Y_{Hm}(r) dr$ | GeV⁻¹ |
| 7 | `Int_YHm_x_YHm` | $\int Y_{Hm}(r) r Y_{Hm}(r) dr$ | GeV⁻¹ |
| 8 | `Int_YHpYHp` | Normalization integral (P⁺) | — |
| 9 | `Int_YHpYHm` | Cross term (P⁺P⁻) | — |
| 10 | `Int_YHmYHm` | Normalization integral (P⁻) | — |

#### Decay file columns
| # | Quantity | Description | Units |
|---|-----------|--------------|--------|
| 1 | `mass` | GeV |
| 2 | `J` | Hybrid angular momentum | — |
| 3 | `n_H` | Hybrid principal quantum number | — |
| 4 | `L` | Quarkonium angular momentum | — |
| 5 | `n_Q` | Quarkonium principal quantum number | — |
| 6 | `E_H` | Hybrid energy | GeV |
| 7 | `E_Q` | Quarkonium energy | GeV |
| 8 | `DeltaE` | $E_H - E_Q$ | GeV |
| 9 | `Int_Hp_x_Q` | Overlap integral (Hp channel) | — |
| 10 | `Int_Hm_x_Q` | Overlap integral (Hm channel) | — |
| 11 | `Int_Hp_Q` | Wavefunction overlap (Hp) | — |
| 12 | `Int_Hm_Q` | Wavefunction overlap (Hm) | — |
| 13 | `Int_QxQ` | $\langle r \rangle_Q$ | GeV⁻¹ |
| 14 | `C` | $C = 3 (0.215 \langle r \rangle_Q - 0.028)/\Delta E$ | — |

> **Note:**  
> For decay we shall consider only results with `C < 1e-1`.

---

### Summary

All `.dat` files use **column-based ASCII format**, easy to read from  
MATLAB, Python, or C++, e.g.:

```matlab
data = readmatrix('output/hybridPpm_decay.dat');




