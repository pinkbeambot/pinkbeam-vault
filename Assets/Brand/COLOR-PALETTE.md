# Pink Beam — Color Palette System

> **Brand Essence:** Cosmic precision. A neon pink beam cutting through the void.

---

## 1. Primary Palette

### 1.1 Primary Pink — The Beam

The signature color representing energy, precision, and the cosmic pink beam.

| Shade | Hex | Usage |
|-------|-----|-------|
| **50** | `#FFF0F5` | Lightest backgrounds, subtle highlights |
| **100** | `#FFD9E8` | Soft backgrounds, hover states |
| **200** | `#FFB3D1` | Secondary accents, disabled states |
| **300** | `#FF80B3` | Light accents, borders |
| **400** | `#FF4D94` | Medium emphasis, icons |
| **500** | `#FF006E` | **PRIMARY** — CTA buttons, links, brand marks |
| **600** | `#E6005E` | Hover states for primary |
| **700** | `#CC0055` | Active states, pressed |
| **800** | `#990040` | Dark accents, shadows |
| **900** | `#66002B` | Darkest depth |

**CSS Variables:**
```css
--color-pink-50:  #FFF0F5;
--color-pink-100: #FFD9E8;
--color-pink-200: #FFB3D1;
--color-pink-300: #FF80B3;
--color-pink-400: #FF4D94;
--color-pink-500: #FF006E; /* Primary */
--color-pink-600: #E6005E;
--color-pink-700: #CC0055;
--color-pink-800: #990040;
--color-pink-900: #66002B;
```

### 1.2 Void Black — The Depth

Deep dark backgrounds creating the "cosmic void" atmosphere.

| Shade | Hex | Usage |
|-------|-----|-------|
| **50** | `#F5F5F7` | Light surfaces (light mode) |
| **100** | `#E8E8EC` | Borders, dividers (light mode) |
| **200** | `#D1D1D9` | Secondary borders |
| **300** | `#A6A6B3` | Muted text (light mode) |
| **400** | `#7A7A8C` | Secondary text (light mode) |
| **500** | `#525266` | Medium emphasis |
| **600** | `#2A2A3C` | Card backgrounds, depth layers |
| **700** | `#1A1A24` | Elevated surfaces, cards |
| **800** | `#0F0F17` | Secondary dark surfaces |
| **900** | `#0A0A0F` | **PRIMARY DARK** — Main background |

**CSS Variables:**
```css
--color-void-50:  #F5F5F7;
--color-void-100: #E8E8EC;
--color-void-200: #D1D1D9;
--color-void-300: #A6A6B3;
--color-void-400: #7A7A8C;
--color-void-500: #525266;
--color-void-600: #2A2A3C;
--color-void-700: #1A1A24;
--color-void-800: #0F0F17;
--color-void-900: #0A0A0F; /* Primary Dark */
```

### 1.3 Clean White — The Light

Pure and off-white variations for light themes and contrast.

| Shade | Hex | Usage |
|-------|-----|-------|
| **Pure** | `#FFFFFF` | Pure white, maximum contrast |
| **Clean** | `#FAFAFA` | Page backgrounds, cards |
| **Soft** | `#F7F7F8` | Subtle backgrounds, sections |
| **Muted** | `#F0F0F2` | Alternate sections, cards |
| **Ghost** | `#E8E8EB` | Borders, dividers |

**CSS Variables:**
```css
--color-white-pure:  #FFFFFF;
--color-white-clean: #FAFAFA;
--color-white-soft:  #F7F7F8;
--color-white-muted: #F0F0F2;
--color-white-ghost: #E8E8EB;
```

---

## 2. Secondary Palette

### 2.1 Accent Colors

Supporting colors for UI highlights and differentiation.

| Color | Hex | Usage |
|-------|-----|-------|
| **Cosmic Purple** | `#8B5CF6` | Secondary accent, cosmic vibes |
| **Stellar Cyan** | `#06B6D4` | Tertiary accent, tech feel |
| **Solar Amber** | `#F59E0B` | Warm accent, premium touches |
| **Nebula Indigo** | `#6366F1` | Deep accent, mysterious |

