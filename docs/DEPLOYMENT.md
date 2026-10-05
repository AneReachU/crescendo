# Crescendo Deployment Plan

## Phase 1 — Static PWA

1. Deploy the Crescendo application through GitHub Pages.
2. The GitHub Actions workflow validates the deployment assets.
3. Every push to `main` can trigger a new deployment.
4. Open the HTTPS URL on Mihira's iPad using Safari.
5. Use **Share → Add to Home Screen** to install Crescendo as a PWA.

## Phase 2 — Cloud Memory

Crescendo will use a secure backend for authentication, learner data and synchronization.

The initial database foundation is provided in:

`supabase/schema.sql`

Never place a Supabase service-role key or other private credentials in this repository.

Browser applications must use only the public client key with Row Level Security enabled.

## Phase 3 — Offline-First Synchronization

Local learner data should remain available when the device is offline.

When connectivity returns:

- queue local changes
- synchronize with the cloud
- use timestamps/version numbers for conflict resolution
- never blindly overwrite newer learner data

## Phase 4 — Recordings

Audio and video recordings should be stored in object storage rather than directly in database rows.

The database should contain:

- recording metadata
- learner/project reference
- creation date
- duration
- storage reference
- assessment metadata where applicable

## Release Principles

Every production release should:

- pass automated validation
- preserve existing learner data
- use versioned database migrations
- avoid exposing private credentials
- remain usable on iPad and mobile
