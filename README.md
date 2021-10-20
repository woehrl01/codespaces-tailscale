# codespaces-tailscale

Example Codespace to demonstrate how you can use tailscale to access other resources.

Changes needed in `devcontainer.json`:

```
"runArgs": ["--privileged"]
```

As the deamon of tailscale is not started automatically. I created a `init_tailscale.sh` file which runs the daemon in the background and then inits the tailscale setup.

If you have configured a [secret for your codespace](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces) (`TAILSCALE_EPHEMERAL_KEY`). The node is created as [ephemerable node](https://tailscale.com/kb/1111/ephemeral-nodes/)[^1].

Furthermore all known hosts are added to `/etc/hosts` for easier access.

[^1]: Please keep in mind that if you use an ephemerable node only IPv6 adresses are working.

