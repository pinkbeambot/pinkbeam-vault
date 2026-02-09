# Pink Beam — Typography System

> **Brand Essence:** Cosmic precision. Modern tech with human warmth.

---

## 1. Font Selections

### 1.1 Display Font — Space Grotesk

**Primary Display Font:** `Space Grotesk`

| Attribute | Value |
|-----------|-------|
| **Font** | Space Grotesk |
| **Weights** | 300 (Light), 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold) |
| **Best For** | Headlines, hero text, logos, navigation |
| **Personality** | Geometric, modern, slightly quirky, tech-forward |

**Rationale:**
Space Grotesk combines geometric precision with subtle organic curves. It evokes a sense of cosmic/space technology while remaining highly readable. The slightly quirky letterforms (notably the 'g', 'k', and numerals) give it personality without sacrificing professionalism. It pairs beautifully with our neon pink beam aesthetic — modern, bold, and forward-looking.

**Google Fonts Import:**
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

**CSS Import:**
```css
@import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&display=swap');
```

---

### 1.2 Body Font — Inter

**Primary Body Font:** `Inter`

| Attribute | Value |
|-----------|-------|
| **Font** | Inter |
| **Weights** | 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold) |
| **Best For** | Body text, paragraphs, UI labels, descriptions |
| **Personality** | Neutral, highly readable, modern, professional |

**Rationale:**
Inter is the industry standard for UI text, designed specifically for screens. Its tall x-height and open letterforms ensure exceptional readability at all sizes. As a neutral sans-serif, it doesn't compete with Space Grotesk but supports it beautifully. The slightly rounded forms complement the geometric nature of Space Grotesk while prioritizing legibility for longer content.

**Google Fonts Import:**
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

**CSS Import:**
```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
```

**System Font Fallback:**
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
```

---

### 1.3 Monospace Font — JetBrains Mono

**Primary Mono Font:** `JetBrains Mono`

| Attribute | Value |
|-----------|-------|
| **Font** | JetBrains Mono |
| **Weights** | 400 (Regular), 500 (Medium), 700 (Bold) |
| **Best For** | Code blocks, inline code, technical data, terminal text |
| **Personality** | Technical, precise, developer-friendly |

**Rationale:**
JetBrains Mono was designed specifically for developers, with increased letter height for better readability and distinctive ligatures that make code more legible. Its slightly rounded forms soften the technical feel while maintaining clarity. It feels right at home in our tech-forward brand while being incredibly practical for code-related content.

**Google Fonts Import:**
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
```

**CSS Import:**
```css
@import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700&display=swap');
```

**Fallback:**
```css
font-family: 'JetBrains Mono', 'Fira Code', 'SF Mono', 'Consolas', 'Monaco', monospace;
```

---

### 1.4 Font Pairing Summary

| Purpose | Font | Character |
|---------|------|-----------|
| **Display** | Space Grotesk | Personality, headlines, brand voice |
| **Body** | Inter | Readability, content, UI |
| **Code** | JetBrains Mono | Technical, precision, data |

**The Pairing Dynamic:**
- Space Grotesk brings the **cosmic tech personality**
- Inter brings the **human readability**
- JetBrains Mono brings the **developer credibility**

Together they create a harmonious system: expressive when needed, clear when important, technical when appropriate.

---

## 2. Type Scale

### 2.1 Size Scale (Desktop)

| Token | Size (px) | Size (rem) | Line Height | Letter Spacing | Usage |
|-------|-----------|------------|-------------|----------------|-------|
| **Hero** | 64px | 4rem | 1.1 | -0.02em | Hero headlines, splash pages |
| **H1** | 40px | 2.5rem | 1.2 | -0.02em | Page titles, major sections |
| **H2** | 32px | 2rem | 1.25 | -0.01em | Section headers |
| **H3** | 24px | 1.5rem | 1.3 | -0.01em | Subsections, card titles |
| **H4** | 20px | 1.25rem | 1.4 | 0 | Feature titles, small headers |
| **Large** | 18px | 1.125rem | 1.5 | 0 | Lead paragraphs, emphasis |
| **Body** | 16px | 1rem | 1.6 | 0 | Default body text |
| **Small** | 14px | 0.875rem | 1.5 | 0.01em | Secondary text, captions |
| **Caption** | 12px | 0.75rem | 1.4 | 0.02em | Labels, metadata, timestamps |
| **Tiny** | 10px | 0.625rem | 1.3 | 0.02em | Badges, tags, legal |

