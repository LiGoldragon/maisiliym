{
  description = "Maisiliym Cluster";

  outputs = _: {
    NodeProposal = import ./datom.nix;
  };
}
