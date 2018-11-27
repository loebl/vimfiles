" vim:fdm=marker:fdl=0
set nocompatible "use real VIM settings, instead of Vi-settings

" Vim Options: key mappings {{{

  "remap CTRL+] to something typeable (used to jump in the help), for german keyboard
nnoremap ü <C-]>
nnoremap gü g<C-]>

  "hooray for unused german umlauts!
let mapleader="ä"

  "remap tag completion to CTRL-X CTRL-B
inoremap <C-X><C-b> <C-X><C-]>

" }}}

" Plugins + Options {{{

  "read all plugins from ./bundle
execute pathogen#infect()

  "YouCompleteMe config
let g:ycm_error_symbol = 'e>'
let g:ycm_warning_symbol = 'w>'
let g:ycm_collect_identifiers_from_tags_files = 1
  "put keywords of current programming language into identifier list
"let g:ycm_seed_identifiers_with_syntax = 1
  "increase number of chars typed before menu pops up
let g:ycm_min_num_of_chars_for_completion = 3
  "suppress identifiers with less than 3 characters
let g:ycm_min_num_identifier_candidate_chars = 3
  "limit number of semantic candidates
let g:ycm_max_num_candidates = 12
  "limit number of identifier candidates
let g:ycm_max_num_identifier_candidates = 12
  "automatically opens localtion list if diagnostics update was forced
let g:ycm_open_loclist_on_ycm_diags = 1
if has('win32') || has('win64')
  let g:ycm_global_ycm_extra_conf = '~/vimfiles/ycm_windowsDefaultConf.py'
else
  let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_linuxDefaultConf.py'
endif
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>
"let g:ycm_extra_conf_globlist = ['$HOME/vimfiles/.ycm*']
  "languages supported by YouCompleteMe: C, C++, Obj-C, C#, Python, Go, Typescript, JavaScript
  "Rust, other languages based on tags and syntax elements. Could move ycm to separate directory,
  "enable YCM only for specific filetypes
let g:ycm_filetype_whitelist = {
  \ 'cpp' : 1,
  \ 'cuda' : 1,
  \ 'cs' : 1,
  \ 'css' : 1,
  \ 'dosbatch' : 1,
  \ 'html' : 1,
  \ 'htmldjango' : 1,
  \ 'j': 1,
  \ 'java' : 1,
  \ 'javascript' : 1,
  \ 'json' : 1,
  \ 'jsp' : 1,
  \ 'less' : 1,
  \ 'lua' : 1,
  \ 'make' : 1,
  \ 'matlab' : 1,
  \ 'objc' : 1,
  \ 'perl' : 1,
  \ 'perl6' : 1,
  \ 'php' : 1,
  \ 'python' : 1,
  \ 'ruby' : 1,
  \ 'tex' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'xs' : 1,
  \ 'yaml' : 1
  \}

  "settings for localvimrc. sandbox: source lvimrc files in  sandbox for security reasons
let g:localvimrc_sandbox=0
  "ask before sourcing a lvimrc file
let g:localvimrc_ask=0

" }}}

" Vim Options: editing, indenting {{{
  "allow backspacing over everything in insert mode
set backspace=indent,eol,start

  "automatically indent with the same whitespace as before
set autoindent

  "enable filetype plugins, so VIM tries to autodetect the filetype and use
  " appropriate indention rules etc
filetype plugin indent on

  "how many spaces a tab counts for
set tabstop=8

  "number of spaces for indentation
set shiftwidth=2

  "how many spaces to insert when pressing tab
set softtabstop=2

  "never insert real tabs, always use spaces
set expandtab

  "set automatic formatting options, see fo-table
set formatoptions=croqnj
set textwidth=100

  "show matching parantheses
set showmatch

  "when typing commands show the incomplete command typed in so far
set showcmd

  "UTF-8 related things
if has("multi_byte")
    "fileencodings VIM will test when opening a file
    "can be a comma separated list. Default list is sufficient
  "set fileencodings=ucs-bom,utf-8
    " change default file encoding when writing new files
  set encoding=utf-8
  setglobal fileencoding=utf-8 
endif

" }}}

" Vim Options: general, appearance {{{

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

  "disable backup files
set nobackup

  "do not place swap files in the local directory
set dir-=.

  "enable syntax highlighting, if colors are available
if &t_Co > 2 || has("gui_running")
  syntax on
endif

  "set a color scheme. Other good ones: liquidcarbon, oceandeep, solarized
if has('gui')
  let g:solarized_italic = 0
  colorscheme solarized
elseif has('win32') || has('win64')
  colorscheme oceandeep
endif
set background=dark

  "always show statusline
set laststatus=2
  "Statusline options
set statusline=%f%m%r%h%w[%{&ff}][%{&fenc}]%y%=[%p%%][%l,%c%V]

  "Height of the command line
"set cmdheight=2

  "search incrementally