### 2.2 Size Scale (Mobile)

| Token | Size (px) | Size (rem) | Line Height | Letter Spacing |
|-------|-----------|------------|-------------|----------------|
| **Hero** | 40px | 2.5rem | 1.1 | -0.02em |
| **H1** | 32px | 2rem | 1.2 | -0.02em |
| **H2** | 28px | 1.75rem | 1.25 | -0.01em |
| **H3** | 22px | 1.375rem | 1.3 | -0.01em |
| **H4** | 18px | 1.125rem | 1.4 | 0 |
| **Large** | 16px | 1rem | 1.5 | 0 |
| **Body** | 16px | 1rem | 1.6 | 0 |
| **Small** | 14px | 0.875rem | 1.5 | 0.01em |
| **Caption** | 12px | 0.75rem | 1.4 | 0.02em |
| **Tiny** | 10px | 0.625rem | 1.3 | 0.02em |

---

## 3. Typography Styles

### 3.1 Display Styles (Space Grotesk)

```css
/* Hero — Maximum Impact */
.text-hero {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 4rem; /* 64px */
  font-weight: 700;
  line-height: 1.1;
  letter-spacing: -0.02em;
}

/* H1 — Page Titles */
.text-h1 {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 2.5rem; /* 40px */
  font-weight: 700;
  line-height: 1.2;
  letter-spacing: -0.02em;
}

/* H2 — Section Headers */
.text-h2 {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 2rem; /* 32px */
  font-weight: 600;
  line-height: 1.25;
  letter-spacing: -0.01em;
}

/* H3 — Subsections */
.text-h3 {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 1.5rem; /* 24px */
  font-weight: 600;
  line-height: 1.3;
  letter-spacing: -0.01em;
}

/* H4 — Feature Titles */
.text-h4 {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 1.25rem; /* 20px */
  font-weight: 600;
  line-height: 1.4;
}
```

### 3.2 Body Styles (Inter)

```css
/* Lead — Intro Paragraphs */
.text-lead {
  font-family: 'Inter', sans-serif;
  font-size: 1.125rem; /* 18px */
  font-weight: 400;
  line-height: 1.5;
}

/* Body — Default Text */
.text-body {
  font-family: 'Inter', sans-serif;
  font-size: 1rem; /* 16px */
  font-weight: 400;
  line-height: 1.6;
}

/* Body Strong */
.text-body-strong {
  font-family: 'Inter', sans-serif;
  font-size: 1rem; /* 16px */
  font-weight: 600;
  line-height: 1.6;
}

/* Small — Secondary */
.text-small {
  font-family: 'Inter', sans-serif;
  font-size: 0.875rem; /* 14px */
  font-weight: 400;
  line-height: 1.5;
  letter-spacing: 0.01em;
}

/* Caption — Metadata */
.text-caption {
  font-family: 'Inter', sans-serif;
  font-size: 0.75rem; /* 12px */
  font-weight: 500;
  line-height: 1.4;
  letter-spacing: 0.02em;
  text-transform: uppercase;
}

/* Tiny — Minimal */
.text-tiny {
  font-family: 'Inter', sans-serif;
  font-size: 0.625rem; /* 10px */
  font-weight: 500;
  line-height: 1.3;
  letter-spacing: 0.02em;
}
```

### 3.3 Monospace Styles (JetBrains Mono)

