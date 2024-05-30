let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/subtitles/1,778\ Stories\ of\ Me\ and\ My\ Wife.srt
badd +0 C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/subtitles/12\ FL\ OZ.srt
badd +1 C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/subtitles/12\ Strong.srt
badd +1 C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/subtitles/80\ Mile\ Speed.srt
badd +4627 C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/subtitles/A\ Bridge\ Too\ Long.srt
argglobal
%argdel
$argadd oil:///C/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/
tabnew +setlocal\ bufhidden=wipe
tabrewind
tabnext
edit C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/subtitles/A\ Bridge\ Too\ Long.srt
argglobal
balt C:/source/repos/Subloader/SubloaderBulkDownloader/bin/Debug/net6.0/subtitles/80\ Mile\ Speed.srt
let s:l = 4627 - ((15 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4627
normal! 028|
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
