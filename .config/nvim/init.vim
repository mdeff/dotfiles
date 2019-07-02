" This file is found via the VIMINIT env variable:
" let $VIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $VIMRC

"if has('nvim')
"	" Use vim stuff (plugins, languages) installed with pacman.
"	set rtp^=/usr/share/vim/vimfiles/
"endif
"else
"	" XDG base directory support for vim.
"	" nvim uses $XDG_DATA_HOME/nvim.
"	set directory=$XDG_DATA_HOME/vim/swap//
"	set backupdir=$XDG_DATA_HOME/vim/backup//
"	set undodir=$XDG_DATA_HOME/vim/undo//
"	set viminfo+=n$XDG_DATA_HOME/vim/viminfo/viminfo
"endif
" Neovim and vim use the same plugins.
"set runtimepath+=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after
"let &packpath = &runtimepath

set undofile         " Save undos after file closes.
set undolevels=1000  " How many undos.
set undoreload=10000 " Number of lines to save for undo.

" Automatically save when changing buffers.
set autowrite
"set autowriteall

" Move by display line instead of physical lines.
" Map keys in normal, visual, and operator-pending (e.g., for dj) modes.
" No need to map in insert mode with inoremap, <C-o>k already works on display lines.
" <silent> to not echo it on the command line
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Set <leader> to space. Easy to reach from both hands.
" <localleader> is meant for mappings that depend on file type.
" Common choices are backslash, comma, and space.
let mapleader = " "  " default to \\
let maplocalleader = " "  " default to \\

call plug#begin('~/.config/nvim/plugged')

" Sensible configuration.
Plug 'tpope/vim-sensible'

" Solarized color theme.
Plug 'altercation/vim-colors-solarized'
"Plug 'iCyMind/NeoSolarized'
"let g:solarized_termcolors=16

" Status bar.
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'

" Add filetype glyphs (icons) to plugins (NerdTree, vim-airline).
" Should be loaded after those plugins.
Plug 'ryanoasis/vim-devicons'

" Git support. Report branch in status bar.
Plug 'tpope/vim-fugitive'

" Shows a git diff in the 'gutter' (sign column).
Plug 'airblade/vim-gitgutter'

" File explorer.
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"noremap <C-n> :NERDTreeToggle <CR>
" Automatically start NERDTree.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use ranger as file explorer. More features than the other, e.g., cd.
Plug 'rafaqz/ranger.vim'
noremap <leader>rr :RangerEdit<cr>
noremap <leader>rv :RangerVSplit<cr>
noremap <leader>rs :RangerSplit<cr>
"noremap <leader>rt :RangerTab<cr>
"noremap <leader>ri :RangerInsert<cr>
"noremap <leader>ra :RangerAppend<cr>
"noremap <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
noremap <leader>rd :RangerCD<cr>
"noremap <leader>rld :RangerLCD<cr>

" Use ranger as file explorer.
"Plug 'francoiscabrol/ranger.vim'
"let g:ranger_map_keys = 0
"noremap <leader>r :Ranger<CR>
"let g:ranger_replace_netrw = 1
"Plug 'rbgrouleff/bclose.vim'  " dependency of francoiscabrol/ranger.vim

" Close buffers without closing window (as bclose).
"Plug 'qpkorr/vim-bufkill'

" Interface to grep tools: ag, ack, git grep, ripgrep, pt, sift, findstr, grep.
" Alternative: fzf.
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
"nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>g :Grepper -tool rg<cr>
"nnoremap <leader>G :Grepper -tool ag<cr>
nnoremap gs  <plug>(GrepperOperator)
"xnoremap gs  <plug>(GrepperOperator)

" Tab for auto-completion.
Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<c-n>"  " Select from top.

" Don't show docstring when searching for completions.
autocmd FileType python setlocal completeopt-=preview

" Most used autocompletion. Supports many languages.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_filetype_blacklist = { }  " Enable completion for text, markdown, etc.
nnoremap <Leader>d :YcmCompleter GoTo<CR>
nnoremap <Leader>u :YcmCompleter GoToReferences<CR>
nnoremap <Leader>h :YcmCompleter GetDoc<CR>

" Async autocompletion (jedi for Python). No goto, documentation, renaming.
"Plug 'roxma/nvim-completion-manager'  " Neovim only.
"Plug 'maralla/completor.vim'  " Vim 8 only.

" Specific to Python. More lightweight?
" Completion is slow because it's sync. Type np.abs to try.
" Semantic renaming is the only feature missing in YCM.
"Plug 'davidhalter/jedi-vim'
"let g:jedi#completions_enabled = 0

" Async autocompletion. Neovim only. No goto, documentation, renaming.
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'

