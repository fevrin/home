set autoindent

nmap <c-t> :tabnew<cr> # make new tabs more easy

nmap <c-q> :q<cr> # make closing tabs more easy

highlight normal guifg=#00ff00

source $VIMRUNTIME/mswin.vim " from <https://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv#answer-10604>
behave mswin


" undo some of those changes while still enabling their use
if has("gui")
  " CTRL-F shouldn't be the search dialog
  nunmap <C-F>
  iunmap <C-F>
  cunmap <C-F>

" the below can't be used since apparently, vim receives the same key codes for the letters, regardless if Shift was pressed, so it can't distinguish this
" <https://vi.stackexchange.com/questions/4290/can-i-map-a-ctrl-upper-case-letter-separately-from-ctrl-lower-case-letter/4291#4291>

"  " CTRL-Shift-X is Cut
"  vunmap <C-X>
"  vnoremap <C-S-X> "+x
"
"  " CTRL-Shift-C is Copy
"  vunmap <C-C>
"  vnoremap <C-S-C> "+y
"
"  " CTRL-Shift-V is Paste
"  unmap <C-V>
"  iunmap <C-V>
"  vunmap <script> <C-V>
"  vmap <C-S-V>		"+gP
"  imap <C-S-V>		"+gP
endif

"au BufWritePre /tmp/pentadactyl.txt write! $HOME/documents/work-related/tmp/pentadactyl-lastedit " from <https://code.google.com/p/dactyl/issues/detail?id=435> so that computer freezes do not permanently lose pentadactyl drafts.  this is a work-around for changing pentadactyl's tmp directory since I haven't found a way to do so yet.  TODO: update this so multiple drafts can be saved in separate files

" set window size since the default is woefully small
let &lines = 60
let &columns = float2nr(ceil(&lines * 3.33))
