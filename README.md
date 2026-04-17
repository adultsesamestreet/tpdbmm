# tinyMediaManager (TPDB Edition)

A custom **tinyMediaManager** entry with the **ThePornDB scraper plugin** bundled for adult metadata workflows (NFO + poster management).

## What this custom entry does

- Builds from the official `tinymediamanager/tinymediamanager` container pattern.
- Bakes in the TPDB plugin JAR at image build time (no manual plugin install needed).
- Keeps tinyMediaManager state persistent under `/data`.
- Uses `/media/...` mounts for library content.

## Included TPDB plugin behavior

- The TPDB plugin JAR is pre-installed in common tinyMediaManager addons paths.
- **No API token is hard-coded**.
- On first run, enter your own TPDB API key at:
  - **Settings → Movies → Scrapers → TPDB**

> Note: This repo intentionally leaves the TPDB API field blank by default.

## Files

- `Dockerfile`: Custom tinyMediaManager image with baked-in TPDB plugin JAR.
- `docker-compose.yml`: App entry wiring persistent `/data` and `/media/...` library mounts.

## Run

```bash
docker compose up -d --build
```

Then open tinyMediaManager and configure the scraper token if needed.

## Storage model

- `./data` on host → `/data` in container (persistent settings and app state)
- `./media/movies` on host → `/media/movies` in container
- `./media/tvshows` on host → `/media/tvshows` in container

## Platform note

This custom entry is intended for **x86_64** tinyMediaManager Docker deployments.
