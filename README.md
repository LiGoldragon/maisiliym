# Maisiliym Node Proposal

This repository exports a `NodeProposal` via `flake.nix` so CriomOS agents can coordinate hardware resources for the Maisiliym cluster. The configuration lives in `datom.nix`, and every node here is meant to align with the existing `maisiliym` user and trust model.

## Operator Guidance

Node and network identity statements are authoritative in `docs/GUIDELINES.md`; this README mirrors that guidance for convenience. Start node/network updates in `datom.nix` within `NodeProposal.nodes.*` so Maisiliym retains node/network truth before any mirrors or deployments. Maisiliym owns that truth while CriomOS consumes, builds, and deploys from it.

## Prometheus (EVO-X2 always-on center server install + agent bootstrap)

- Node name: `prometheus` (added to `NodeProposal.nodes` in `datom.nix`).
- Hardware: GMKtec EVO-X2 / AMD AI Max+ (x86-64 metal). The configuration now encodes the installed disk layout so CriomOS agents can rely on the persistent node without deviating from the Maisiliym user/access model.
- Storage: UEFI boot on `/dev/disk/by-uuid/A252-A02B` plus a single Btrfs volume (`d3ad7f53-2470-4744-9ddf-b183c7c22f31`) hosting the `root`, `home`, `nix`, and `var` subvolumes. The install runs without swap devices, and the bootloader is UEFI.
- Networking: The node is still identified as Ethernet-first for bootstrap traffic so CriomOS agents target it via physical ethernet before any higher level overlays.
- Purpose: CriomOS agents use `prometheus` as an always-on center server to stage the live-image and coordinate subsequent disk provisioning for the Maisiliym cluster without diverging from the centralized user/access model already expressed for `li`, `bird`, and the rest of `NodeProposal.users`.

Agents integrating with this repository should point to `NodeProposal.nodes.prometheus` when they need the EVO-X2 lane and trust it will remain under the Maisiliym workflow.
