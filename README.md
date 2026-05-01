# Pistilli Management Website

Static site mirror for Cloudflare Pages deployment.

## Deployment

### Option 1: Wrangler CLI (Recommended)

```bash
npx wrangler pages project create pistilli-com
npx wrangler pages deploy . --project-name=pistilli-com
```

### Option 2: GitHub + Cloudflare Dashboard

1. Push this repo to GitHub
2. Go to Cloudflare Dashboard → Pages → Create a project
3. Connect GitHub repo
4. Set build settings:
   - Build command: (leave empty)
   - Build output directory: `/`
5. Deploy

## DNS

After deployment, update DNS:

1. Cloudflare Dashboard → DNS → pistilli.com
2. Add CNAME: `@` → `<your-pages-subdomain>.pages.dev`
3. Or use Cloudflare nameservers and let Pages handle it automatically
