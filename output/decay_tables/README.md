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

Below is a detailed explanation of the main columns appearing in the decay tables.

### General Quantities

| Symbol / Column | Meaning | Units / Notes |
|-----------------|----------|---------------|
| **ΔE − E′** | Energy difference between initial and final states | MeV |
| **α (strong coupling)** | QCD coupling constant used in decay rate formulas | — |
| **C²** | Angular coefficient from selection rules | dimensionless |
| **INT⟨i r f⟩** | Radial overlap integral between initial and final wave functions, without angular coefficients | GeV⁻¹ |
| **Γ** | Computed decay rate | MeV |
| **𝒱** | Defined as *(Eᵢ − ⟨i Vᵢ⟩) + (E_f − ⟨f V_f⟩)* | GeV |
| **errorE** | Estimated energy uncertainty using the expressions: <br>• 3 × ARREL(2) × 110 / Δ  or 3 × ARREL(2) × 33 / Δ | dimensionless |
| **α das(Δ/1000)/α das** | Variation of the running coupling α das with Δ | dimensionless |
| **multip** | Transition strength term:<br>• (⟨i | r | f⟩ Δ)² / 120 for spin-conserved transitions<br>• (⟨i | r | f⟩ Δ)² / 24 for spin-flip transitions | dimensionless |
| **cornell** | Empirical correction term: 3 × (0.215 × ⟨f | r | f⟩ − 0.028) / (Δ/1000) | — |
| **rel.1** | Relativistic correction term: Δ / (16 m) | — |
| **rel.2** | Relativistic correction term: 𝒱 / (8 m) or 5 𝒱 / (24 m) for spin-flip | — |
| **dΓ %** | Total relative error (quadratic sum of individual uncertainties) | % |
| **error** | Absolute decay rate uncertainty: (dΓ %) × Γ | MeV |

---

### Spin-Dependent Definitions

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

---

### Notes
- Quantities marked with “*” are **computed directly from numerical wave-function overlaps**.  
- For transitions involving **two wave functions**, the integrals are evaluated symmetrically.  
- The coefficients **C²** or **K²** encode the angular momentum coupling between hybrid and quarkonium states.

---

**Summary:**  
This section defines all quantities appearing in the decay tables and clarifies how spin-conserved and spin-flip transitions are treated in the computation of the hybrid → quarkonium decay widths.


## Column Notes

- The **last columns** show the **error components** as estimated in **Equations (53)** and **(54)** of the reference.  
- **Red values** correspond to cases with **errors greater than 100%**.  
- **Black values** are those **included in the draft**.  
- **Blue values** are those **added to the identification table** in the draft.

---

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
