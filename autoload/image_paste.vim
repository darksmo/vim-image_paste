" image_paste.vim - Image pasting for vim
" Maintainer:   Blake Taylor <http://blakefrost.com/>
"               Jason Chung <https://www.zzxworld.com/>
" Version:      0.1


if exists("g:loaded_images_paste)") || &cp
  finish
endif
let g:loaded_vimages = 1

if !exists("g:loaded_images_paste")
  if filereadable("../_config.yml")
    let g:images_root = expand('../images/')
  else
    let g:images_root = expand('./images/')
  endif
endif

function! s:warn(msg)
  echohl WarningMsg
  echomsg a:msg
  echohl NONE
endfunction

function! image_paste#PasteImage()
  " Paste image from clipboard accroding to date/time
  let date_path = strftime("%Y-%m-%d/")

  let images_path = date_path
  let images_dir  = g:images_root . images_path
  let file = strftime("%H%M%S") . '.png'

  " Make sure the directory exists
  execute 'silent !mkdir -p ' . images_dir
  execute "silent !pngpaste " . images_dir . file

  " Test that the file exists
  if filereadable(images_dir . file)
    execute "normal a \<BS>".'![]('.g:images_root.images_path.file.')'
    normal! 02l
    startinsert!
  else
    echo "Couldn't paste image. perhaps no image data in clipboard?:"
  endif
  redraw!
endfunction
