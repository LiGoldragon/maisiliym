# MAISILIYM NODE OPERATOR GUIDELINES

**MUST UPDATE WHEN EDITING REPO:** Node and network identity declarations live in `datom.nix` through `NodeProposal.nodes.*`. This document is the canonical operator reference; `README.md` mirrors it for convenience.

## Node/Network Truth
- Maisiliym owns node/network truth so CriomOS can consume, build, and deploy from it. Operators do not treat auxiliary files as authoritative opinions.
- Every change starts with `datom.nix` (the `NodeProposal.nodes.*` map) before any mirrors, downstream docs, or deployment agendas are updated.

## Happy-path Operator Steps
1. Confirm the requested node or network identity change, including the existing `NodeProposal.nodes` entry that must be updated.
2. Update `datom.nix` inside the `NodeProposal.nodes.*` section with the new name, roles, or addresses. Keep the change limited to the fields required for the update; additional commentary belongs in this guidance doc only when necessary for clarification.
3. Run the usual validation (`nix flake check` or the equivalent Maisiliym validation job) to make sure the `NodeProposal` still builds cleanly.
4. Notify CriomOS that the Maisiliym truth source has changed so their consumption/build/deploy pipeline can pick up the new `NodeProposal` contents.
5. If further context is required, add it to this guidance doc; do not treat `README.md` as the source of truth.
