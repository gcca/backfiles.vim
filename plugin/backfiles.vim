if exists('g:backfiles_prefix')
  let g:backfiles_prefix = g:backfiles_prefix . '/backfiles'
else
  if !exists('$VIMHOME')
    if has('nvim')
      let $VIMHOME=stdpath('data')
    elseif has('win32') || has ('win64')
      let $VIMHOME=$HOME.'/vimfiles'
    else
      let $VIMHOME=$HOME.'/.vim'
    endif
  endif
  let g:backfiles_prefix=$VIMHOME.'/backfiles'
endif

execute 'set backupdir='.g:backfiles_prefix.'/backup'
execute 'set directory='.g:backfiles_prefix.'/swap'
execute 'set undodir='.g:backfiles_prefix.'/undo'
set backup
set swapfile
set undofile

for s:dir in [ &backupdir, &directory, &undodir ]
  if !isdirectory(s:dir)
    call mkdir(s:dir, 'p')
  endif
endfor
