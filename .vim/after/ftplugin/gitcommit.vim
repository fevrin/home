au FileType gitcommit setlocal tw=125

" mindbogglingly, this is what actually makes the change stick
" this is from
"<https://stackoverflow.com/questions/21322895/vim-how-do-i-override-global-settings/21326851#21326851>
" unlike that advice, though, this doesn't do anything when in ~/.vimrc
if &filetype ==# 'gitcommit'
   setlocal tw=125
endif
