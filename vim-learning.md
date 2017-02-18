# 1. Basics

- movement: hjkl -> left, down, up, right
- Quit: :q add a ! to force quit
- Write file: :w (optional file name)
  - when given a range/selection it writes only that part to a file
- Open/Edit file: :e filename
- Enter **Insert** mode: `i`; Exit insert mode: `Esc`

## 1.1 Advanced inserts

- i: insert mode at current position. I: insert mode at first non-blank character of line
- a: insert mode after current position. A: insert mode at the end of the line
- o: insert mode on new line after current one. O: insert mode on new line before current one
- R: replace mode

# 2. Simple actions in Normal Mode

- Delete line: dd; also copies it
- Yank Line: yy
- Paste: p
- Undo: u
- Redo: CTRL-R
- Search for something: /pattern; Search same again: n; search upwards: N
- x: remove character
- r: replace character

# 3. Actions that take motions

- The following actions require motions after the operator:^
  - Change: c
  - Delete: d
  - Yank: y
  - Filter through external program: !
  - Text formatting: gq
  - Text to lowercase/uppercase: gu/gU
  - Shift text left or right: <, >
  - Define a fold: zf

## 3.1 Motions
- simple motions:
  - h or l: left or right
  - k or j: up or down
  - 0: to the first char of the line
  - ^: to the first non-blank char of the line
  - $: go to end of the line. if more than once, also move downward
  - %: move to matching parenthesis
  - f(char): to the n'th occurence of char to the right
  - F(char): like f, but to the left
  - t and T: like f/F but move only until the letter
  - ;/,: repeat latest f/F/t/T in normal/opposite direction
  - -: move upward, on the first non-blank character
  - +: move downward, on the first non-blank character
  - (count)G: go to line count, default last line
  - (count)gg: go to line count, default first line
  - (count)%: go to count percent in file
  - :[range]: go to last line in range
- word motions:
  - w/W: 1 word/WORD forward
  - e/E: move to end of word/WORD
  - b/B: move word/WORD backward
  - ge/gE: move to the end of word/WORD backward
  - word: sequence of letters, digits and underscores or other non-blank characters
    separated with white space
  - WORD: sequence of non-blank characters, separated by white space
- text object motions:
  - (/): count sentences backward/forward
  - {/}: count paragraphs backward/forward
  - ]]/][: count sections forward to the next {/} in the first column
  - []/[[: count sections backward to the previous {/} in the first column
  - sentence: ending at . ! or ? followed by end of line or space
  - paragraph: paragraph begins after each empty line
  - section: section begins after a form-feed or { in the first column (for c code)
- text object selection
  - only in visual mode or after an operator
  - aw/aW: "a word/WORD", leading or trailing whitespace is included, but not counted
  - iw/iW: "inner word/WORD", leading or trailing whitespace is counted
  - as/is: "a/inner sentence"
  - ap/ip: "a/inner paragraph"
  - a[/i[ or a]/i]: "a/inner [] block", selects text in [], i excludes the brackets
  - a(/i( or a)/i) or ab/ib: "a/inner block", selects text in a () block, i excludes the brackets
  - a</i< or a>/i>: "a/inner <> block", i excludes the brackets
  - a{/i{ or a}/i} or aB/iB: "a/inner {} block", selects text in a {} block, i excludes the brackets
  - at/it: "a/inner tag block", XML/HTML tag blocks
  - a"/i" or a'/i' or a`/i`: "a/inner quoted string", selects text in quote, can recognize
    escaped quotes, see quoteescape option
- TODO: see :omap
- Motions can be replaced by highlighted text in visual mode (first highlight it, then use 
  operator)
- using a v, V or CTRL-V changes operation mode to character, line or block wise operation
  - e.g.: d CTRL-V 2j will delete 2 chars down and not two lines

# 4. Other commands

- / and ?: Search forward or backward.
- n and N: repeat last search forward or in reverse direction
- CTRL-O and CTRL-I: jump to last positions, jump to next positions (e.g. when searching)
- :{Range}s/find/replace/flags : replace text. normally replaces the first occurence on the current line
  - see :s for more information
  - flag g: replaces all occurences on the line
  - Range: % for whole file
- :r : read in a file. Can be used with a shell command (:r !dir) to read in the output of the command

# 5. Options

- Search can be influenced by some options:
  - hlsearch, hls: highligh all search results
  - incsearch, is: incremental search, start search while typing

# 6. Browsing Code

## 6.1 Tags
- Based on tags an the such: requires at least ctags
  - call ctags with "--fields=+iaS --c++-kinds=+p" to include declarations, not only definitions
- <C-]> (ü): jump to tag, same as :tag (ID)
- <C-T> Jump back (in the tag stack: usually to the last location)
- :tag: jump one entry in the tag stack forward
- :tags: show the tag stack
- :ts (ID): tselect: searches for ID and shows all matching results
- g]: like <C-]> but uses :ts
- g <C-]>: jump directly if only one matching tag, present list otherwise
- :tn: jump to next matching tag
- :tp: jump to previous matching tag
- Keyword search can also search in included files (see include-option)
  - [i display first line, that contains keyword under cursor, search from beginning of file
  - ]i display first line, that contains keyword under cursor, search from cursor position
  - [I like [i, but display all found lines
  - ]I like ]i, but display all found lines
  - CTRL-W i like [i but open search found in new window

## 6.2 Code folding
Folds are created automatically, when foldmethod is set to syntax or expr. Other options:
- foldnestmax: how many layers of folds will be created. 20 max
- foldstartlevel: how many folds are closed, when opening a file. -1: ignored, 0: all, 99: none

Commands to browse folds. All fold commands start with a z.
- zc: close one fold under cursor
- zC: close all folds under cursor
- za: toggle fold under cursor
- zv: open enough folds to make the cursor line not folded
- zm: fold more: close one level of folds, if all are closed, nothing happens
- zM: close all folds
- zr: reduce folding, open one level of folds
- zR: open all folds
- zi: toggle all folds closed/all fold open

# 7. Tabs
Just what one would expect from tabs, independent window layouts on different tabs.
- :tabnew: open new tab
- :tabedit <file>: open file in new tab
- :tabclose: close current tab
- :tabonly: close all tabs, except for the current one
- :tabnext/gt: go to next tabpage
- :tabprevious/gT: go to previous tabpage
- todo: moving tabs, tabline/guitable setting

# 8. Refactoring code with vim
There are articles on the web: http://artemave.github.io/2013/02/14/refactoring-in-cmd-line-and-vim/
also this answer on stackoverflow: http://stackoverflow.com/questions/8781975/refactoring-in-vim
vimcasts.org also has a ton of learning material

# 9. Completion
- in insert mode, CTRL-N, which uses completers based on the complete option,
  CTRL-X as base stroke to choose a completer
