"unlet! skip_defaults_vim
"source $VIMRUNTIME/vimrc_example.vim

" some good info at <https://www.vi-improved.org/vim-tips/>

let s:vim_home_dir = $HOME . "/.vim"
if !isdirectory(s:vim_home_dir)
   call mkdir(s:vim_home_dir, "", 0770)
endif

" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" MAIN OPTIONS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" see options with :options

" 1 important
set nocompatible " cp; do *not* behave very Vi compatible

" 2 moving around, searching, and patterns
set incsearch " is; enable incremental searching

" 4 displaying text
set linebreak " lbr; break/wrap lines at a space (not in the middle of a word)
"set list " ; show non-printable characters
set listchars=eol:$,tab:^_,trail:_ " lcs; strings to use in 'list' mode
set number " nu; enable line numbering
au FileType help set nu " enable line number for :help windows, too, since that doesn't seem to happen automatically

" 5 syntax, highlighting, and spelling
set background=dark " bg; set the background to dark, so highlighting is adjusted appropriately
syntax enable " enable syntax highlighting
set hlsearch " hls; highlight all matches for the last used search pattern
"let s:clocksource_file = "/sys/devices/system/clocksource/clocksource0/current_clocksource"
"if (
"\     has("patch-8.2.3455") || (
"\        filereadable(s:clocksource_file) &&
"\        readfile(s:clocksource_file)[0] == 'tsc'
"\     )
"\  ) &&
"\  getfsize(s:clocksource_file) <= 524288000
if has("patch-8.2.3455")

   " this block restricts the situations in which the following option is enabled

   " this is causing severely slow performance in recent versions
   " <https://github.com/vim/vim/issues/8908>
   " it could possibly due to a clock issue:
   " <https://github.com/vim/vim/issues/2712#issuecomment-537690095>
   set cursorcolumn " cuc; highlight the screen column of the cursor

   " this can also cause degraded performance, so we'll want to gate it for now
   set relativenumber " rnu; show the relative line number for each line
endif
set cursorline " cul; highlight the screen line of the cursor
set nospell " automatically spell-check; okay, I give up: no spell-check by default!!!

" 6 multiple windows

set laststatus=2 "ls; statusline will always be displayed, showing modification status; Ctrl+G shows status regardless if
"this is set or not

