# Design System: High-End Fashion Editorial (Mobile)

## 1. Overview & Creative North Star
**Creative North Star: "The Digital Store"**
This design system moves beyond the transactional nature of e-commerce to create a curated, editorial experience. It treats the mobile screen not as a grid of products, but as a series of high-end magazine spreads. 

To break the "template" look, we utilize **Intentional Asymmetry**. We skip the rigid 2x2 product grid in favor of overlapping elements, staggered image placements, and dramatic shifts in typographic scale. The goal is to make the user feel like they are flipping through a luxury lookbook where white space is as valuable as the product itself.

---

## 2. Colors: Tonal Depth & The "No-Line" Rule
Our palette avoids the sterile feeling of pure black and white, opting for a "Warm Minimalist" foundation of creams and charcols, punctuated by a deep emerald accent.

### Color Strategy
- **Primary (`#00322a`):** Reserved for high-impact brand moments and primary CTAs.
- **Surface & Background (`#fafaf5`):** Our "Cream" base. It is softer on the eyes than pure white and feels more like premium paper stock.
- **The "No-Line" Rule:** Sectioning must be achieved without 1px solid borders. Use background color shifts—e.g., placing a `surface-container-low` (`#f4f4ef`) section against a `surface` (`#fafaf5`) background—to define boundaries.
- **Glass & Gradient:** Use `surface-container-lowest` (`#ffffff`) at 70% opacity with a `20px` backdrop-blur for floating navigation bars. For primary buttons, apply a subtle linear gradient from `primary` (`#00322a`) to `primary-container` (`#004b40`) to add a "silk-like" depth.

---

## 3. Typography: The Editorial Voice
We pair the high-fashion authority of a serif with the functional clarity of a geometric sans-serif.

- **Display & Headlines (Playfair Display / NotoSerif):** These are our "Style Leaders." Use `display-lg` (3.5rem) for hero titles, often overlapping the edge of an image to create an integrated, bespoke look.
- **Body & Labels (Inter):** Our "Information Layer." Use `body-md` (0.875rem) for product descriptions. Increase letter spacing (tracking) on `label-sm` (0.6875rem) by 5% to maintain a premium feel even at small sizes.
- **Hierarchy:** Typography should do the heavy lifting. A `headline-lg` title followed by a significantly smaller `label-md` category name creates the "High-Low" contrast common in luxury branding.

---

## 4. Elevation & Depth: Tonal Layering
In this system, depth is organic, not artificial. We do not use "drop shadows" in the traditional sense.

- **The Layering Principle:** Stack surfaces to create focus. A product card (`surface-container-lowest`) should sit on a section of `surface-container-low`. The 0.5-tone difference provides enough "lift" to signal interactivity without visual clutter.
- **Ambient Shadows:** If a floating element (like a "Quick Buy" button) requires a shadow, use the `on-surface` color (`#1a1c19`) at 4% opacity with a `32px` blur and `8px` Y-offset. It should look like a soft glow of light, not a dark edge.
- **The "Ghost Border" Fallback:** For input fields or cards where definition is mandatory, use `outline-variant` (`#bfc9c5`) at **15% opacity**.

---

## 5. Components

### Buttons
- **Primary:** `primary` background, `on-primary` text, `xl` (1.5rem) rounded corners. Use for "Add to Bag."
- **Secondary:** `surface-container-highest` background, `on-surface` text. No border. Use for "Wishlist."
- **Tertiary:** Transparent background, `on-surface` text, with a 1px `label-sm` underline. Use for "Size Guide."

### Cards & Lists
- **Editorial Cards:** No borders or dividers. Use `md` (0.75rem) rounded corners for images. Images should be the hero; text should sit below or partially overlap the image in a `surface-container-lowest` badge.
- **Lists:** Prohibit divider lines. Separate list items using `16px` of vertical white space. Use a subtle `surface-container-low` background on every other item if list density is high.

### Input Fields
- **Search & Forms:** Use `surface-container-highest` as a solid fill instead of an outlined box. Active states transition the background to `surface-container-lowest` with a subtle `primary` "Ghost Border" (20% opacity).

### Signature Component: The "Lookbook Slider"
An asymmetrical horizontal scroll where the first image is `headline-lg` width, and the second image is 2/3 the size, creating a rhythmic, non-static browsing experience.

---

## 6. Do's and Don'ts

### Do
- **Do** use generous white space. If you think there is enough space, add 15% more.
- **Do** allow images to "bleed" off the edge of the mobile screen to encourage horizontal exploration.
- **Do** use `primary` (`#00322a`) sparingly. It is a "reward" color for the user's eye.

### Don't
- **Don't** use 1px black borders. They break the high-end illusion and feel like a wireframe.
- **Don't** use standard "system" transitions. Use slow, ease-in-out transforms (300ms+) to mimic the deliberate pace of luxury shopping.
- **Don't** crowd the screen with "Sales" badges. If a discount must be shown, use the `tertiary` gold token in a sophisticated `label-md` format.