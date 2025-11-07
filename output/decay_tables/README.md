# Decay Tables

This folder contains the **Excel tables** and a **PDF printout** summarizing the hybrid-to-quarkonium decay results.

---

## File Contents

- The **first sheet** of the Excel file provides the **exact definitions of all columns** used throughout the tables.  
- The **first three pages** of the PDF correspond to the **expanded transition tables (green)**:
  1. **Spin-conserved transitions**
  2. **Spin-flip transitions** starting from **spin 0**
  3. **Spin-flip transitions** starting from **spin 1**

---

## Column Definitions

This section defines all quantities appearing in the decay tables and clarifies how spin-conserved and spin-flip transitions are treated in the computation of the hybrid → quarkonium decay widths.

### General Quantities

| Symbol / Column | Meaning | Units / Notes |
|-----------------|----------|---------------|
| **ΔE** | Energy difference between initial (hybrid) and final (quarkonium) states | MeV |
| **α** | $\alpha(\Delta E)$ - QCD strong coupling constant used in decay rate formulas | — |
| **C²** or **K²** | Coefficients encoding the angular momentum integral between hybrid and quarkonium states | dimensionless |
| **INT⟨i r f⟩** | Radial overlap integral between initial and final wave functions, without angular coefficients | GeV⁻¹ |
| **Γ** | Computed decay rate | MeV |
| **𝒱** | Defined as $(E_i-\langle i \| V \| i\rangle )+(E_f-\langle f \| V\| f \rangle)$ | GeV |
| **errorE** | Energy uncertainty: $3 \delta \Delta E/\Delta E$  | dimensionless |
| **alpha** | Variation of the running coupling uncertainty: $\delta \alpha / \alpha$ | dimensionless |
| **multip** | Multipole term uncertainty: $(⟨i \| r \| f⟩ ΔE)² / 120$ for spin-conserved transitions; $/ 24$ for spin-flip transitions | dimensionless |
| **cornell** | Correction term uncertainty: 3 × (0.215 × ⟨f \| r \| f⟩ − 0.028) / (Δ/1000) | — |
| **rel.1** | Relativistic correction term: $ΔE / (16 m_Q)$ | — |
| **rel.2** | Relativistic correction term: $𝒱 / (8 m_mQ) or $5 𝒱 / (24 m_Q)$ for spin-flip | — |
| **dΓ %** | Total relative error (quadratic sum of individual uncertainties) | % |
| **error** | Absolute decay rate uncertainty: (dΓ %) × Γ | MeV |

---



### Notes
- The **last columns** show the **error components** as estimated in **Equations (53)** and **(54)** of the reference.  
- **Red values** correspond to cases with **errors greater than 100%**.  
- **Black values** are those **included in the draft**.  
- **Blue values** are those **added to the identification table** in the draft.
- Quantities marked with “*” are **computed directly from numerical wave-function overlaps**.
- For transitions involving **two wave functions**, the integrals are evaluated symmetrically. 

#### From **Hybrid Spin 0**
- **Spin-conserved:**  
  ⟨i r f⟩ = |INT⟨i r f⟩| × √(C²)  
  — used for **Γ** calculation.  
- **Spin-flip:**  
  ⟨i r f⟩ = |INT⟨i r f⟩| (no angular coefficient)  
  — used for **multip** term.

#### From **Hybrid Spin 1**
- **Spin-conserved:**  
  ⟨i r f⟩ = |INT⟨i r f⟩| × √(K²)  
  — used for **Γ** calculation.  
- **Spin-flip:**  
  ⟨i r f⟩ = |INT⟨i r f⟩| (without K²)  
  — used for **multip** term.



## Additional Pages

The subsequent pages list **all decay channels allowed by the selection rules**.

- Columns are provided showing how each **constraint** is evaluated.  
- **Red rows** indicate cases that are **discarded** for one reason or another.  
- **Green rows** correspond to **channels that satisfy all constraints** and are therefore **kept** in the analysis.

---

## VBA Functions

The **last sheet** of the Excel file contains the **VBA functions** used to perform some calculations.

Occasionally, these functions may be **deleted or lost** from the VBA module.  
If that happens, they can simply be **copied and pasted** again into a **new VBA module** within the Excel file.

---

**Summary:**  
This directory contains the structured, color-coded, and verified results of the hybrid-to-quarkonium decay calculations, formatted both as **Excel spreadsheets** (for analysis) and **PDF summaries** (for documentation).