set statusline=%f\ (bf\ #%n)\ %m\ \ ft=%y\ \ char=%b,\ %B,\ #%o,\ #%O%<%=(line\ %l/%L),(chars\ %{wordcount().chars}),%v\ \ \ \ \ \ \ %p%% "stl; determines what to show in the
"status line; the default is:
"statusline=%-f\ %-m%=%l,%c\ \ \ \ \ \ \ %P; help default is: statusline=%-t\ %-h%-r%=%l,%c%V\ \ \ \ \ \ \ %P

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

set visualbell t_vb= "vb; sets the visual bell to nothing, so no audible or visible bells are rung after an error (like
"Backspacing when you're at the beginning of a line)

" 14 editing text
"
set omnifunc=syntaxcomplete#Complete "ofu; function for filetype-specific Insert mode completion; from
"<http://vim.wikia.com/wiki/Omni_completion>,
"<http://arstechnica.com/open-source/guides/2009/05/vim-made-easy-how-to-get-your-favorite-ide-features-in-vim.ars>

"set digraph "dg; enables entering digraphs with c1 <BS> c2 instead of just Ctrl-K c1c2
set matchpairs=(:),{:},[:],<:>,':',":" " mps; list of pairs that match for the "%" command
set joinspaces " js; use two spaces after '.' when joining a line
if exists('+undofile') || has('persistent_undo')
   let s:desired_undodir = s:vim_home_dir . "/undodir"
   if !isdirectory(s:desired_undodir)
      call mkdir(s:desired_undodir, "", 0700)
   endif
   let &undodir=s:desired_undodir
"   set undodir=s:desired_undodir
   set undofile " automatically save and restore undo history
endif

" 15 tabs and indenting
set tabstop=3 " ts; one tab equals three spaces (instead of 8)
set shiftwidth=3 " sw; number of spaces to use for each step of (auto)indent and shifts (<< and >> commands)
set expandtab " et; Use the appropriate number of spaces to insert a <Tab>; basically, use spaces instead of tabs
set autoindent " ai; autoindent all subsequent lines
set indentexpr="" " inde; indicates when to indent; comment out in $VIMRUNTIME/indent/html.vim
" filetype indent off " disables filetype-based indentation settings
set copyindent " ci; new line indents use same characters (spaces, tabs, etc.) as previous line
"set smartindent " it suggests using ':inoremap # X^H#' so that comments starting with '#' are indented properly, as well

"set textwidth=125 " tw; maximum formatted width before text starts wrapping around to the next line; 125, as that's the
"maximum monospace width in GHE's editing window before a horizontal scroll bar appears

set formatoptions=croqlt " fo; ensures any text width that's set will take effect
                         " c.......Auto-wrap comments using textwidth, inserting the current comment
                         "         leader automatically.
                         " r.......Automatically insert the current comment leader after hitting
                         "         <Enter> in Insert mode.
                         " o.......Automatically insert the current comment leader after hitting 'o' or
                         "         'O' in Normal mode.
                         " q.......Allow formatting of comments with "gq".
                         "         Note that formatting will not change blank lines or lines containing
                         "         only the comment leader.  A new paragraph starts after such a line,
                         "         or when the comment leader changes.
                         " l.......Long lines are not broken in insert mode: When a line was longer than
                         "         'textwidth' when the insert command started, Vim does not
                         "         automatically format it.
                         " t.......Auto-wrap text using textwidth

" 16 folding
"set foldmethod=indent " fdm; sets folding type

" 18 mapping
set ttimeout        " allow timing out halfway into a key code
set timeoutlen=3000 " time in msec for 'timeout'; The time in milliseconds that is waited for a mapped key sequence to complete.
set ttimeoutlen=100 " time in msec for 'ttimeout'; The time in milliseconds that is waited for a key code sequence to complete.
let g:mapleader="," " changes the initial character that triggers execution of a map that uses <Leader>

" 19 reading and writing files
set fileformat=unix " ff; always use unix EOLs (end of lines), by default

" 21 command line editing
set history=4000 " hi; allow for ample command history

":so ~/.vim/extenders/.vim.wrap
":so ~/.vim/extenders/.vim.loadtemplate

set term=xterm " needed for the colorscheme to show as more bold and vibrant than 'screen.xterm-256color'
colorscheme ron

syntax sync minlines=50 " ensure vim doesn't keep changing syntax highlighting; from
"<http://vim.wikia.com/wiki/Fix_Syntax_Highlighting>


" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" FILETYPE OPTIONS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" this section partially augments /usr/share/vim/vim80/filetype.vim

" wrap long lines when diffing
" <https://stackoverflow.com/questions/16840433/forcing-vimdiff-to-wrap-lines/16867953#16867953>
au VimEnter * if &diff | execute 'windo set wrap' | endif
"autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" OpenSSH configuration
" ensure all */.ssh/config* files are set to be of "sshconfig" type
au BufNewFile,BufRead ssh_config,*/.ssh/config* setf sshconfig

" help from
" <https://stackoverflow.com/questions/11023194/automatically-wrap-long-git-commit-messages-in-vim/11023282#11023282>
au FileType gitcommit setlocal spell

" since 'textwidth' is overriden in the global file /usr/share/vim/vim80/ftplugin/gitcommit.vim, we have to put this config
" in a separate file, ~/.vim/after/ftplugin/gitcommit.vim, as that's at the very end of the 'runtimepath'
" not even rearranging the 'runtime' value so ~/.vimrc is at the end fixes the issue
"au FileType gitcommit setlocal tw=125


" when programming, set textwidth=125 since that's the maximum monospace width
" in GH's editing window before a horizontal scroll bar appears

" alternatively, create separate files for each language to contain the settings
" $HOME/.vim/ftdetect/bash.vim
" $HOME/.vim/ftdetect/python.vim
" $HOME/.vim/ftdetect/golang.vim
autocmd FileType go,python,sh,vim,markdown,gitcommit setlocal tw=125


if exists(':AnsiEsc')
   " color file contents if it has ANSI escape codes (though it doesn't cover all possible combinations)
   " https://github.com/vim-scripts/AnsiEsc.vim/blob/d2bb7878622e4c16203acf1c92a0f4bc7ac58003/autoload/AnsiEsc.vim#L214
   autocmd FileType systemd AnsiEsc
   autocmd BufReadPost,FileReadPost *.log AnsiEsc
endif

"au BufNewFile,BufRead *.tsx setf typescript
autocmd FileType typescriptreact setlocal ft=typescript
"autocmd FileType python setlocal ts=4
" autocmd BufRead,BufNew,BufNewFile *.sh,*.py,*.go set tw=125



" options set for editing gpg-encrypted files (using symmetric ASCII armored encryption
" from <https://vim.fandom.com/wiki/Edit_gpg_encrypted_files#Comments>
" another possibility: <https://github.com/jamessan/vim-gnupg>
" Don't save backups of *.gpg files
set backupskip+=*.gpg,*.asc

augroup encrypted
   au!
   " Before reading the file:
   " * disable swap files
   " * set binary file format
   " * empty the 'viminfo' option to avoid parts of the file being saved to .viminfo when yanking or deleting
   autocmd BufReadPre,FileReadPre *.gpg,*.asc
    \ setlocal noswapfile bin viminfo=
   " Decrypt the contents after reading the file, reset binary file format
   " and run any BufReadPost autocmds matching the file name without the .gpg
   " extension
   autocmd BufReadPost,FileReadPost *.gpg,*.asc
    \ execute "'[,']!gpg --decrypt --quiet --default-recipient-self" |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
   " Set binary file format and encrypt the contents before writing the file
   autocmd BufWritePre,FileWritePre *.gpg,*.asc
    \ setlocal bin |
    \ '[,']!gpg --armor --symmetric --cipher-algo AES256 --default-recipient-self
   " After writing the file, do an :undo to revert the encryption in the
   " buffer, and reset binary file format
   autocmd BufWritePost,FileWritePost *.gpg,*.asc
    \ silent u |
    \ setlocal nobin
