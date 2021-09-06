# Vault Agent Docker Container

A small container pre-installed and setup to run the vault agent as a daemon. Used in my homelab for interpolating secrets on local configs.

## Docker Compose

```
version: '2'
services:
  vault-agent:
    image: ghcr.io/kylegrantlucas/vault-agent:latest
    container_name: vault-agent
    restart: unless-stopped
    volumes:
        - /path/to/config:/etc/vault-agent/agent.hcl
```
