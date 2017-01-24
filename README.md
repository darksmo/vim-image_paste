Vim 图片粘贴插件

使用 Vim 写 Markdown 时，插入图片是个不太方便的操作。这个 Vim 插件可以解决这个小麻烦。

安装插件后，复制图片到剪贴板，然后输入命令: `:call image_paste#PasteImage()`， 就可以自动保存剪贴板中的图片并在光标位置插入转换后的图片地址代码。

插件依赖:

1. OS X 系统
2. [pngpaste][1]

项目 fork 自 [unicornrainbow/vim-image_paste](https://github.com/unicornrainbow/vim-image_paste)。为了更好的与 Jekyll 协作，我对原项目做了一些修改。

以下为原英文项目介绍:

## Requirements

Currently supports OS X. Windows and linux support planned.

On OS C, you must have the [pngpaste][1] command in your path.

## Installation

Use [Pathogen][2] or [Vundle][3] to install and activate.

## Usage

The following will save any image in the clipboard to /images, and include a
markdown image link referencing it within the current document.

    :call image_paste#PasteImage

You can map to a command that is more easy to type within your .vimrc as follows.

    command! PasteImage :call image_paste#PasteImage()

## License

This code is free to use under the terms of the MIT license.

Copyright (c) 2014 Blake Taylor

See LICENSE file for further details.

[1]: https://github.com/jcsalterego/pngpaste
[2]: https://github.com/tpope/vim-pathogen
[3]: https://github.com/gmarik/vundle
