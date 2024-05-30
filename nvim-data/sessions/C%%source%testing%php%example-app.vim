let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd C:/source/testing/php/example-app
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 C:/source/testing/php/example-app/app/Http/Controllers/Controller.php
badd +47 C:/source/testing/php/example-app/app/Models/User.php
badd +1 C:/source/testing/php/example-app/app/Providers/AppServiceProvider.php
badd +1 C:/source/testing/php/example-app/bootstrap/app.php
badd +1 C:/source/testing/php/example-app/bootstrap/providers.php
badd +1 C:/source/testing/php/example-app/artisan
badd +1 C:/source/testing/php/example-app/routes/console.php
badd +1 C:/source/testing/php/example-app/routes/web.php
badd +1 C:/source/testing/php/example-app/package.json
argglobal
%argdel
$argadd oil:///C/source/testing/php/example-app/
tabnext 1
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
