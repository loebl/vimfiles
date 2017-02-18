" Vim filetype plugin file
" Language:     hg commit message file (coming from lawrencium plugin
" Maintainer:   Daniel Löber <post@dloeber.de>

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

  "hg on windows needs local encoding, can't cope with utf-8
if has('win32') || has('win64')
  setlocal fileencoding=cp1252
endif

let &cpo = s:cpo_save
unlet s:cpo_save