```css
/* Code Block */
.code-block {
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875rem; /* 14px */
  font-weight: 400;
  line-height: 1.6;
}

/* Inline Code */
.code-inline {
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875em; /* Relative to parent */
  font-weight: 500;
  line-height: 1.4;
  padding: 0.125em 0.375em;
  border-radius: 0.25rem;
  background: var(--surface-sunken);
}

/* Technical Data */
.text-mono {
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.875rem; /* 14px */
  font-weight: 400;
  line-height: 1.5;
  letter-spacing: 0;
}

/* Terminal / Console */
.text-terminal {
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.8125rem; /* 13px */
  font-weight: 400;
  line-height: 1.4;
}
```

---

## 4. Line Heights

| Token | Value | Usage |
|-------|-------|-------|
| **Tight** | 1.1 | Hero headlines, single lines |
| **Snug** | 1.2 | H1, display text |
| **Normal** | 1.3 | H2, H3, medium headers |
| **Relaxed** | 1.4 | H4, small headers, captions |
| **Loose** | 1.5 | Lead text, small body |
| **Comfortable** | 1.6 | Body text, paragraphs |
| **Code** | 1.6 | Code blocks, readability |

---

## 5. Letter Spacing

| Token | Value | Usage |
|-------|-------|-------|
| **Tight** | -0.02em | Large headlines (Hero, H1) |
| **Snug** | -0.01em | Medium headers (H2, H3) |
| **Normal** | 0 | Body text, most content |
| **Wide** | 0.01em | Small text (14px) |
| **Wider** | 0.02em | Captions, labels, uppercase |
| **Widest** | 0.05em | Buttons, tracking text |

---

## 6. Font Weights

| Token | Value | Usage |
|-------|-------|-------|
| **Light** | 300 | Large display, elegant feel (Space Grotesk only) |
| **Regular** | 400 | Body text, normal content |
| **Medium** | 500 | Emphasis, labels, buttons |
| **SemiBold** | 600 | Subheadings, strong emphasis |
| **Bold** | 700 | Headlines, maximum emphasis |

---

## 7. Typography Pairings

### 7.1 Hero Section
```
┌─────────────────────────────────────┐
│  The Future of                      │  ← Space Grotesk, 64px, Bold
│  Developer Tools                    │     (Gradient text optional)
│                                     │
│  Build faster, deploy smarter,      │  ← Inter, 18px, Regular
│  and scale effortlessly with our    │     (Max-width: 65ch)
│  cosmic platform.                   │
│                                     │
│  [ Get Started ]                    │  ← Space Grotesk, 16px, Medium
└─────────────────────────────────────┘
```

### 7.2 Content Section
```
┌─────────────────────────────────────┐
│  Why Choose Pink Beam?              │  ← Space Grotesk, 32px, SemiBold
│                                     │
│  Lightning Fast Performance         │  ← Space Grotesk, 20px, SemiBold
│                                     │
│  Our edge infrastructure delivers   │  ← Inter, 16px, Regular
│  sub-50ms response times globally.  │     (Line height: 1.6)
│  Built for the modern web.          │
│                                     │
│  Learn more →                       │  ← Inter, 14px, Medium
└─────────────────────────────────────┘
```

### 7.3 Code Documentation
```
┌─────────────────────────────────────┐
│  Quick Start                        │  ← Space Grotesk, 32px, SemiBold
│                                     │
│  Install the CLI:                   │  ← Inter, 16px, Regular
│                                     │
│  $ npm install -g @pinkbeam/cli     │  ← JetBrains Mono, 14px
│                                     │
│  Then initialize your project:      │  ← Inter, 16px, Regular
│                                     │
│  $ pinkbeam init my-project         │  ← JetBrains Mono, 14px
│  ✓ Created project structure        │     (Success indicator)
│  ✓ Installed dependencies           │
│  ✓ Ready to deploy                  │
└─────────────────────────────────────┘
```

