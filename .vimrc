" 1 important
set nocompatible " cp; do *not* behave very Vi compatible

" 2 moving around, searching, and patterns
set incsearch " is; enable incremental searching

" 4 displaying text
set linebreak " lbr; break/wrap lines at a space (not in the middle of a word) 
"set list " ; show non-printable characters
set listchars=eol:$,tab:^_,trail:_ " lcs; strings to use in 'list' mode
set number " nu; enable line numbering

" 5 syntax, highlighting, and spelling
set background=dark " bg; set the background to dark, so highlighting is adjusted appropriately
syntax enable " enable syntax highlighting
set hlsearch " hls; highlight all matches for the last used search pattern
set cursorcolumn " cuc; highlight the screen column of the cursor
set cursorline " cul; highlight the screen line of the cursor
set nospell " automatically spell-check; okay, I give up: no spell-check by default!!!

" 6 multiple windows
set laststatus=2 "ls; statusline will always be displayed, showing modification status; Ctrl+G shows status regardless if this is set or not
set statusline=%f\ %m\ \ ft=%y\ \ char=%b,\ %B,\ #%o,\ #%O%=%l(%L),%c\ \ \ \ \ \ \ %p%% "stl; determines what to show in the status line; the default is: statusline=%-f\ %-m%=%l,%c\ \ \ \ \ \ \ %P; help default is: statusline=%-t\ %-h%-r%=%l,%c%V\ \ \ \ \ \ \ %P
set splitbelow "sb; new window is put below current one
set splitright "spr; new v-window is put right of current one

" 10 gui
set guifont=Lucida_Console:h10:cANSI "gfn; determines gui font
set guifont=Consolas:h10:cANSI       "intended for windows
set guifont=DejaVu\ Sans\ Mono\ 9    "intended for linux
set mousemodel=popup
"copy the selection
map <a-c> "+y
"paste the selection
map <a-v> "+gP

" 11 printing


" 12 messages and info
set showcmd " sc; show commands in the lower-right as they are typed
set ruler " ru; show cursor position below each window
set visualbell t_vb= "vb; sets the visual bell to nothing, so no audible or visible bells are rung after an error (like Backspacing when you're at the beginning of a line)

" 14 editing text
set omnifunc=syntaxcomplete#Complete "ofu; function for filetype-specific Insert mode completion; from <http://vim.wikia.com/wiki/Omni_completion>, <http://arstechnica.com/open-source/guides/2009/05/vim-made-easy-how-to-get-your-favorite-ide-features-in-vim.ars>
"set digraph "dg; enables entering digraphs with c1 <BS> c2 instead of just Ctrl-K c1c2
set matchpairs=(:),{:},[:],<:>,':',":" " mps; list of pairs that match for the "%" command
set joinspaces " js; use two spaces after '.' when joining a line

" 15 tabs and indenting
set tabstop=3 " ts; one tab equals three spaces (instead of 8)
set shiftwidth=3 " sw; number of spaces to use for each step of (auto)indent and shifts (<< and >> commands)
set expandtab " et; Use the appropriate number of spaces to insert a <Tab>; basically, use spaces instead of tabs
set autoindent " ai; autoindent all subsequent lines
set indentexpr="" " inde; indicates when to indent; comment out in $VIMRUNTIME/indent/html.vim
" filetype indent off " disables filetype-based indentation settings
set copyindent " ci; new line indents use same characters (spaces, tabs, etc.) as previous line
"set textwidth=125 " tw; maximum formatted width before text starts wrapping around to the next line; 125, as that's the maximum monospace width in GHE's editing window before a horizontal scroll bar appears

" 16 folding
"set foldmethod=indent " fdm; sets folding type

" 19 reading and writing files
set fileformat=unix " ff; always use unix EOLs (end of lines), by default

" 21 command line editing
set history=4000 " hi; allow for ample command history

":so ~/.vim/extenders/.vim.wrap
":so ~/.vim/extenders/.vim.loadtemplate

set term=xterm " needed for the colorscheme to show as more bold and vibrant than 'screen.xterm-256color'
colorscheme ron

syntax sync minlines=50 " ensure vim doesn't keep changing syntax highlighting; from <http://vim.wikia.com/wiki/Fix_Syntax_Highlighting>

" abbreviations
" CSS
"ab { {<CR>   <CR><C-H>}<Up> " substitutes { with a CSS construct

" maps
"imap '' <esc> " allows for an easier way to escape 
"map "" i"<esc>ea"<esc> " quotes word under cursor (to improve, have it quote everything from start to next white space 
"map "" i"<esc>/ <cr>i"<esc> " quotes word under cursor (to improve, have it quote everything from start to next white space 
map "" i"<esc>f i"<esc> " quotes word under cursor (to improve, have it quote everything from start to next white space 
vmap "" c"<esc>pa"<esc> " wraps visual selection in double quotes
" creates an XHTML image tag; help from <http://linuxgazette.net/148/misc/tag/vimrc>
imap img<tab> <img src="" alt="" /><esc>10hi
"map <CR> o<Esc> " inserts a newline below current line from within normal mode; from <http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode>
"map <S-Enter> O<esc> " inserts a newline above current line from within normal mode
"nmap @c :w<cr>:!javac %<cr>
"nmap @r :!java $(echo % | sed 's;\.[^.]*$;;')<cr>

:let @c=":w\n:!javac %\n" " 'c' for 'compile'
:let @r=":!java $(echo % | sed 's;\.[^.]*$;;')\n" " 'r' for 'run'


" some good resources on:
" general info:
" <http://vimdoc.sourceforge.net/htmldoc/intro.html#5707237730256408377>

" mapping:
" <http://www.linux.com/articles/54936>
" <http://concisionandconcinnity.blogspot.com/2009_07_01_archive.html>

" scripts:
" <http://www.linux.com/articles/62139>

" use ":verbose set xyz" to find out which file's settings are overriding ~/.vimrc
" helpful article at <http://peox.net/articles/vimconfig.html>

" from <https://github.com/tpope/vim-pathogen>
" this allows you to install plugins without having to restart vim
execute pathogen#infect()
