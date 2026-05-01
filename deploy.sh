#!/bin/bash
# Quick deployment script for Cloudflare Pages

echo "🚀 Deploying Pistilli Management to Cloudflare Pages..."

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo "📦 Installing Wrangler..."
    npm install -g wrangler
fi

# Login to Cloudflare (if not already)
echo "🔐 Checking Cloudflare authentication..."
wrangler whoami || wrangler login

# Deploy
echo "📤 Deploying..."
wrangler pages deploy . --project-name=pistilli-com

echo "✅ Deployment complete!"
echo ""
echo "Next steps:"
echo "1. Go to Cloudflare Dashboard → Pages → pistilli-com"
echo "2. Set up custom domain: pistilli.com"
echo "3. Update nameservers at GoDaddy to Cloudflare's (or add CNAME)"
