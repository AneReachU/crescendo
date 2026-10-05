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

## 15. Engineering Principles

### Accuracy

Musical and examination claims must be validated before being presented
as authoritative.

### Explainability

When Crescendo gives feedback, the learner should understand why.

### Deliberate Practice

The system should target specific weaknesses rather than encourage
unfocused repetition.

### Human-Centred Music

Automation should support musicianship rather than replace musical
judgement.

### Privacy First

Learner data and recordings should be protected by design.

### Modular Architecture

Major capabilities should remain modular so that new instruments,
curricula and learning systems can be added without rebuilding the
platform.

### iPad First

Touch interaction, landscape practice, microphone access, headphones and
future MIDI workflows should be treated as first-class requirements.

### Progressive Enhancement

Core learning should work without requiring advanced hardware or cloud
services.

## 16. Current Development Priority

The current development sequence is:

1. ABRSM Grade 1 Piano Coach
2. Adaptive learning and assessment
3. Aural and sight-reading intelligence
4. Practice analytics
5. Composition and creativity
6. Recording and performance
7. Cloud synchronization
8. Multi-instrument support
9. Advanced musical intelligence

## 17. Product Principle

Crescendo should help a learner become:

**Independent → Musical → Expressive → Creative → Confident**

The ultimate objective is not simply to pass an examination.

It is to help develop an independent musician.
