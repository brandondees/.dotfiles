# brandondees/.dotfiles

This is a configuration/dotfile repository for me to fast track rebuilding my development environment.

Original version inherited from pachonk/.dotfiles and customized to my own liking from there.

## Usage

```bash
curl -fsSL https://raw.githubusercontent.com/brandondees/.dotfiles/master/install-scripts/install.sh | bash
```

After it is done installing, you will want to change the git config from my config to your config like so:

```bash
git config --global user.name "Bobby Joe"
git config --global user.email bobby.joe@example.com
```

Also add .env variables if needed.

Some install scripts included are not run by default. Apply them optionally.
