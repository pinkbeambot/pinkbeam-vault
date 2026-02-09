# TOOLS.md — Brand Designer (LUMEN)

Environment-specific setup for LUMEN's tools.

---

## Nano Banana Pro (Primary Tool) ✓

**Skill:** `nano-banana-pro`  
**Engine:** Gemini 3 Pro Image  
**Cost:** Included in existing setup (Gemini API)  
**Status:** Ready once `GEMINI_API_KEY` is set

**Setup Required:**
```bash
# Add to ~/.openclaw/openclaw.json or ~/.openclaw/.env
export GEMINI_API_KEY="your-key-here"
```

**Usage:**
```bash
# Generate logo concepts
uv run ~/.npm-global/lib/node_modules/openclaw/skills/nano-banana-pro/scripts/generate_image.py \
  --prompt "A minimalist logo for an AI company called Pink Beam, abstract pink laser beam, geometric, vector style, clean lines, modern tech aesthetic, pink and black color scheme" \
  --filename "$(date +%Y-%m-%d-%H-%M-%S)-logo-concept-01.png" \
  --resolution 2K

# Generate hero illustration  
uv run ~/.npm-global/lib/node_modules/openclaw/skills/nano-banana-pro/scripts/generate_image.py \
  --prompt "Hero illustration for AI employee platform website, abstract AI agents as glowing figures working together, cosmic pink beam connecting them, dark void background, modern flat design, professional tech aesthetic" \
  --filename "$(date +%Y-%m-%d-%H-%M-%S)-hero-illustration.png" \
  --resolution 2K

# Edit existing image
uv run ~/.npm-global/lib/node_modules/openclaw/skills/nano-banana-pro/scripts/generate_image.py \
  --prompt "Add more pink glow effects, enhance contrast" \
  --filename "$(date +%Y-%m-%d-%H-%M-%S)-logo-enhanced.png" \
  -i "/path/to/original.png" \
  --resolution 2K
```

**Resolution Options:**
- `1K` - Standard web assets
- `2K` - Marketing materials, hero images  
- `4K` - Large format, print-ready

---

## Fallback: DALL-E 3 (OpenAI)

**API Key:** Already configured  
**Use for:** Quick iterations when Nano Banana is busy

**Usage:**
```bash
curl https://api.openai.com/v1/images/generations \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "dall-e-3",
    "prompt": "A hero illustration for an AI employee platform website...",
    "n": 1,
    "size": "1792x1024"
  }'
```

---

## Figma

**Account:** Create Pink Beam team account  
**Cost:** Free tier (3 projects) or $12/editor/month

**Access:**
- Web app: figma.com
- API: Limited read access (mostly manual export)

**Key Files:**
- Pink Beam Brand System
- Website Design
- Marketing Assets

---

## Local Assets Directory

```bash
# Create structure
mkdir -p ~/pinkbeam/Assets/{Brand,Marketing,Illustrations,Archive}
```

---

## Image Processing CLI Tools

```bash
# Install ImageMagick (if not present)
brew install imagemagick

# Common operations
# Resize for web
convert input.png -resize 1200x -quality 85 output.webp

# Create multiple sizes
for size in 400 800 1200 2400; do
  convert input.png -resize ${size}x -quality 85 output-${size}.webp
done

# Remove background (via remove.bg API)
curl -H "X-Api-Key: $REMOVE_BG_API_KEY" \
  -F "image_file=@input.png" \
  -f https://api.remove.bg/v1.0/removebg \
  -o output.png
```

---

## Asset Naming Convention

```
{project}-{type}-{version}-{size}.{ext}

Examples:
landing-hero-illustration-v2-2400.webp
product-hunt-thumbnail-v1-1200.png
logo-primary-lockup-v3.svg
social-twitter-card-v1-800.webp
```

---

## Quick Reference: Image Sizes

| Use Case | Dimensions | Format |
|----------|-----------|--------|
| Hero illustration | 2400x1200 | WebP |
| Logo (web) | 400x400 | SVG/PNG |
| Social (Twitter) | 1200x675 | WebP/PNG |
| Social (LinkedIn) | 1200x627 | WebP/PNG |
| Product Hunt | 1270x760 | PNG/JPG |
| Favicon | 32x32 - 512x512 | PNG/ICO |

---

## API Keys Needed (Add to .env)

```bash
# ~/.openclaw/.env or project .env
OPENAI_API_KEY=sk-...
REMOVE_BG_API_KEY=...
FIGMA_TOKEN=...
# Midjourney via Discord (no API key, use bot)
```

---

*LUMEN's toolkit — Visual systems, delivered.*