### 7.4 Card Component
```
┌────────────────────────────┐
│                            │
│  [Icon]                    │
│                            │
│  Real-time Sync            │  ← Space Grotesk, 20px, SemiBold
│                            │
│  Keep your data in sync    │  ← Inter, 14px, Regular
│  across all devices with   │     (Muted color)
│  our WebSocket protocol.   │
│                            │
│  Read docs →               │  ← Inter, 14px, Medium
└────────────────────────────┘
```

---

## 8. Responsive Typography

### 8.1 Breakpoints

| Breakpoint | Hero | H1 | H2 | H3 | Body |
|------------|------|-----|-----|-----|------|
| **Desktop** (≥1024px) | 64px | 40px | 32px | 24px | 16px |
| **Tablet** (≥768px) | 48px | 36px | 28px | 22px | 16px |
| **Mobile** (<768px) | 40px | 32px | 24px | 20px | 16px |

### 8.2 CSS Implementation

```css
/* Base (Mobile First) */
.text-hero { font-size: 2.5rem; }   /* 40px */
.text-h1 { font-size: 2rem; }       /* 32px */
.text-h2 { font-size: 1.5rem; }     /* 24px */
.text-h3 { font-size: 1.25rem; }    /* 20px */
.text-body { font-size: 1rem; }     /* 16px */

/* Tablet */
@media (min-width: 768px) {
  .text-hero { font-size: 3rem; }   /* 48px */
  .text-h1 { font-size: 2.25rem; }  /* 36px */
  .text-h2 { font-size: 1.75rem; }  /* 28px */
  .text-h3 { font-size: 1.375rem; } /* 22px */
}

/* Desktop */
@media (min-width: 1024px) {
  .text-hero { font-size: 4rem; }   /* 64px */
  .text-h1 { font-size: 2.5rem; }   /* 40px */
  .text-h2 { font-size: 2rem; }     /* 32px */
  .text-h3 { font-size: 1.5rem; }   /* 24px */
}
```

---

## 9. Tailwind Config Snippet

```javascript
// tailwind.config.js
module.exports = {
  theme: {
    fontFamily: {
      display: ['Space Grotesk', 'sans-serif'],
      body: ['Inter', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
      mono: ['JetBrains Mono', 'Fira Code', 'SF Mono', 'Consolas', 'monospace'],
    },
    fontSize: {
      'hero': ['4rem', { lineHeight: '1.1', letterSpacing: '-0.02em' }],      // 64px
      'h1': ['2.5rem', { lineHeight: '1.2', letterSpacing: '-0.02em' }],      // 40px
      'h2': ['2rem', { lineHeight: '1.25', letterSpacing: '-0.01em' }],       // 32px
      'h3': ['1.5rem', { lineHeight: '1.3', letterSpacing: '-0.01em' }],      // 24px
      'h4': ['1.25rem', { lineHeight: '1.4' }],                               // 20px
      'lead': ['1.125rem', { lineHeight: '1.5' }],                            // 18px
      'body': ['1rem', { lineHeight: '1.6' }],                                // 16px
      'small': ['0.875rem', { lineHeight: '1.5', letterSpacing: '0.01em' }],  // 14px
      'caption': ['0.75rem', { lineHeight: '1.4', letterSpacing: '0.02em' }], // 12px
      'tiny': ['0.625rem', { lineHeight: '1.3', letterSpacing: '0.02em' }],   // 10px
    },
    fontWeight: {
      light: 300,
      normal: 400,
      medium: 500,
      semibold: 600,
      bold: 700,
    },
    letterSpacing: {
      tighter: '-0.02em',
      tight: '-0.01em',
      normal: '0',
      wide: '0.01em',
      wider: '0.02em',
      widest: '0.05em',
    },
    lineHeight: {
      none: 1,
      tight: 1.1,
      snug: 1.2,
      normal: 1.3,
      relaxed: 1.4,
      loose: 1.5,
      comfortable: 1.6,
    },
  },
}
```

