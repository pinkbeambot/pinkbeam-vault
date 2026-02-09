# TOOLS.md — Motion Designer (FLUX)

Environment-specific setup for FLUX's tools.

---

## Runway ML (Video Generation)

**Account:** Sign up at runwayml.com  
**Plan:** Standard ($28/month) or Pro ($76/month)  
**Features:** Gen-3 Alpha, video editing, motion brush

**Key Capabilities:**
- Text/image to video generation
- Video to video (style transfer)
- Motion brush for selective animation
- Green screen / inpainting

**Workflow:**
1. Generate base video from image prompts
2. Use Motion Brush to animate specific elements
3. Export in target resolution

**Using with Gemini Images:**
Generate static images with LUMEN (Nano Banana/Gemini), then animate in Runway:
```bash
# LUMEN generates the base image
uv run nano-banana-pro ... --filename hero-base.png

# Upload hero-base.png to Runway
# Use "Image to Video" with motion prompts
```

---

## Pika Labs

**Access:** Discord or pika.art web app  
**Cost:** Free tier (limited) or $8-58/month

**Use For:**
- Quick video generation from images
- Text-to-video concepts
- B-roll generation

**Gemini Integration:**
Generate concept images with Gemini API, upload to Pika for animation.
Free tier is often sufficient for launch assets.

---

## ElevenLabs (Voiceover)

**Account:** elevenlabs.io  
**Plan:** Starter ($5/month) or Creator ($22/month) — **REQUIRED**  
**API:** Available for programmatic generation  
**Setup:** Create account → generate API key → add to `.env`

**Recommended Voices:**
- **Adam:** Professional, warm, authoritative
- **Bella:** Professional, friendly, modern
- **Josh:** Conversational, trustworthy

**API Usage:**
```bash
curl -X POST https://api.elevenlabs.io/v1/text-to-speech/TxGEqnHWrfWFTfGW9XjX \
  -H "xi-api-key: $ELEVENLABS_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Meet your new AI workforce...",
    "model_id": "eleven_monolingual_v1",
    "voice_settings": {
      "stability": 0.5,
      "similarity_boost": 0.75
    }
  }' \
  --output voiceover.mp3
```

**Add to `~/.openclaw/.env`:**
```bash
ELEVENLABS_API_KEY=your-key-here
```

---

## Screen Studio

**Purpose:** Polished screen recordings  
**Cost:** $89 one-time (Mac only)  
**Alternative:** ScreenFlow ($169) or free OBS

**Setup:**
```bash
# Screen Studio settings
- Resolution: 1920x1080 (or 2560x1440 for retina)
- Frame rate: 60fps
- Cursor: Highlight clicks, smooth movement
- Zoom: Auto-zoom on clicks
- Background: Clean gradient or solid
```

---

## Descript

**Purpose:** Text-based video editing  
**Cost:** Free tier (watermark) or $12/month  
**Alternative:** DaVinci Resolve (free)

**Key Features:**
- Edit video by editing transcript
- Overdub (AI voice cloning)
- Automatic filler word removal
- Screen recording built-in

---

## Video Output Specs

### Explainer Video
```
Resolution: 1920x1080 (16:9)
Frame rate: 30fps
Codec: H.264
Format: MP4
Audio: AAC, 48kHz, 192kbps
Max file size: 100MB (for web)
```

### Social (Vertical)
```
Resolution: 1080x1920 (9:16)
Frame rate: 30-60fps
Safe zones: Keep text in center 1080x1350
Captions: Required, high contrast
```

### Web Demo
```
Resolution: 1920x1080
Frame rate: 30fps
Quality: High (for detail), compressed for web
Duration: 2-5 minutes max
```

---

## Music & Sound

### Sources (Royalty-Free)
- **Uppbeat.io** — $6.99/month, creator-friendly
- **Artlist** — $16.60/month, unlimited
- **Epidemic Sound** — $15/month
- **YouTube Audio Library** — Free

### Genre Guidelines
- **Explainer:** Upbeat corporate, tech, inspiring
- **Demo:** Subtle, non-distracting, ambient
- **Social:** Trending, energetic, short loops

---

## Local Directory Structure

```bash
mkdir -p ~/pinkbeam/Assets/Video/{Explainer,Social,Demos,Raw,Archive}
mkdir -p ~/pinkbeam/Assets/Audio/{Voiceover,Music,SFX}
```

---

## Asset Naming Convention

```
{project}-{type}-{version}-{spec}.{ext}

Examples:
landing-explainer-v1-master.mp4
landing-explainer-v1-9x16.mp4
landing-explainer-v1-1x1.mp4
researcher-demo-v2-final.mp4
voiceover-intro-v1-adam.mp3
```

---

## API Keys Needed

```bash
# ~/.openclaw/.env or project .env
GEMINI_API_KEY=...      # ✅ SHARED WITH LUMEN — For image generation
ELEVENLABS_API_KEY=...  # REQUIRED — For voiceover only
RUNWAY_API_KEY=...      # If/when available
OPENAI_API_KEY=...      # For DALL-E b-roll (fallback)
```

**Note:** FLUX uses Gemini API (via LUMEN) to generate images that become video assets. The video generation itself happens in Runway/Pika (web apps).

---

## Video Compression (for web)

```bash
# Using ffmpeg
ffmpeg -i input.mp4 -vcodec h264 -acodec aac -crf 23 -preset fast output.mp4

# For multiple sizes
ffmpeg -i input.mp4 -vf "scale=1920:1080" -c:v h264 -crf 23 output-1080.mp4
ffmpeg -i input.mp4 -vf "scale=1280:720" -c:v h264 -crf 23 output-720.mp4
```

---

*FLUX's toolkit — Motion that matters.*
