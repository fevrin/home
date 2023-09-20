" the default shell indentation includes parentheses (even at the end of a line that's just a comment) when determining when to indent...
au FileType sh,bash set indentkeys-=)

" mindbogglingly, this is what actually makes the change stick
"if &filetype ==# 'sh'
if match(['sh','bash'],'^' . &filetype . '$')
   setlocal indentkeys-=)
endif