" Syntax checking (via external tools).
"Plug 'vim-syntastic/syntastic'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Asynchronous lint engine (via external tools).
Plug 'w0rp/ale'
let g:ale_echo_msg_format = '[%linter%] %s'
" let g:ale_open_list = 1  " Open error window (can be opened with lopen).
" Save battery life.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
"let g:ale_lint_delay
"nnoremap <silent> <S-k> <Plug>(ale_previous_wrap)
"nnoremap <silent> <S-j> <Plug>(ale_next_wrap)
"let g:ale_emit_conflict_warnings = 0  " Don't warn about neomake.
let g:ale_fixers = {
\   'python': [
\       'autopep8',
\       'isort',
\       'yapf',
\       'remove_trailing_lines',
\   ],
\}
" auto-flake8 ?
nnoremap <F8> <Plug>(ale_fix)

" Asynchronous make (conflicts with ALE).
"Plug 'neomake/neomake'
"set makeprg = make -j 4
"noremap <F5> :w <CR> :Neomake! <CR>

" Format according to style (whole buffer or selection).
Plug 'Chiel92/vim-autoformat'
let g:formatter_yapf_style = 'pep8'  " YAPF default style: pep8, google, facebook, chromium.
noremap <F3> :Autoformat<CR>

" Sort Python imports (whole buffer or selection).
Plug 'fisadev/vim-isort'
let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = '<F4>' " <C-i> by default
noremap <F4> :Isort<CR>

" Pandoc helper.
Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
let g:pandoc#modules#disabled = ["folding"]
"let g:pandoc#command#autoexec_on_writes = 1
"let g:pandoc#command#autoexec_command = "make"
let g:pandoc#biblio#bibs = "/data/research/bibliography/refs.bib"
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }
let g:pandoc#syntax#conceal#use = 0

" Latex helper.
Plug 'lervag/vimtex', { 'for': 'tex' }
let g:vimtex_view_method = 'zathura'
"let g:vimtex_compiler_progname = 'latexmk'  " forward search only
let g:vimtex_compiler_progname = 'nvr'  " forward and backward search, install neovim-remote from AUR
"let g:tex_flavor = 'latex'

" Comment with gc(c).
Plug 'tpope/vim-commentary'

" Easy surrounding of text with quotes, tags, etc.
Plug 'tpope/vim-surround'

" Takes the <number> out of <number>w or <number>f{char}.
" Use with <lader><lader>w, <lader><lader>b, etc.
" Seems to involved / complex for me.
" Plug 'easymotion/vim-easymotion'

" Jump to any location specified by two characters.
" Typing sea jumps to the next instance of "ea". Works with ; and ,.
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

" Exchange so forward is "," and backward is ";" = "Shift+,".
" Better be consistent with other vi movement implementations (like in jupyter).
" noremap , ;
" noremap ; ,
" map , <Plug>Sneak_;
" map ; <Plug>Sneak_,

" Do not save swaps of encrypted files.
" TODO: find a better solution.
Plug 'https://gist.github.com/5890634.git', { 'frozen': 1 }

" Change window with CTRL+{h,l,k,j}.
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j

" Change buffer with SHIFT+{h,l}.
noremap <S-h> :bprev<Return>
noremap <S-l> :bnext<Return>

" Integration with i3wm.
"Plug 'termhn/i3-vim-nav'
"nnoremap <silent> <c-l> :call Focus('right', 'l')<CR>
"nnoremap <silent> <c-h> :call Focus('left', 'h')<CR>
"nnoremap <silent> <c-k> :call Focus('up', 'k')<CR>
"nnoremap <silent> <c-j> :call Focus('down', 'j')<CR>

"Plug 'jwilm/i3-vim-focus'
"noremap gwl :call Focus('right', 'l')<CR>
"noremap gwh :call Focus('left', 'h')<CR>
"noremap gwk :call Focus('up', 'k')<CR>
"noremap gwj :call Focus('down', 'j')<CR>

" Start screen.
Plug 'mhinz/vim-startify'

call plug#end()

" Solarized color theme.
syntax on
"set termguicolors
set background=dark
colorscheme solarized
"colorscheme NeoSolarized

" Redo actions with . in visual mode.
vnoremap . :norm.<CR>

" Syntastic in status line.
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

set tabstop=4       " The width of a TAB is set to 4. Still it is a \t. It is
					" just that Vim will interpret it to be having a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set noexpandtab     " Do not expand TABs to spaces

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Additional options.
set number
set hlsearch
set spell spelllang=en_us
set spellfile=~/.config/nvim/spell/mywords.utf-8.add
"set textwidth=80
set colorcolumn=81
filetype plugin indent on
set encoding=utf-8

" Mappings.
"inoremap <Tab> <C-P>
noremap <F5> :w <CR> :!make -j 4 <CR> <CR>
"noremap <F6> :w <CR> :!latexmk <CR> <CR>

" Visually wrap lines.
set wrap
set linebreak
set nolist  " list disables linebreak

" Disable hard wrapping.
" Prevent automatic insertion of linebreaks during edition.
set textwidth=0
set wrapmargin=0

" Highlight whitespace at EOL.
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Remove trailing whitespace.
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

" Apply macros in visual mode.
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
