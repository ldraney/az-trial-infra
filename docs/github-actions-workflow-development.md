## Useful command to validate workflows:
Consider two combinations of Nix and Docker to run Act for GitHub workflow validation. Let's break this down:
1. Using a multi-stage Dockerfile:

```dockerfile
FROM nixos/nix as builder
RUN nix-channel --update
RUN nix-env -iA nixpkgs.act

FROM catthehacker/ubuntu:act-latest
COPY --from=builder /nix/store /nix/store
COPY --from=builder /root/.nix-profile /root/.nix-profile
ENV PATH="/root/.nix-profile/bin:${PATH}"
```

2. Using a direct Docker run command with Nix:

```bash
docker run -it \
  -v ${PWD}:/workspace \
  -w /workspace \
  nixos/nix \
  sh -c "nix-channel --update && nix-env -iA nixpkgs.act && act"
```

The second option is simpler for one-off runs. You can save it as an alias or script:

```bash
alias act-nix='docker run -it -v ${PWD}:/workspace -w /workspace nixos/nix sh -c "nix-channel --update && nix-env -iA nixpkgs.act && act"'
```

To use it with your GitHub workflows, you'll also want to add these flags:

```bash
docker run -it \
  -v ${PWD}:/workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w /workspace \
  nixos/nix \
  sh -c "nix-channel --update && nix-env -iA nixpkgs.act && act -P ubuntu-latest=catthehacker/ubuntu:act-latest"
```

This mounts the Docker socket to allow Act to create containers and specifies the runner image for ubuntu-latest workflows.

Would you like me to explain any part of these commands in more detail?