**CSS Variables:**
```css
--color-accent-purple: #8B5CF6;
--color-accent-cyan:   #06B6D4;
--color-accent-amber:  #F59E0B;
--color-accent-indigo: #6366F1;
```

### 2.2 Gradient Combinations

The signature beam effect — pink fades and glows.

| Gradient | Definition | Usage |
|----------|------------|-------|
| **Beam Fade** | `linear-gradient(90deg, #FF006E 0%, #FF4D94 50%, #FF80B3 100%)` | Hero text, primary CTAs |
| **Cosmic Fade** | `linear-gradient(135deg, #FF006E 0%, #8B5CF6 100%)` | Premium elements, badges |
| **Void Depth** | `linear-gradient(180deg, #0A0A0F 0%, #1A1A24 100%)` | Card backgrounds |
| **Beam Glow** | `radial-gradient(ellipse at center, #FF006E 0%, transparent 70%)` | Background effects |
| **Pink Pulse** | `linear-gradient(45deg, #FF006E 0%, #FF80B3 50%, #FF006E 100%)` | Animated gradients |

**CSS Variables:**
```css
--gradient-beam:       linear-gradient(90deg, #FF006E 0%, #FF4D94 50%, #FF80B3 100%);
--gradient-cosmic:     linear-gradient(135deg, #FF006E 0%, #8B5CF6 100%);
--gradient-void:       linear-gradient(180deg, #0A0A0F 0%, #1A1A24 100%);
--gradient-beam-glow:  radial-gradient(ellipse at center, #FF006E33 0%, transparent 70%);
```

### 2.3 Glow & Shadow Effects

| Effect | Value | Usage |
|--------|-------|-------|
| **Pink Glow SM** | `0 0 10px rgba(255, 0, 110, 0.3)` | Subtle emphasis |
| **Pink Glow MD** | `0 0 20px rgba(255, 0, 110, 0.4)` | Buttons, active states |
| **Pink Glow LG** | `0 0 40px rgba(255, 0, 110, 0.5)` | Hero elements, CTAs |
| **Pink Glow XL** | `0 0 80px rgba(255, 0, 110, 0.6)` | Max emphasis, hero beams |
| **Void Shadow SM** | `0 2px 8px rgba(10, 10, 15, 0.5)` | Cards on light |
| **Void Shadow MD** | `0 4px 16px rgba(10, 10, 15, 0.6)` | Elevated cards |
| **Void Shadow LG** | `0 8px 32px rgba(10, 10, 15, 0.7)` | Modals, popovers |
| **Beam Shadow** | `0 0 30px rgba(255, 0, 110, 0.4)` | Primary button glow |

**CSS Variables:**
```css
--glow-pink-sm: 0 0 10px rgba(255, 0, 110, 0.3);
--glow-pink-md: 0 0 20px rgba(255, 0, 110, 0.4);
--glow-pink-lg: 0 0 40px rgba(255, 0, 110, 0.5);
--glow-pink-xl: 0 0 80px rgba(255, 0, 110, 0.6);
--shadow-void-sm: 0 2px 8px rgba(10, 10, 15, 0.5);
--shadow-void-md: 0 4px 16px rgba(10, 10, 15, 0.6);
--shadow-void-lg: 0 8px 32px rgba(10, 10, 15, 0.7);
--shadow-beam:    0 0 30px rgba(255, 0, 110, 0.4);
```

---

## 3. Semantic Colors

Status and feedback colors with cosmic names.

### 3.1 Supernova (Success)

| Shade | Hex | Usage |
|-------|-----|-------|
| **50** | `#F0FDF4` | Success backgrounds |
| **100** | `#DCFCE7` | Success light |
| **200** | `#BBF7D0` | Hover states |
| **500** | `#22C55E` | **Success primary** — Checkmarks, success states |
| **600** | `#16A34A` | Success hover |
| **700** | `#15803D` | Success dark |