**Tailwind Usage Examples:**
```html
<!-- Hero headline -->
<h1 class="font-display text-hero font-bold text-pink-500">
  Pink Beam
</h1>

<!-- Section header -->
<h2 class="font-display text-h2 font-semibold text-void-900 dark:text-white">
  Features
</h2>

<!-- Body text -->
<p class="font-body text-body text-void-600 dark:text-void-300">
  Build faster with our cosmic platform.
</p>

<!-- Code block -->
<code class="font-mono text-small bg-void-100 dark:bg-void-800 px-2 py-1 rounded">
  npm install
</code>

<!-- Caption -->
<span class="font-body text-caption uppercase tracking-wider text-void-400">
  Updated 2 min ago
</span>
```

---

## 10. CSS Complete Reference

```css
/* ========================================
   PINK BEAM — TYPOGRAPHY SYSTEM
   ======================================== */

/* Font Imports */
@import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700&display=swap');

/* Font Family Variables */
:root {
  --font-display: 'Space Grotesk', sans-serif;
  --font-body: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --font-mono: 'JetBrains Mono', 'Fira Code', 'SF Mono', Consolas, Monaco, monospace;

  /* Font Sizes */
  --text-hero: 4rem;      /* 64px */
  --text-h1: 2.5rem;      /* 40px */
  --text-h2: 2rem;        /* 32px */
  --text-h3: 1.5rem;      /* 24px */
  --text-h4: 1.25rem;     /* 20px */
  --text-lead: 1.125rem;  /* 18px */
  --text-body: 1rem;      /* 16px */
  --text-small: 0.875rem; /* 14px */
  --text-caption: 0.75rem;/* 12px */
  --text-tiny: 0.625rem;  /* 10px */

  /* Line Heights */
  --leading-tight: 1.1;
  --leading-snug: 1.2;
  --leading-normal: 1.3;
  --leading-relaxed: 1.4;
  --leading-loose: 1.5;
  --leading-comfortable: 1.6;

  /* Letter Spacing */
  --tracking-tighter: -0.02em;
  --tracking-tight: -0.01em;
  --tracking-normal: 0;
  --tracking-wide: 0.01em;
  --tracking-wider: 0.02em;
  --tracking-widest: 0.05em;
}

/* Display Typography */
.font-display { font-family: var(--font-display); }
.font-body { font-family: var(--font-body); }
.font-mono { font-family: var(--font-mono); }

/* Size Classes */
.text-hero { font-size: var(--text-hero); }
.text-h1 { font-size: var(--text-h1); }
.text-h2 { font-size: var(--text-h2); }
.text-h3 { font-size: var(--text-h3); }
.text-h4 { font-size: var(--text-h4); }
.text-lead { font-size: var(--text-lead); }
.text-body { font-size: var(--text-body); }
.text-small { font-size: var(--text-small); }
.text-caption { font-size: var(--text-caption); }
.text-tiny { font-size: var(--text-tiny); }

/* Weight Classes */
.font-light { font-weight: 300; }
.font-normal { font-weight: 400; }
.font-medium { font-weight: 500; }
.font-semibold { font-weight: 600; }
.font-bold { font-weight: 700; }

/* Line Height Classes */
.leading-tight { line-height: var(--leading-tight); }
.leading-snug { line-height: var(--leading-snug); }
.leading-normal { line-height: var(--leading-normal); }
.leading-relaxed { line-height: var(--leading-relaxed); }
.leading-loose { line-height: var(--leading-loose); }
.leading-comfortable { line-height: var(--leading-comfortable); }

/* Letter Spacing Classes */
.tracking-tighter { letter-spacing: var(--tracking-tighter); }
.tracking-tight { letter-spacing: var(--tracking-tight); }
.tracking-normal { letter-spacing: var(--tracking-normal); }
.tracking-wide { letter-spacing: var(--tracking-wide); }
.tracking-wider { letter-spacing: var(--tracking-wider); }
.tracking-widest { letter-spacing: var(--tracking-widest); }

/* Complete Typography Presets */
.preset-hero {
  font-family: var(--font-display);
  font-size: var(--text-hero);
  font-weight: 700;
  line-height: var(--leading-tight);
  letter-spacing: var(--tracking-tighter);
}

.preset-h1 {
  font-family: var(--font-display);
  font-size: var(--text-h1);
  font-weight: 700;
  line-height: var(--leading-snug);
  letter-spacing: var(--tracking-tighter);
}

.preset-h2 {
  font-family: var(--font-display);
  font-size: var(--text-h2);
  font-weight: 600;
  line-height: var(--leading-snug);
  letter-spacing: var(--tracking-tight);
}

.preset-h3 {
  font-family: var(--font-display);
  font-size: var(--text-h3);
  font-weight: 600;
  line-height: var(--leading-normal);
  letter-spacing: var(--tracking-tight);
}

.preset-h4 {
  font-family: var(--font-display);
  font-size: var(--text-h4);
  font-weight: 600;
  line-height: var(--leading-relaxed);
}

.preset-lead {
  font-family: var(--font-body);
  font-size: var(--text-lead);
  font-weight: 400;
  line-height: var(--leading-loose);
}

.preset-body {
  font-family: var(--font-body);
  font-size: var(--text-body);
  font-weight: 400;
  line-height: var(--leading-comfortable);
}

.preset-small {
  font-family: var(--font-body);
  font-size: var(--text-small);
  font-weight: 400;
  line-height: var(--leading-loose);
  letter-spacing: var(--tracking-wide);
}

.preset-caption {
  font-family: var(--font-body);
  font-size: var(--text-caption);
  font-weight: 500;
  line-height: var(--leading-relaxed);
  letter-spacing: var(--tracking-wider);
  text-transform: uppercase;
}

.preset-code {
  font-family: var(--font-mono);
  font-size: var(--text-small);
  font-weight: 400;
  line-height: var(--leading-comfortable);
}

/* Responsive Scaling */
@media (max-width: 1023px) {
  :root {
    --text-hero: 3rem;    /* 48px */
    --text-h1: 2.25rem;   /* 36px */
    --text-h2: 1.75rem;   /* 28px */
    --text-h3: 1.375rem;  /* 22px */
  }
}

@media (max-width: 767px) {
  :root {
    --text-hero: 2.5rem;  /* 40px */
    --text-h1: 2rem;      /* 32px */
    --text-h2: 1.5rem;    /* 24px */
    --text-h3: 1.25rem;   /* 20px */
  }
}
```

