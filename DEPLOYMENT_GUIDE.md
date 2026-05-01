# Pistilli.com → Cloudflare Pages Migration Guide

## What's Been Done

✅ Full static mirror of https://pistilli.com created using HTTrack  
✅ All assets downloaded (HTML, CSS, JS, images)  
✅ Git repository initialized  
✅ Deployment scripts created  

**Location:** `~/.openclaw/workspace/pistilli.com`  
**Size:** ~1MB (117 files)

---

## Deployment Options

### Option 1: Quick Deploy via Wrangler CLI (5 minutes)

```bash
cd ~/.openclaw/workspace/pistilli.com
./deploy.sh
```

This script will:
- Install Wrangler if needed
- Authenticate with Cloudflare
- Create project `pistilli-com`
- Deploy the site

After deployment, you'll get a URL like: `https://pistilli-com.pages.dev`

### Option 2: GitHub + Cloudflare Dashboard (10 minutes)

1. **Create GitHub repo:**
   ```bash
   cd ~/.openclaw/workspace/pistilli.com
   gh repo create mmamakas/pistilli-com --public --source=. --push
   ```

2. **Connect to Cloudflare:**
   - Cloudflare Dashboard → Pages → "Create a project"
   - "Connect to Git" → Select `mmamakas/pistilli-com`
   - Build settings:
     - Framework preset: **None**
     - Build command: *(leave empty)*
     - Build output directory: `/`
   - Click "Save and Deploy"

---

## DNS Configuration

**Current Setup:**
- Domain: `pistilli.com`
- Registrar: GoDaddy
- Nameservers: `NS23.DOMAINCONTROL.COM`, `NS24.DOMAINCONTROL.COM`

### Recommended: Transfer DNS to Cloudflare

1. **Add domain to Cloudflare:**
   - Cloudflare Dashboard → Add site → `pistilli.com`
   - Choose Free plan
   - Cloudflare will scan existing DNS records

2. **Update nameservers at GoDaddy:**
   - Log in to GoDaddy
   - Domain settings → Nameservers → Custom
   - Replace with Cloudflare's nameservers (provided after adding domain)

3. **Connect Pages to domain:**
   - Cloudflare Dashboard → Pages → `pistilli-com` → Custom domains
   - Add `pistilli.com` and `www.pistilli.com`
   - Cloudflare will auto-create DNS records

**Timeline:** DNS propagation takes 1-48 hours (usually < 1 hour)

### Alternative: CNAME Only (Faster, Less Control)

If you want to keep DNS at GoDaddy:

1. **Deploy to Cloudflare Pages first**
2. **Get Pages URL** (e.g., `pistilli-com.pages.dev`)
3. **At GoDaddy DNS:**
   - Delete A record for `@`
   - Add CNAME: `@` → `pistilli-com.pages.dev`
   - Add CNAME: `www` → `pistilli-com.pages.dev`

⚠️ **Note:** Root domain CNAMEs may not work on all DNS providers. Cloudflare DNS handles this better.

---

## Testing Before Go-Live

1. Deploy to Cloudflare Pages
2. Visit the `.pages.dev` URL
3. Verify:
   - Site loads correctly
   - Logo displays
   - Links work ("Pay Rent", "Privacy Policy", "Drop a line")
   - Mobile responsive
   - Google Analytics tracking fires

---

## Rollback Plan

If anything goes wrong:

1. **DNS rollback:**
   - Change nameservers back to GoDaddy's
   - Or delete CNAME records

2. **Keep old hosting active** for 48 hours after DNS change

---

## What's Next?

After successful deployment:

1. ✅ Site is live on Cloudflare Pages (free, fast, secure)
2. ✅ Auto SSL certificate
3. ✅ Global CDN distribution
4. ❓ **Cancel GoDaddy hosting** (once confident migration is stable)
5. ❓ **Transfer domain to Cloudflare** (optional, cheaper renewal + better integration)

---

## Support

- **Cloudflare Pages docs:** https://developers.cloudflare.com/pages/
- **Wrangler CLI docs:** https://developers.cloudflare.com/workers/wrangler/

Need help? Just ask.
