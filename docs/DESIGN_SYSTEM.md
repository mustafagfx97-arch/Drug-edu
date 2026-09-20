# Design System

## Visual direction

Clinical, calm and modern. Avoid dense hospital-software aesthetics. Use whitespace, clear hierarchy and restrained color. Color communicates state and priority; it is not decorative.

## Light and dark themes

Both themes are first-class. Feature widgets use semantic ColorScheme roles rather than hard-coded colors. Surfaces rely on hierarchy and subtle borders instead of heavy shadows. Arabic patient blocks use the same theme as the rest of the app.

## Shape and spacing

- Primary cards: 20 px radius.
- Controls: 14–16 px radius.
- Page horizontal padding: 20 px.
- Card internal padding: 16–18 px.
- Prefer one clear card per concept.
- Avoid nested cards unless clinically necessary.

## Typography

Use platform/system fonts initially. Drug names and page titles use strong weight. Long clinical text uses comfortable line height. Arabic patient counseling is rendered RTL with increased line height.

## Clinical priority

Four priorities are used: Critical, Important, Patient-specific, and Reference. Priority appears as a compact label unless an immediate action is required.

## Safety warnings

A full-width warning is reserved for actions that can cause meaningful harm, such as wrong formulation, prohibited IV push, incompatible diluent, concentration outside the validated range, salt/base mismatch, major unit mismatch, or a paralytic safety gate.

Warnings state the required action rather than only saying Caution.

## Density rule

A medication page should answer the immediate question in the first screenful. Empty or irrelevant sections are hidden.