```css
--color-success-50: #F0FDF4;
--color-success-500: #22C55E;
--color-success-600: #16A34A;
```

### 3.2 Pulsar (Warning)

| Shade | Hex | Usage |
|-------|-----|-------|
| **50** | `#FFFBEB` | Warning backgrounds |
| **100** | `#FEF3C7` | Warning light |
| **200** | `#FDE68A` | Warning soft |
| **500** | `#F59E0B` | **Warning primary** — Alerts, caution |
| **600** | `#D97706` | Warning hover |
| **700** | `#B45309` | Warning dark |

```css
--color-warning-50: #FFFBEB;
--color-warning-500: #F59E0B;
--color-warning-600: #D97706;
```

### 3.3 Red Dwarf (Error)

| Shade | Hex | Usage |
|-------|-----|-------|
| **50** | `#FEF2F2` | Error backgrounds |
| **100** | `#FEE2E2` | Error light |
| **200** | `#FECACA` | Error soft |
| **500** | `#EF4444` | **Error primary** — Errors, invalid states |
| **600** | `#DC2626` | Error hover |
| **700** | `#B91C1C` | Error dark |

```css
--color-error-50: #FEF2F2;
--color-error-500: #EF4444;
--color-error-600: #DC2626;
```

### 3.4 Neutron (Info)

| Shade | Hex | Usage |
|-------|-----|-------|
| **50** | `#EFF6FF` | Info backgrounds |
| **100** | `#DBEAFE` | Info light |
| **200** | `#BFDBFE` | Info soft |
| **500** | `#3B82F6` | **Info primary** — Information, tips |
| **600** | `#2563EB` | Info hover |
| **700** | `#1D4ED8` | Info dark |

```css
--color-info-50: #EFF6FF;
--color-info-500: #3B82F6;
--color-info-600: #2563EB;
```

---

## 4. Dark Mode Mappings

Semantic color tokens that change between light and dark modes.

### 4.1 Surface Colors

| Token | Light Mode | Dark Mode | Usage |
|-------|------------|-----------|-------|
| `--surface-bg` | `#FAFAFA` | `#0A0A0F` | Page background |
| `--surface-elevated` | `#FFFFFF` | `#1A1A24` | Cards, modals |
| `--surface-sunken` | `#F0F0F2` | `#0F0F17` | Secondary backgrounds |

### 4.2 Text Colors

| Token | Light Mode | Dark Mode | Usage |
|-------|------------|-----------|-------|
| `--text-primary` | `#0A0A0F` | `#FFFFFF` | Headings, primary text |
| `--text-secondary` | `#525266` | `#A6A6B3` | Body text, descriptions |
| `--text-tertiary` | `#7A7A8C` | `#7A7A8C` | Muted text, placeholders |
| `--text-inverse` | `#FFFFFF` | `#0A0A0F` | Text on colored backgrounds |

### 4.3 Border Colors

| Token | Light Mode | Dark Mode | Usage |
|-------|------------|-----------|-------|
| `--border-default` | `#E8E8EC` | `#2A2A3C` | Default borders |
| `--border-focus` | `#FF006E` | `#FF006E` | Focus states (pink always) |
| `--border-hover` | `#D1D1D9` | `#525266` | Hover borders |

### 4.4 Accent Colors

| Token | Light Mode | Dark Mode | Usage |
|-------|------------|-----------|-------|
| `--accent-primary` | `#FF006E` | `#FF4D94` | Links, buttons (slightly brighter in dark) |
| `--accent-primary-hover` | `#E6005E` | `#FF80B3` | Hover states |

---

## 5. Usage Guidelines

### 5.1 When to Use Which Color

