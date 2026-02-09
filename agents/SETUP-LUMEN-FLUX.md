# 🚀 LUMEN + FLUX Setup Checklist

**Before these AI employees can start working, configure the following:**

---

## ✅ LUMEN (Brand Designer) — Setup

### Required
- [x] **GEMINI_API_KEY** — ✅ CONFIGURED in `~/.openclaw/.env`

### Already Configured ✓
- [x] **OpenAI API Key** — DALL-E 3 fallback
- [x] **Nano Banana Pro skill** — Installed at `~/.npm-global/lib/node_modules/openclaw/skills/nano-banana-pro/`
- [x] **uv** — Package manager (install via `brew install uv` if missing)

### Optional (Manual Tools)
- [ ] **Figma account** — Free tier sufficient (figma.com)
- [ ] **Canva account** — Free tier sufficient (canva.com)
- [ ] **Remove.bg API** — If doing heavy background removal

---

## ✅ FLUX (Motion Designer) — Setup

### Required
- [x] **ELEVENLABS_API_KEY** — ✅ CONFIGURED in `~/.openclaw/.env`

### Recommended (Web Apps)
- [ ] **Runway ML account** — Standard plan ($28/month)
  - Sign up: runwayml.com
  - Use web interface (no API needed for most work)
  
- [ ] **Screen Studio** — One-time $89 (Mac only)
  - Alternative: Use OBS (free) or ScreenFlow ($169)
  - Download: screenstudio.uy

- [ ] **Descript** — Free tier or Creator ($12/month)
  - Sign up: descript.com

### Optional
- [ ] **Music licensing** — Uppbeat.io ($6.99/month) or Artlist ($16.60/month)

---

## 💰 Total Setup Cost

| Item | Cost | Required? |
|------|------|-----------|
| Gemini API | Free tier / Pay-as-you-go | **YES** |
| ElevenLabs | $5/month minimum | **YES** |
| Runway ML | $28/month | Recommended |
| Screen Studio | $89 one-time | Recommended |
| Descript | Free tier | Optional |
| Music license | $7-17/month | Optional |
| **Minimum to start** | **$5/month** | |
| **Fully equipped** | **~$50/month + $89** | |

Compare to human designers: **$10,000-25,000/month**

---

## 🎯 Quick Start (Minimum Viable)

**If you want to start TODAY with minimal setup:**

1. **Get Gemini API key** (free, instant)
   → LUMEN can start generating images immediately

2. **Get ElevenLabs API key** ($5/month)
   → FLUX can generate voiceovers

3. **Use free alternatives:**
   - Instead of Runway: Use Pika Labs (Discord, free tier)
   - Instead of Screen Studio: Use OBS (free) or QuickTime
   - Instead of Descript: Use iMovie or basic editing

**Total: $5/month to start**

---

## 📝 Environment File Template

Keys stored in `~/.openclaw/.env` only:

```bash
# Already configured
OPENAI_API_KEY=sk-...
CLOUDFLARE_API_TOKEN=...

# Configured for design employees
GEMINI_API_KEY=...
ELEVENLABS_API_KEY=...

# Optional
REMOVE_BG_API_KEY=...
RUNWAY_API_KEY=...
```

---

## 🎬 Activation Sequence

Once keys are set:

1. **Test LUMEN:**
   ```bash
   uv run ~/.npm-global/lib/node_modules/openclaw/skills/nano-banana-pro/scripts/generate_image.py \
     --prompt "A minimalist pink beam logo, geometric, modern tech" \
     --filename "test-logo.png" \
     --resolution 1K
   ```

2. **Test FLUX voice:**
   ```bash
   curl -X POST https://api.elevenlabs.io/v1/text-to-speech/TxGEqnHWrfWFTfGW9XjX \
     -H "xi-api-key: $ELEVENLABS_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"text": "Pink Beam. Living Intelligence Systems.", "model_id": "eleven_monolingual_v1"}' \
     --output test-voice.mp3
   ```

3. **Create WORK-LOCK task** and activate employees

---

**Estimated setup time: 15-30 minutes**

**Can start generating assets: Immediately after**
