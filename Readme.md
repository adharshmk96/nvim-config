# My neovim configuration

Get Started with NeoVim

## Install NeoVim

```bash
brew install neovim
```

## Clone this repository

```bash
git clone https://github.com/adharshmk96/nvim-config ~/.config/nvim
```

Keymap Reference.

jk - exit insert mode

## Substitute

- s - substitute motion
- ss - substitute line
- S - substitue EOL
- (visual) s - substitute selection

## Surround

surround selection with (), "", ''

- ys\<motion\>\<surround\> - add surround
- ys\<motion\>t\<surround\> - add surround tag
- ds\<motion\>\<surround\> - remove surround
- dst - remove surround tag

## Macros to do multiline editing

- `qa` - start recording
- make changes
- `q` - stop recording
- `@a` - play recording
- `n@a` - play recording n times
