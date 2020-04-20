# Setup a dev environment

Here I will go over the steps required to setup [haskell-ide-engine](https://github.com/haskell/haskell-ide-engine)
**Warning**: This is fairly involved and painfull. Sadly that is the state of most
stuff with build tooling in this language. But if you do manage to go through these
instructions then this is going to be totally worth the effort.

We will use nix based installation for this.

## Setup nix

Taken from [here](https://github.com/NixOS/nix/issues/2925#issuecomment-604501661)

1. Ask for a mountpoint: `sudo bash -c "echo nix >> /etc/synthetic.conf"`
2. **Reboot**. This creates `/nix` as a synthetic, essentially read-only
(mount-only?) folder.
3. Run `sudo diskutil apfs addVolume disk1 APFSX Nix -mountpoint /nix` to create
a volume and mount it on /nix.
4. Run `sudo bash -c 'echo "LABEL=Nix /nix apfs rw" >> /etc/fstab'` to instruct
macOS to remount on reboot.
5. Run `diskutil ap encryptVolume Nix -user disk` to encrypt the volume
(optional but strongly recommended). You'll have to choose a passphrase and type
it twice.
6. **Reboot**. Make sure `/nix` is mounted and you have write access. If you
have encrypted the volume, you will be asked for the passphrase and have the
option of ticking a checkbox to save it in the keychain. If you do, you should
never have to type it again.
7. Run `bash <(curl https://nixos.org/nix/install)`. Notice that there is no
need for sudo here as you have write access to `/nix`.
8. You should have nix installed now execute `nix-env qa` to validate. This
should give out a list of available packages.

## Install HIE

Taken from [here](https://github.com/Infinisil/all-hies#installation)

1. Install cachix client `nix-env -iA cachix -f https://cachix.org/api/v1/install`
2. Start using binary cache `cachix use all-hies`. (Note: There is presently a
bug with nix where it does not reload so you have to do that manually _sigh_)
   - `sudo launchctl stop org.nixos.nix-daemon`
   - `sudo launchctl start org.nixos.nix-daemon`
3. To install stable HIE for a specific set of GHC versions use the following.
(Note: The following command uses version 8.6.5 of GHC)
`nix-env -iA selection --arg selector 'p: { inherit (p) ghc865; }' -f https://github.com/infinisil/all-hies/tarball/master`
4. Try to see if your install worked or not by executing `hie --help`. (This
should work without any errors)

## Setup your editor

Upto the previous point you should have a LSP server running for you. Now we
have to deal with the client side of the things. This is going to be editor
specific I will take [neovim](https://github.com/neovim/neovim) as an example
here. The LSP client that we will use is [coc.nvim](https://github.com/neoclide/coc.nvim)

1. All you need to do here is add some settings to `coc-settings.json`. You can
open this file by opening vim and entering `:CocConfig` and paste the provided
snippent there.

```json
{
    "languageserver": {
        "haskell": {
            "command": "hie-wrapper",
            "args": ["--lsp"],
            "rootPatterns": [
                "stack.yaml",
                "cabal.config",
                "package.yaml"
            ],
            "filetypes": [
                "hs",
                "lhs",
                "haskell"
            ],
            "initializationOptions": {
                "languageServerHaskell": {
                    "hliintOn": true
                }
            }
        }
    }
```
