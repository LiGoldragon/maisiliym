{
  description = "Maisiliym - CrioSphere Proposal for Prometheus LLM Infrastructure";

  outputs = { self, ... }: {
    # NodeProposal for CriomOS flake consumption
    NodeProposal = {
      clusters = {
        prometheus = {
          # Trust configuration
          trust = {
            cluster = 1;
            nodes = {
              "prometheus" = 1;
            };
            users = {
              "li" = 1;
            };
          };

          # Node configuration
          nodes = {
            "prometheus" = {
              # Node species: largeAI for AI/LLM workloads
              species = "largeAI";
              
              # Size: 3 (max size for large AI nodes)
              size = 3;
              
              # Trust level
              trust = 1;
              
              # Machine configuration
              machine = {
                species = "metal";
                arch = "x86_64-linux";
                cores = 32;
                model = "Prometheus AI Server";
              };
              
              # I/O configuration
              io = {
                keyboard = "colemak";
                bootloader = "uefi";
                disks = {
                  root = {
                    device = "/dev/nvme0n1";
                    size = "500G";
                  };
                  models = {
                    device = "/dev/nvme1n1";
                    size = "2T";
                  };
                };
                swapDevices = [ ];
              };
            };
          };

          # User configuration
          users = {
            "li" = {
              size = 1;
              species = "unlimited";
              style = "emacs";
              keyboard = "colemak";
            };
          };
        };
      };
    };
  };
}
