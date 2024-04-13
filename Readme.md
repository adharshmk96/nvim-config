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

## Plugins

```bash
├── alpha.lua
├── auto-session.lua
├── autopairs.lua
├── bufferline.lua
├── colorscheme.lua
├── comment-todo.lua
├── comment.lua
├── copilot.lua
├── debugger.lua
├── dressing.lua
├── formatting.lua
├── gitsigns.lua
├── indent-blankline.lua
├── init.lua
├── lazygit.lua
├── linting.lua
├── lsp
│   ├── lspconfig.lua
│   └── mason.lua
├── lualine.lua
├── nvim-cmp.lua
├── nvim-tree.lua
├── substitute.lua
├── surround.lua
├── telescope.lua
├── treesitter.lua
├── trouble.lua
├── vim-maximizer.lua
└── which-key.lua
```

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

## Comment

- gc - comment
- gd - go to definition

## Navigation

- \<C-o\> - go back
- \<C-i\> - go forward

## Explorer Actions

- `o/Enter` - Open file
- `Tab` - View file
- `^ t` - Open file in New Tab
- `^ v` - Open file in vertical split

## Others

- :InspectTree
- :nmap

## Macros to do multiline editing

- `qa` - start recording
- make changes
- `q` - stop recording
- `@a` - play recording
- `n@a` - play recording n times
