# Patient Cards and Visual Guides

## Patient Card purpose

Patient Cards are short reusable counseling artifacts generated from verified encyclopedia content. They are not a second clinical database.

The pharmacist can:

- create a card from a medication record,
- duplicate an existing template,
- customize patient-facing wording,
- preview the final card,
- copy the card text,
- generate an offline QR code.

## Language policy

The card header can retain the medication or device name in English for identification.

The counseling body is Arabic and RTL.

## QR privacy model

Default QR content must not include patient-identifying information.

The first implementation encodes the counseling content directly in the QR, allowing the patient to retrieve the text without an account, app login, or network connection.

A future hosted-card mode may use an anonymous token. Patient identifiers must remain opt-in and should not be embedded directly in the public QR payload.

## Future export layer

The same card preview component should later support:

- PDF export,
- image export,
- print,
- platform share sheet,
- branded clinic/hospital footer,
- optional pharmacist name and date.

Exports must preserve the QR quiet zone and sufficient contrast.

## Visual Guides

Visual Guides are structured technique records, not decorative images.

Each guide contains:

- device category,
- product-specific or generic scope,
- visual sequence,
- exact technique steps,
- common mistakes,
- Arabic patient summary,
- source/version metadata.

Generic guides may explain core technique, but priming, shaking, loading, dose counters, cleaning, hold times and first-use preparation must remain product-specific when the device differs.

## Illustration strategy

Use original clean medical illustrations or licensed/source-approved assets.

Do not copy arbitrary web images into the application.

Where exact device geometry matters, verify the guide against the current manufacturer IFU before publication.

The current interface uses vector step sequences so the content model and layout can be tested before production illustrations are added.

## Initial guide set

- Metered-dose inhaler
- Spacer with inhaler
- Nasal spray
- Eye drops
- Insulin pen

Planned additions include dry-powder inhalers, Respimat-type devices, nebulizers, injectable pens, prefilled syringes, oral syringes and feeding-tube workflows.
