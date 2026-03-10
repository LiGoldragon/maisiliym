# Maisiliym Node Proposal

This repository exports a `NodeProposal` via `flake.nix` so CriomOS agents can coordinate hardware resources for the Maisiliym cluster. The configuration lives in `datom.nix`, and every node here is meant to align with the existing `maisiliym` user and trust model.

## Prometheus (EVO-X2 live-image/agent bootstrap)

- Node name: `prometheus` (added to `NodeProposal.nodes` in `datom.nix`).
- Hardware: GMKtec EVO-X2 / AMD AI Max+ (x86-64 metal). The node is intentionally lean; it does not hardcode disk UUIDs because it runs the first-boot live image and is reserved for CriomOS bootstrap work.
- Networking: The node is identified as Ethernet-first for bootstrap traffic so that CriomOS agents target it via physical ethernet before any higher level overlays.
- Purpose: CriomOS agents use `prometheus` to stage the live-image and coordinate subsequent disk provisioning for the Maisiliym cluster without diverging from the centralized user/access model already expressed for `li`, `bird`, and the rest of `NodeProposal.users`.

Agents integrating with this repository should point to `NodeProposal.nodes.prometheus` when they need the EVO-X2 live-image lane and trust that the node will be managed exclusively through the existing Maisiliym workflow.
