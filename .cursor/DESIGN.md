# Design System Document

## 1. Overview & Creative North Star

This design system is engineered to transform complex agricultural data into a high-end, editorial experience. Moving away from the utilitarian "industrial dashboard" look, we are adopting the **"The Living Lab"** as our Creative North Star. 

The objective is to treat the poultry farm management interface as a premium, data-rich environment that feels as clean and controlled as a modern laboratory, yet as vital as the livestock it manages. We break the "template" aesthetic by utilizing intentional white space, high-contrast typography scales, and a departure from traditional rigid grids. By layering semi-transparent surfaces and emphasizing tonal depth over structural lines, we create an interface that feels bespoke, calm, and authoritative.

## 2. Colors

Our palette is a sophisticated evolution of the brand’s core blue, red, and green, grounded in a range of "Surface" tones that provide an airy, clinical, yet premium atmosphere.

### The Color Palette
*   **Primary (`#004AC6` / `primary`):** The "Intelligence" Blue. Used for primary actions and focused states. 
*   **Secondary (`#006E2D` / `secondary`):** The "Vitality" Green. Used for health metrics, growth indicators, and "Smart Coop" status.
*   **Tertiary (`#AE0010` / `tertiary`):** The "Alert" Red. Reserved for critical errors, biosecurity warnings, and high-priority anomalies.
*   **Surface & Background:** We utilize `surface` (`#F8F9FF`) and its variants to create a soft, blue-tinted environment that reduces eye strain compared to pure white.

### The "No-Line" Rule
To achieve a high-end editorial feel, **prohibit the use of 1px solid borders for sectioning.** Boundaries must be defined solely through background color shifts. A `surface-container-low` section sitting on a `surface` background creates a natural, modern division without the visual "noise" of outlines.

### Surface Hierarchy & Nesting
Treat the UI as a series of physical layers. Hierarchy is achieved by nesting surface tiers:
*   **Base:** `surface` (#F8F9FF)
*   **Sectioning:** `surface-container-low` (#EEF4FF)
*   **Active Cards:** `surface-container-lowest` (#FFFFFF) for maximum "pop" and clarity.

### The "Glass & Gradient" Rule
For floating elements, such as navigation sidebars or modal overlays, use **Glassmorphism**. Apply a semi-transparent `surface` color with a `backdrop-blur` (16px–32px). Additionally, use subtle gradients—transitioning from `primary` (#004AC6) to `primary_container` (#2563EB)—on main CTAs to provide a "signature" polish.

## 3. Typography

The typography strategy pairs **Manrope** for high-impact data and headers with **Inter** for utilitarian readability.

*   **Display & Headlines (Manrope):** Use `display-lg` (3.5rem) for hero metrics like "Total Flock Count." Manrope’s geometric nature feels architectural and modern.
*   **Body & Labels (Inter):** Use `body-md` (0.875rem) for all secondary data and descriptions. Inter provides the high-performance legibility required for dense poultry management logs.
*   **Data Editorialism:** Use extreme scale differences. A large `headline-lg` value paired with a tiny, uppercase `label-md` creates an "editorial" look that guides the eye to the most important metric first.

## 4. Elevation & Depth

We eschew traditional "Drop Shadows" in favor of **Tonal Layering** and **Ambient Light.**

*   **The Layering Principle:** Stack `surface-container` tiers to create depth. A `surface-container-highest` widget should sit atop a `surface-container-low` dashboard background to signal its "interactive" nature.
*   **Ambient Shadows:** For elements that truly need to "float" (like tooltips or active modals), use a diffused shadow: `box-shadow: 0 20px 40px rgba(18, 28, 40, 0.06);`. The shadow is tinted by the `on_surface` color to feel natural.
*   **The "Ghost Border" Fallback:** If a container requires an edge for accessibility, use the `outline_variant` token at **15% opacity**. This creates a "Ghost Border" that defines the edge without breaking the "No-Line" rule.
*   **Glassmorphism Depth:** Layer semi-transparent cards over background gradients or imagery to create a "Smart Coop" aesthetic—clean, transparent, and high-tech.

## 5. Components

### Buttons
*   **Primary:** Solid `primary` with a subtle gradient to `primary_container`. Roundedness: `lg` (0.5rem).
*   **Secondary:** Ghost style. No background, `primary` text, and a `primary` "Ghost Border" on hover only.

### Cards & Lists
*   **Forbid Divider Lines:** Separate list items using vertical white space (8px or 12px) or alternating subtle background shifts between `surface-container-low` and `surface-container-lowest`.
*   **Card Styling:** Use `surface-container-lowest` for cards. Elevation should be achieved through tonal shift, not shadows.

### Input Fields
*   **Style:** Background `surface_container_high` with a `none` border. On focus, transition to a `primary` Ghost Border. 
*   **Interaction:** Floating labels using `label-sm` to maintain a compact, data-driven footprint.

### Specialized "Smart Coop" Components
*   **Environmental Gauge:** A custom radial component using `secondary` (Green) and `tertiary` (Red) to show temperature/humidity zones.
*   **Status Pulsars:** Small, glowing dots using a soft `secondary` glow to indicate "Active" sensors or live feeds.

## 6. Do's and Don'ts

### Do's
*   **Do** use asymmetrical layouts for dashboard summaries to create a bespoke, non-generic look.
*   **Do** use `secondary` (Green) and `tertiary` (Red) sparingly as "status signals" to maintain the professional blue-neutral aesthetic.
*   **Do** prioritize vertical rhythm. Use 24px or 32px gaps between major sections to let the data "breathe."

### Don'ts
*   **Don't** use 100% black text. Always use `on_surface` (#121C28) to maintain a soft, premium contrast.
*   **Don't** use 1px solid borders to separate sections or table rows. Use tonal shifts or whitespace.
*   **Don't** use standard "drop shadows" with high opacity. They clutter the clinical "Living Lab" aesthetic.
*   **Don't** use Cairo (the legacy font) for the dashboard UI. Stick strictly to the Manrope/Inter pairing for a contemporary feel.