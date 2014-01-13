" image_paste.vim - Image pasting for vim
" Maintainer:   Blake Taylor <http://blakefrost.com/>
" Version:      0.1


if exists("g:loaded_images_paste)") || &cp
  finish
endif
let g:loaded_vimages = 1

if !exists("g:loaded_images_paste")
  let g:images_root = expand('~/images/')
endif

function! s:warn(msg)
  echohl WarningMsg
  echomsg a:msg
  echohl NONE
endfunction

function! image_paste#PasteImage()
  " Paste image from clipboard accroding to date/time
  let date_path = strftime("%Y/%m/%d/")

  let images_path = 'captures/' . date_path
  let images_dir  = g:images_root . images_path
  let file = strftime("%T") . '.png'

  " Make sure the directory exists
  execute 'silent !mkdir -p ' . images_dir
  execute "silent !pngpaste " . images_dir . file

  " Test that the file exists
  if filereadable(images_dir . file)
    execute "normal a \<BS>".'![](/images/'.images_path.file.')'
    normal! 02l
    startinsert!
  else
    echo "Couldn't paste image. perhaps no image data in clipboard?:"
  endif
  redraw!
endfunction