---

## 11. Usage Best Practices

### 11.1 Readability Rules

✅ **DO:**
- Keep body text at 16px minimum
- Maintain line length of 60-75 characters for body text
- Use proper line height (1.5-1.6) for paragraphs
- Ensure 4.5:1 contrast ratio for body text

❌ **DON'T:**
- Use all-caps for long text
- Use Light weight (300) below 24px
- Set line height tighter than 1.2 for body
- Mix more than 2 font families on one page

### 11.2 Hierarchy Guidelines

1. **One Hero per page** — Maximum impact element
2. **Use H1 once** — Page title only
3. **Skip levels carefully** — Don't jump from H2 to H4
4. **Visual weight > semantic** — It's okay to use H2 styling on an H3 if hierarchy is clear

### 11.3 Brand Voice Through Typography

| Situation | Font | Treatment |
|-----------|------|-----------|
| **Marketing headlines** | Space Grotesk | Bold, gradient, tight tracking |
| **Product features** | Space Grotesk | SemiBold, clear hierarchy |
| **Documentation** | Inter | Regular, comfortable line height |
| **Code examples** | JetBrains Mono | Syntax highlighted |
| **CTA buttons** | Space Grotesk | Medium weight, wide tracking |
| **Captions/labels** | Inter | Uppercase, wide tracking |

---

*Document Version: 1.0*  
*Brand: Pink Beam*  
*Created: 2026-02-07*
