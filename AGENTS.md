# AGENTS.md: rules for agents working in InsulinPlant

This repo is public: github.com/cacherefresh/InsulinPlant. Write everything as if
anyone can read it, because they can.

## Branches

- **`sanctuary` is the main branch.** Never commit to it directly.
- **Every change goes on a feature branch cut from an up-to-date `sanctuary`:**
  ```sh
  git checkout sanctuary
  git pull
  git checkout -b feature/<feature_name>
  ```
- **Name branches `feature/<words_joined_by_underscores>`.** Use underscores,
  not hyphens or spaces.
  - ✅ `feature/new_widget`, `feature/pitch_slide_edits`
  - ❌ `feature/new-widget`, `feature/NewWidget`, `new_widget`
- One feature per branch.
- **Agents do not push, open pull requests, or merge.** Rob does. Commit
  locally and tell Rob the branch name.
- After Rob merges and deletes a branch: switch to `sanctuary`, `git pull`,
  delete the local branch, and start the next feature from there.

## What GitHub Actions does

`.github/workflows/ci_deploy.yml`:

| When | What runs |
|---|---|
| Push to `feature/**` | Analyze, test, build |
| Pull request into `sanctuary` | Analyze, test, build (must pass before merge) |
| Merge into `sanctuary` | Analyze, test, build, then deploy to GitHub Pages at https://insulinplant.cacherefresh.io |

**Run the same checks locally before committing:**
```sh
flutter analyze
flutter test
flutter build web --release --base-href /
```
`flutter test` renders every tab and every pitch slide at phone width (360 px) and
fails on layout overflow. Don't commit with it red.

## Content rules

- **Every number is sourced or labeled.** Add a link in `lib/data/sources.dart`,
  or mark it with `Tag.estimate()` / `Tag.claim()`. Nothing in between.
- **Don't state a person's job title unless it's verified** on a current public
  source. If it isn't, leave the title out.
- **Never guess about a company's internal state.** Turn the guess into a question.
- **No private details about anyone** (health, family, anything learned in
  confidence), and no personal contact information.
- **Personal or emotional text is Rob's to write.** Use `RobPlaceholder` (in the
  app) or `🔴 [ROB — YOUR WORDS]` (in markdown) and leave it for him.
- **Plant-made insulin is the mission.** Never write anything that downplays it.
- **Division of labor:** Rob's side grows the plant and extracts the insulin. Cost
  Plus Drugs does fill-finish and distribution. Don't describe Rob as doing
  fill-finish.

## Where things live

| What | Where |
|---|---|
| Acreage math and phases | `lib/data/capacity.dart` |
| Source links | `lib/data/sources.dart` |
| Page text | `lib/pages/*.dart` |
| Pitch slides (the app reads these) | `pitch_deck/slide_NN_*.md`, format in `pitch_deck/README.md` |
| Private drafts (git-ignored, never commit) | `DRAFT_EMAIL_NEXT_STEPS/` |
