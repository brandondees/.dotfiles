# brandondees/.dotfiles

This is a configuration/dotfile repository for me to fast track rebuilding my
development environment.

Original version inherited from
[grepsedawk/.dotfiles](https://github.com/grepsedawk/.dotfiles) and customized
to my own liking from there.

## Usage

see [this](https://www.atlassian.com/git/tutorials/dotfiles)
* `alias dotfile='/usr/bin/git --git-dir=$HOME/<choose_a_dir>/ --work-tree=$HOME'`
* `git clone --bare <this_repo> ~/<choose_a_dir>`
* `cd ~`
* `dotfile checkout`

You may need to move some conflicting default files out of the way.

Optionally to only see explicitly tracked files in status etc.
`config config --local status.showUntrackedFiles no`

After it is done installing, you will want to change the git config from my
config to your config like so:

```sh
git config --global user.name "Bobby Joe"
git config --global user.email bobby.joe@example.com
```

Also add `.env` variables if needed. Some install scripts included are not run
by default. Apply them optionally. Some install scripts are not fully baked and
may require some manual help.
