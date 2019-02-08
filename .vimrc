set nocompatible " vim, not vi

" turn off mouse mode
set mouse=c

" tabs to 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

" language specific, too
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" live reload files if it changes on disk
set autoread

" word wrap more excellently
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" relative line numbers
set relativenumber 
set number

" search options
set incsearch
set hlsearch
set ignorecase
set smartcase

" fzf file fuzzy search
nnoremap <C-p> :FZF<CR>

" selecta
" https://github.com/garybernhardt/selecta
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>p :call SelectaCommand("find * -type f", "", ":e")<cr>



" ag searching
let g:ackprg = "ag --vimgrep --smart-case --hidden --ignore .git "
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" ctags file setup
set tags=./.tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" use control s to save and exit insert mode
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" additional escapes
imap jk <esc>
imap kj <esc>

" open panes same location as tmux
set splitbelow
set splitright

" stop using arrow keys, dammit
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Plugins!
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
" Plug 'thoughtbot/vim-rspec'
" Plug 'skywind3000/asyncrun.vim' " Augment Vim-Test
Plug 'reinh/vim-makegreen' " Augment Vim-Test
Plug 'janko-m/vim-test' " Multi-tool test runner commands
Plug 'tpope/vim-bundler'
Plug 'sheerun/vim-polyglot'
Plug 'w0ng/vim-hybrid'
Plug 'blueshirts/darcula'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-mix-format'
Plug 'editorconfig/editorconfig-vim'

" ejs support
Plug 'nikvdp/ejs-syntax'

" Wakatime, a time spent coding tracker
" Plug 'wakatime/vim-wakatime'

call plug#end()

" Theme
colorscheme darcula

" See whitespace
set list

" Test Running
" let g:rspec_command = "!clear && bundle exec bin/rspec {spec}"

let g:mix_format_on_save = 1

" custom leader commands
let mapleader = ","
" source vimrc
map <leader>so :source $MYVIMRC<CR>
map <leader>vr :split $MYVIMRC<CR>
map <Esc><Esc> :noh<CR>:set nopaste<CR>
map <leader>r :!resize<CR><CR>
map <leader>f :set paste<CR>mmggi# frozen_string_literal: true<CR><CR><Esc>`m:set nopaste<CR>
map <leader>c :!ctags -R --languages=ruby --exclude=.git --exclude=log --tag-relative=yes -f .tags . $(bundle list --paths)<CR>
map <leader>co mmgg"+yG`m
map <leader>' cs"'
map <leader>" cs'"
" map <Leader>o :w<cr>:call RunNearestSpec()<CR>

" ALE Asynchronous Lint Engine Config
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" Vim Test Config and Shortcuts
" let test#strategy = 'asyncrun'
let test#strategy = 'makegreen'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" GitGutter Config
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_highlight_lines = 1

" Line Length Guide
set textwidth=80
set colorcolumn=+1

" No local swp and ~ files
set directory=/tmp

" Spellcheck on by default for markdown
autocmd BufRead,BufNewFile *md setlocal spell

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>