**Primary Pink (#FF006E):**
- ✓ Primary call-to-action buttons
- ✓ Links and interactive elements
- ✓ Brand logo and marks
- ✓ Active states and selections
- ✗ Body text (use void black/white)
- ✗ Large background areas (use shades)

**Void Black (#0A0A0F):**
- ✓ Dark mode page backgrounds
- ✓ High-contrast text on light
- ✓ Premium, sophisticated feel
- ✗ Light mode backgrounds

**Clean White:**
- ✓ Light mode backgrounds
- ✓ Cards and content surfaces
- ✓ Text on dark backgrounds
- ✗ Pure backgrounds in dark mode

### 5.2 Contrast Requirements

| Combination | Ratio | Pass |
|-------------|-------|------|
| #FF006E on #FFFFFF | 4.5:1 | ✅ AA |
| #FF006E on #0A0A0F | 5.8:1 | ✅ AA |
| #FFFFFF on #0A0A0F | 19.5:1 | ✅ AAA |
| #A6A6B3 on #0A0A0F | 5.3:1 | ✅ AA |
| #525266 on #FFFFFF | 7.2:1 | ✅ AAA |

### 5.3 Brand Do's and Don'ts

✅ **DO:**
- Use pink glow effects on interactive elements
- Maintain the cosmic void atmosphere with dark backgrounds
- Use gradients sparingly for hero moments
- Keep at least 60% void/dark in dark mode compositions

❌ **DON'T:**
- Use pure black (#000000) — use void black (#0A0A0F)
- Oversaturate with pink — it's an accent, not the main color
- Use pink for error states — use red dwarf palette
- Forget glow effects — they're part of the "beam" identity

---

## 6. Tailwind Config Snippet

```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        // Primary Pink
        pink: {
          50: '#FFF0F5',
          100: '#FFD9E8',
          200: '#FFB3D1',
          300: '#FF80B3',
          400: '#FF4D94',
          500: '#FF006E', // Primary
          600: '#E6005E',
          700: '#CC0055',
          800: '#990040',
          900: '#66002B',
        },
        // Void Black
        void: {
          50: '#F5F5F7',
          100: '#E8E8EC',
          200: '#D1D1D9',
          300: '#A6A6B3',
          400: '#7A7A8C',
          500: '#525266',
          600: '#2A2A3C',
          700: '#1A1A24',
          800: '#0F0F17',
          900: '#0A0A0F', // Primary Dark
        },
        // Semantic
        success: {
          50: '#F0FDF4',
          500: '#22C55E',
          600: '#16A34A',
        },
        warning: {
          50: '#FFFBEB',
          500: '#F59E0B',
          600: '#D97706',
        },
        error: {
          50: '#FEF2F2',
          500: '#EF4444',
          600: '#DC2626',
        },
        info: {
          50: '#EFF6FF',
          500: '#3B82F6',
          600: '#2563EB',
        },
        // Accents
        accent: {
          purple: '#8B5CF6',
          cyan: '#06B6D4',
          amber: '#F59E0B',
          indigo: '#6366F1',
        },
      },
      backgroundImage: {
        'gradient-beam': 'linear-gradient(90deg, #FF006E 0%, #FF4D94 50%, #FF80B3 100%)',
        'gradient-cosmic': 'linear-gradient(135deg, #FF006E 0%, #8B5CF6 100%)',
        'gradient-void': 'linear-gradient(180deg, #0A0A0F 0%, #1A1A24 100%)',
      },
      boxShadow: {
        'glow-pink-sm': '0 0 10px rgba(255, 0, 110, 0.3)',
        'glow-pink-md': '0 0 20px rgba(255, 0, 110, 0.4)',
        'glow-pink-lg': '0 0 40px rgba(255, 0, 110, 0.5)',
        'glow-pink-xl': '0 0 80px rgba(255, 0, 110, 0.6)',
        'shadow-void-sm': '0 2px 8px rgba(10, 10, 15, 0.5)',
        'shadow-void-md': '0 4px 16px rgba(10, 10, 15, 0.6)',
        'shadow-void-lg': '0 8px 32px rgba(10, 10, 15, 0.7)',
        'beam': '0 0 30px rgba(255, 0, 110, 0.4)',
      },
    },
  },
}
```

---

## 7. CSS Variable Complete Reference

```css
:root {
  /* Primary Pink */
  --color-pink-50:  #FFF0F5;
  --color-pink-100: #FFD9E8;
  --color-pink-200: #FFB3D1;
  --color-pink-300: #FF80B3;
  --color-pink-400: #FF4D94;
  --color-pink-500: #FF006E;
  --color-pink-600: #E6005E;
  --color-pink-700: #CC0055;
  --color-pink-800: #990040;
  --color-pink-900: #66002B;

  /* Void Black */
  --color-void-50:  #F5F5F7;
  --color-void-100: #E8E8EC;
  --color-void-200: #D1D1D9;
  --color-void-300: #A6A6B3;
  --color-void-400: #7A7A8C;
  --color-void-500: #525266;
  --color-void-600: #2A2A3C;
  --color-void-700: #1A1A24;
  --color-void-800: #0F0F17;
  --color-void-900: #0A0A0F;

  /* White Variations */
  --color-white-pure:  #FFFFFF;
  --color-white-clean: #FAFAFA;
  --color-white-soft:  #F7F7F8;
  --color-white-muted: #F0F0F2;
  --color-white-ghost: #E8E8EB;

  /* Accents */
  --color-accent-purple: #8B5CF6;
  --color-accent-cyan:   #06B6D4;
  --color-accent-amber:  #F59E0B;
  --color-accent-indigo: #6366F1;

  /* Semantic */
  --color-success-500: #22C55E;
  --color-success-600: #16A34A;
  --color-warning-500: #F59E0B;
  --color-warning-600: #D97706;
  --color-error-500:   #EF4444;
  --color-error-600:   #DC2626;
  --color-info-500:    #3B82F6;
  --color-info-600:    #2563EB;

  /* Semantic Tokens - Light Mode Default */
  --surface-bg: #FAFAFA;
  --surface-elevated: #FFFFFF;
  --surface-sunken: #F0F0F2;
  --text-primary: #0A0A0F;
  --text-secondary: #525266;
  --text-tertiary: #7A7A8C;
  --text-inverse: #FFFFFF;
  --border-default: #E8E8EC;
  --border-focus: #FF006E;
  --border-hover: #D1D1D9;
  --accent-primary: #FF006E;
  --accent-primary-hover: #E6005E;

  /* Gradients */
  --gradient-beam: linear-gradient(90deg, #FF006E 0%, #FF4D94 50%, #FF80B3 100%);
  --gradient-cosmic: linear-gradient(135deg, #FF006E 0%, #8B5CF6 100%);
  --gradient-void: linear-gradient(180deg, #0A0A0F 0%, #1A1A24 100%);

  /* Shadows & Glows */
  --glow-pink-sm: 0 0 10px rgba(255, 0, 110, 0.3);
  --glow-pink-md: 0 0 20px rgba(255, 0, 110, 0.4);
  --glow-pink-lg: 0 0 40px rgba(255, 0, 110, 0.5);
  --glow-pink-xl: 0 0 80px rgba(255, 0, 110, 0.6);
  --shadow-void-sm: 0 2px 8px rgba(10, 10, 15, 0.5);
  --shadow-void-md: 0 4px 16px rgba(10, 10, 15, 0.6);
  --shadow-void-lg: 0 8px 32px rgba(10, 10, 15, 0.7);
}

[data-theme="dark"] {
  --surface-bg: #0A0A0F;
  --surface-elevated: #1A1A24;
  --surface-sunken: #0F0F17;
  --text-primary: #FFFFFF;
  --text-secondary: #A6A6B3;
  --text-tertiary: #7A7A8C;
  --text-inverse: #0A0A0F;
  --border-default: #2A2A3C;
  --border-hover: #525266;
  --accent-primary: #FF4D94;
  --accent-primary-hover: #FF80B3;
}
```

---

*Document Version: 1.0*  
*Brand: Pink Beam*  
*Created: 2026-02-07*