set incsearch

  "enable line numbers
set number

  " show the cursor position all the time
"set ruler

  "do not wrap lines
set nowrap

if has('gui_running')
    "set a font for the gui
  if has('win32') || has('win64')
    set guifont=Terminus:h12:cANSI
  else
    set guifont=xos4\ Terminus\ 12
  endif
    "remove the menu and toolbar from gvim (m: menubar, T: toolbar, t: tearoff menu items)
  set guioptions-=m
  set guioptions-=t
  set guioptions-=T
    "remove the scrollbars (r is always right, L is left when vert split)
  set guioptions-=r
  set guioptions-=L
  set langmenu=en_US.UTF-8
endif

  "Doxygen syntax loading on top of the usual syntax highlighting
au! Syntax {cpp,c,idl,java,cuda} 
au Syntax {cpp,c,idl,java,cuda} runtime syntax/doxygen.vim
  "disable autobrief behaviour of the doxygen syntax highlighting
let g:doxygen_javadoc_autobrief=0

  "set vim to english
if has('win32') || has('win64')
  language messages en_US
else
  language messages en_US.UTF-8
endif

  "folding
  "syntax: fold by the defined syntax rules. Not every language may provide one
  "indent: fold by indentation level
"set foldmethod=syntax
set foldnestmax=5
  "all folds open
set foldlevel=6

" }}}

" Vim Options: programming related {{{

  "supply a tags file to look up function names and symbols
"set tags+=D:\projekte\ext\tags

  "OmniCppComplete options. TODO: Omnicomplete vs YouCompleteMe.
"let OmniCpp_DisplayMode=1

  "UpdateTages function to update/create tags in current working directory
  "using universal-ctags (ctags.io)
function! UpdateTags()
  execute ":! ctags --languages=c,c++ --c++-kinds=+pl --fields=+iaKnS --extras=+fq --langmap=C++:+.cu.inl -R ."
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
command Ut call UpdateTags()

if has('win32') || has('win64')
    "make settings to get compiler warnings in vim
    "mingw-make + Visual C++
  set makeprg=mingw32-make

    "VS2010+ simple error messages.
  set errorformat=%f(%l)\ :\ %trror\ C%n:\ %m
  set errorformat+=%f(%l)\ :\ %tarning\ C%n:\ %m

    "VS2015+ simple error messages, see also nmake-cmake-cl_VS15.log file:
  set errorformat+=%f(%l):\ %trror\ C%n:\ %m
  set errorformat+=%f(%l):\ %tarning\ C%n:\ %m
  set errorformat+=%f(%l):\ %tote:\ %m
    "VS2015+ remove template parameter messages (I usually don't have any use for them)
  set errorformat+=%-G%\\s%#and,%-G%\\s%#with,%-G%\\s%#[,%-G%\\s%#%s=%m,%-G%\\s%#]
    "VS2015+ remove nmake messages
  "set errorformat+=%-GNMAKE\ :\ %m,%-GStop.
    "VS2015+ remove link messages
  set errorformat+=%-GLINK\ :,%-G%\\s%#Creating%m

    "nvcc V8.0.44 error + warning messages
    "TODO generic nvcc messages do not contain the compiler name. one could use %s, to include it
    "into the quickfix line, but that's an ugly hack
  set errorformat+=nvcc\ %tarning\ :\ %m
  set errorformat+=%f(%l):\ %tarning:\ %m
  set errorformat+=%f(%l):\ %trror:\ %m

    "doxygen warnings
  set errorformat+=%f:%l:\ %tarning:\ %m
  set errorformat+=%-GSearching\ %m,%-GParsing\ file\ %f,%-GPreprocessing\ %f
  set errorformat+=%-GBuilding\ %m,%-GParsing\ %m,%-GGenerating\ %m

    "remove microsoft banners
  set errorformat+=%-GMicrosoft%m,%-GCopyright%m
    "remove cmake percent lines
  set errorformat+=%-G[\ \ %l%%]\ %m,%-G[\ %l%%]\ %m,%-G[%l%%]\ %m
    "remove cmake scan lines.
  set errorformat+=%-GScanning\ %m
    "remove cmake config lines
  set errorformat+=%-G--\ %m

    "follow make recursion
  set errorformat+=%D%*\\a[%*\\d]:\ Entering\ directory\ `%f'
  set errorformat+=%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f'

    "omit empty lines
  set errorformat+=%-G%\\s%#

    "omit everything. This has to be the last entry!
  "set errorformat+=%-G%.%#
endif

  "adding ** to the path lets it search recursively through all subdirectories from the current one
  "for various commands (see path), for example :find
set path+=**

  "enables a menu above the status line when tabbing completions in the commandline
set wildmenu

  "MyDiff for Windows quoting
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

if has('win32') || has('win64')
  set diffexpr=MyDiff()
endif

" }}}