augroup END





" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" ABBREVIATIONS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" CSS
"ab { {<CR>   <CR><C-H>}<Up> " substitutes { with a CSS construct


" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" COMMANDS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g | noh " from <https://vim.fandom.com/wiki/Super_retab#Super_retab>

" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" MAPS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"imap '' <esc> " allows for an easier way to escape
"map "" i"<esc>ea"<esc> " quotes word under cursor (to improve, have it quote everything from start to next white space
"map "" i"<esc>/ <cr>i"<esc> " quotes word under cursor (to improve, have it quote everything from start to next white space
map "" i"<esc>f i"<esc> " quotes word under cursor (to improve, have it quote everything from start to next white space
vmap "" c"<esc>pa"<esc> " wraps visual selection in double quotes
" creates an XHTML image tag; help from <http://linuxgazette.net/148/misc/tag/vimrc>
imap img<tab> <img src="" alt="" /><esc>10hi

"https://stackoverflow.com/questions/597687/how-to-quickly-change-variable-names-in-vim/597932#597932

"map <CR> o<Esc> " inserts a newline below current line from within normal mode; from
"<http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode>

"map <S-Enter> O<esc> " inserts a newline above current line from within normal mode
"nmap @c :w<cr>:!javac %<cr>
"nmap @r :!java $(echo % | sed 's;\.[^.]*$;;')<cr>


:let @c=":w\n:!javac %\n" " 'c' for 'compile'
:let @r=":!java $(echo % | sed 's;\.[^.]*$;;')\n" " 'r' for 'run'

" from <https://shapeshed.com/vim-netrw/#changing-the-directory-view-in-netrw>
:let g:netrw_liststyle = 3 " set netrw's default list style
":let g:netrw_winsize = 25 " set netrw's default window size percentage
:let g:netrw_altv = 1 " set netrw's default window split


" some good resources on:
" general info:
" <http://vimdoc.sourceforge.net/htmldoc/intro.html#5707237730256408377>

" mapping:
" <http://www.linux.com/articles/54936>
" <http://concisionandconcinnity.blogspot.com/2009_07_01_archive.html>

" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" PLUGINS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

" from <https://github.com/tpope/vim-pathogen>
" this allows you to install plugins without having to restart vim

" but, to avoid needless errors, first ensure the file exists before attempting to source it
"if filereadable("~/.vim/autoload/pathogen.vim")
"   execute pathogen#infect()
"endif


" for vim-go to automatically grab imports, as needed
" from <https://github.com/fatih/vim-go#install>
" and <https://meet.google.com/linkredirect?authuser=0&dest=https%3A%2F%2Fgithub.com%2Ffatih%2Fvim-go-tutorial>
"
" automatically install vim-plug
" <https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation>
let data_dir = has('nvim') ? stdpath('data') . '/site' : s:vim_home_dir
if empty(glob(data_dir . '/autoload/plug.vim'))
   silent !curl -fLo s:vim_home_dir . "/autoload/plug.vim" --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" some plugins Red Hat suggests:
" <https://www.redhat.com/sysadmin/five-vim-plugins>
call plug#begin(s:vim_home_dir . '/plugged')
   Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'frozen': 'true' }
"   Plug 'https://github.com/ElmCast/elm-vim'
   Plug 'https://github.com/fevrin/AnsiEsc.vim', { 'branch': 'main', 'frozen': 'true' } " converts ANSI escape codes to colors
   Plug 'pearofducks/ansible-vim', { 'branch': 'master', 'frozen': 'true' }
   Plug 'tpope/vim-eunuch'
   Plug 'ekalinin/Dockerfile.vim'         " adds syntax highlighting for Dockerfiles
"   Plug 'arp242/undofile_warn.vim'
"   Plug 'airblade/vim-gitgutter'
"   Plug 'vim-airline/vim-airline'
"   Plug 'tpope/vim-fugitive'
"   Plug 'editorconfig/editorconfig-vim' " https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties
"   Plug 'tpope/vim-sensible'
"   Plug 'tpope/vim-sleuth'
"   Plug 'tpope/vim-unimpaired'
"   Plug 'preservim/nerdtree'
"   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"   Plug 'junegunn/fzf.vim'
"   for jump-to-definition functionality without ctags:
"   https://stackoverflow.com/questions/635770/jump-to-function-definition/51195409#51195409
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
"   Plug 'dense-analysis/ale'
"   Plug 'puremourning/vimspector'
"   Plug 'scrooloose/nerdtree'
"   Plug 'scrooloose/nerdcommenter'
"   Plug 'sheerun/vim-polyglot'
"   Plug 'yggdroot/indentline'
"   Plug 'tpope/vim-surround' " adds commands for surrounding arbitrary text with quotes, parentheses, etc.
"   Plug 'kana/vim-textobj-user'
"     \| Plug 'glts/vim-textobj-comment'
"   Plug 'janko/vim-test'
"   Plug 'vim-scripts/vcscommand.vim'
"   Plug 'mhinz/vim-signify'
"   Plug 'rickhowe/spotdiff.vim'
"   Plug 'inkarkat/vim-AdvancedDiffOptions'
"   Plug 'AndrewRadev/linediff.vim'
"   Plug 'mbbill/undotree'                   " lets you visualize a file's undo history
"   Plug 'sjl/gundo.vim'                     " lets you visualize a file's undo history
"   Plug 'powerline/powerline'               " power statusline
call plug#end()

let g:go_fmt_command = "goimports"
let g:elm_format_autosave = 0

" key mappings example for COC
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gD <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" there's way more, see `:help coc-key-mappings@en'


" from <https://stackoverflow.com/questions/21708814/can-vim-diff-use-the-patience-algorithm/63079135#63079135>
if has("patch-8.1.0360")
   set diffopt+=indent-heuristic,algorithm:patience
endif

" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" TROUBLESHOOTING
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

" use this to profile the performance when scrolling down a large file:
" let g:profstart=reltime() | for i in range(1,50) | exec "normal \<C-E>" | redraw | endfor | echo reltimestr(reltime(g:profstart)) . ' seconds'
" let g:profstart=reltime() | for i in range(1,50) | exec "normal j" | redraw | endfor | echo reltimestr(reltime(g:profstart)) . ' seconds'

" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" MISCELLANEOUS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

" scripts:
" <http://www.linux.com/articles/62139>

" use ":verbose set xyz" to find out which file's settings are overriding ~/.vimrc
" helpful article at <http://peox.net/articles/vimconfig.html>

" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" HANDY KEYSTROKES
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

" K   " in normal mode, this displays the man page for the word under the cursor (programs other than `man` can be set in `keywordprg`)
" viw   " useful for selecting up until the next word, such as spaces; v_iw iw; "inner word", select [count] words (see |word|). White space between words is counted too. When used in Visual linewise mode "iw" switches to Visual characterwise mode.

" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" HANDY COMMANDS
" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" :retab   " undoes expandtab; basically, converts spaces of the specified tabstop count (or expandtab, if not specified in the :retab command) back to tabs
" :exe "r !MANWIDTH=" . (winwidth(0) - 5) " command man bash" " you can use something like this to execute a combination of vim and shell commands; in this case, it reads a man page into the current buffer using the buffer's current width (important when buffers are split up)
