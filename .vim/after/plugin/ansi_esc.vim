if exists(':AnsiEsc')
   " color file contents if it has ANSI escape codes (though it doesn't cover all possible combinations)
   " https://github.com/vim-scripts/AnsiEsc.vim/blob/d2bb7878622e4c16203acf1c92a0f4bc7ac58003/autoload/AnsiEsc.vim#L214
   autocmd FileType systemd AnsiEsc

   autocmd BufReadPost,FileReadPost *.log AnsiEsc
endif
