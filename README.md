# InsulinPlant
This is. alanding page for some of my 20 years waiting for this damn patent to expire that big pharma submarine sank -_____-

---

## About this app

A mobile-first Flutter web app that gets a reader up to speed on my research
notes for **For Diabetics, By Diabetics**: making human insulin in safflower,
the expired patent, how much land it takes, and the facilities that already exist.

Every number links to its source, or is marked **Estimate** or **Company claim**.
Facts were last checked 2026-10-17.

### Tabs

| Tab | What's there |
|---|---|
| Home | The five facts, division of labor (we grow and extract, Cost Plus fills and finishes) |
| Pitch | The 10-slide deck, swipeable. Content lives in `pitch_deck/*.md` |
| Patent | US 7,547,821, the Botaneco license, and the 2006–2012 timeline |
| Farm | Land from a 100-patient greenhouse up to every Type 1 on Earth, vs. US corn |
| Sites | Aurora Sun, the former iBio plant in Bryan TX, GreenLab |
| Emerging | Chloroplast lettuce/tobacco: not yet Phase I/II, and not our route |
| About me (top-right icon) | Background, with placeholders only I fill in |

### Run locally

```sh
flutter pub get
flutter run -d chrome
```

Phone layout: Chrome DevTools → Toggle device toolbar (⌘⇧M) → pick an iPhone or Pixel.

### Where to change things

- **Numbers and phases:** `lib/data/capacity.dart`. Every card on the Farm tab is computed from it.
- **Source links:** `lib/data/sources.dart`
- **Page text:** `lib/pages/*.dart`
- **Pitch slides:** `pitch_deck/*.md` (format in `pitch_deck/README.md`)
- **My placeholders:** search for `RobPlaceholder` and replace each with real text.

### Deploy to GitHub Pages

1. Merge into `sanctuary` (the default branch) on github.com/cacherefresh/InsulinPlant.
2. In the repo, go to **Settings → Pages → Source** and choose **GitHub Actions**.
3. `.github/workflows/deploy.yml` builds and publishes on every push to `sanctuary`.
   The site will be at `https://cacherefresh.github.io/InsulinPlant/`.

To build by hand: `flutter build web --release --base-href /<repo-name>/`
