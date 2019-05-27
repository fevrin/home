set autoindent

nmap <c-t> :tabnew<cr> # make new tabs more easy

nmap <c-q> :q<cr> # make closing tabs more easy

highlight normal guifg=#00ff00

source $VIMRUNTIME/mswin.vim " from <https://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv#answer-10604>
behave mswin

"au BufWritePre /tmp/pentadactyl.txt write! $HOME/documents/work-related/tmp/pentadactyl-lastedit " from <https://code.google.com/p/dactyl/issues/detail?id=435> so that computer freezes do not permanently lose pentadactyl drafts.  this is a work-around for changing pentadactyl's tmp directory since I haven't found a way to do so yet.  TODO: update this so multiple drafts can be saved in separate files
