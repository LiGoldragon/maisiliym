I'm using the writing-plans skill to create the implementation plan.

# Prometheus Always-On Center Reclassification Implementation Plan

> **REQUIRED SUB-SKILL:** Execute this plan using either `/skill:executing-plans` (parallel session) or `/skill:subagent-driven-development` (same-session loop).

**Goal:** Reclassify the `prometheus` node from `edge` to `center` and update the documentation so the repo consistently treats it as an always-on server/center node.

**Architecture:** Operate on the `NodeProposal` expression (`datom.nix`) that is exported by `flake.nix`. Update the `prometheus` node definition to center, then document that the live-image/bootstrapping work is for a center node that remains online.

**Tech Stack:** Nix configuration (`datom.nix`), Markdown documentation (`README.md`), Jujutsu (`jj`) for commits/pushes, and shell tooling for validation.

---

### Task 1: Reclassify the `prometheus` node entry

**TDD scenario:** Trivial change — update the `species` field and prove `rg` captures the new value.

**Files:**
- Modify: `/home/li/git/maisiliym/datom.nix` (the `prometheus` node block near the bottom of the nodes section)

**Step 1:** Run `rg -n "prometheus" /home/li/git/maisiliym/datom.nix` and screenshot the `species = "edge"` line for pre-change proof.

**Step 2:** Edit the `prometheus` block so `species = "center"` while leaving all machine/io details intact.

**Step 3:** Run `rg -n "species = \"center\"" /home/li/git/maisiliym/datom.nix` to confirm the updated line is present, proving the new classification.

**Step 4:** Run `jj status` in `/home/li/git/maisiliym` to ensure `datom.nix` is the only modified file.

**Step 5:** Save the change in preparation for the next task (keep the working copy clean enough for README edits and commit).

### Task 2: Update README text to describe the always-on center/server role

**TDD scenario:** Trivial doc change — replace references to a live-image/edge bootstrap with language explaining the center/server role.

**Files:**
- Modify: `/home/li/git/maisiliym/README.md` around the bullet points describing `prometheus` (lines near the top of the file).

**Step 1:** Inspect `/home/li/git/maisiliym/README.md` to identify sentences that mention `live-image` or `edge` bootstrap for `prometheus`.

**Step 2:** Adjust the wording so the README highlights that `prometheus` is an always-on server/center node (mentioning the Evo-X2 lane and that it serves as the installed center).

**Step 3:** Confirm via `rg -n "prometheus" /home/li/git/maisiliym/README.md` that the updated sentences now reflect the center/server role.

**Step 4:** Run `jj status` to verify only README and `datom.nix` are changed before committing.

**Step 5:** Note the documentation is now aligned with the new classification, and the working copy is ready for a single commit.

### Task 3: Commit the changes and push the branch

**TDD scenario:** Trivial — ensure metadata updates are recorded and the remote bookmark reflects the new change.

**Files:**
- None (the commit stage)

**Step 1:** Run `jj diff` to confirm `datom.nix` and `README.md` have the intended changes.

**Step 2:** Run `jj commit -m "Reclassify prometheus as center node"` while on the mutable revision so the change is recorded.

**Step 3:** Run `jj bookmark -m prometheus-node @` (if needed) to keep the bookmark pointed at the new commit (and to ensure `prometheus-node` is still the runtime target).

**Step 4:** Run `jj git push --bookmark prometheus-node` to update `prometheus-node@origin` with the new commit.

**Step 5:** Run `jj git status` or `jj status` to confirm the working copy is clean and mention that remote and local bookmarks are synchronized.
