" Vim filetype plugin file
" Language:	doxygen

au BufNewFile,BufRead *.dox setfiletype doxygen

  "Table Mode
  "Always use markdown compatible table corners
let g:table_mode_corner='|'
