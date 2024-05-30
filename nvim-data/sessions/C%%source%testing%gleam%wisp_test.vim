let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd C:/source/testing/gleam/wisp_test
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +9 C:/source/testing/gleam/wisp_test/src/wisp_test.gleam
badd +15 C:/source/testing/gleam/wisp_test/src/app.gleam
badd +1 C:/source/testing/gleam/wisp_test/gleam.toml
badd +1 C:/source/testing/gleam/wisp_test/manifest.toml
badd +8 C:/source/testing/gleam/wisp_test/src/app/router.gleam
badd +11 C:/source/testing/gleam/wisp_test/src/app/web.gleam
argglobal
%argdel
$argadd oil:///C/source/testing/gleam/wisp_test/
tabnew +setlocal\ bufhidden=wipe
tabrewind
tabnext
edit C:/source/testing/gleam/wisp_test/gleam.toml
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext 2
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
