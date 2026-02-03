# Be Mine

A playful Valentine's Day meme site featuring an evasive "No" button and celebratory animations.

## Features

- Interactive "Yes/No" buttons with a twist
- The "No" button dodges your cursor/touch
- Sad puppy appears when you try to say no
- Celebratory confetti when you say yes
- Fully responsive for mobile devices

## Quick Start (Docker)

```bash
# Build and run
docker compose up -d

# Access at http://localhost:3000
```

## Project Structure

```
be-mine/
├── dist/
│   └── index.html    # Self-contained HTML/CSS/JS
├── nginx.conf        # Nginx configuration
├── Dockerfile        # Container definition
└── docker-compose.yml
```

## Customization

The site is a single `index.html` file. To customize:

1. Edit `dist/index.html`
2. Replace images in the `IMAGES` object:
   - `initial` - Default cute animal
   - `sad` - Shown when hovering "No"
   - `happy` - Shown after clicking "Yes"
3. Modify colors via CSS custom properties (`--primary-pink`, etc.)

## Tech Stack

- Vanilla HTML/CSS/JavaScript
- Nginx Alpine - Production server
- No build step required

## Production Deployment

This app is deployed via the [public-gateway](https://github.com/ajk-kja/public-gateway) stack:

- **URL:** https://kiki.ilgailu.com
- **Stack:** `~/public-gateway` on VPS
- **Routing:** Cloudflare → Caddy → nginx → be-mine container

The `docker-compose.yml` in this repo is for standalone/development use. For production, the app is served through the public-gateway stack.

## License

MIT
