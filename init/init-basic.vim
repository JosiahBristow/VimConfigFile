"======================================================================
"
" init-basic.vim - 基础配置，该配置需要兼容 vim tiny 模式
"
" 所有人都能接受的配置，不掺渣任何 keymap, 和偏好设置
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 16:53:18
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspace 键模式
set bs=eol,start,indent

" 自动缩进
set autoindent

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" 关闭自动换行
set nowrap

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 显示光标位置
set ruler


"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch


"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<


" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif


"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


"----------------------------------------------------------------------
" 新建.c,.h,.sh,.py,.rs,.cpp文件，自动插入文件头 
"----------------------------------------------------------------------
autocmd BufNewFile *.py,*.rs,*.cpp,*.[ch],*.sh exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\#    > File Name: ".expand("%")) 
        call append(line(".")+1, "\#    > Author: Josiah Bristow") 
        call append(line(".")+2, "\#    > E-mail: w231726@163.com") 
		call append(line(".")+3, "\#    > Blog: https://josiahbristow.githuh.io") 
        call append(line(".")+4, "\#    > Created Time: ".strftime("%c")) 
		call append(line(".")+5, "\#    > Last Modified: ") 
        call append(line(".")+6, "\#########################################################################") 
        call append(line(".")+7, "\#!/bin/bash") 
        call append(line(".")+8, "") 
    elseif &filetype == 'c' 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Josiah Bristow") 
        call append(line(".")+2, "    > E-mail: w231726@163.com ") 
		call append(line(".")+3, "    > Blog: https://josiahbristow.githuh.io") 
        call append(line(".")+4, "    > Created Time: ".strftime("%c")) 
		call append(line(".")+5, "    > Last Modified: ") 
        call append(line(".")+6, " ************************************************************************/") 
        call append(line(".")+7, "")
    elseif &filetype == 'cpp' 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Josiah Bristow") 
        call append(line(".")+2, "    > E-mail: w231726@163.com ") 
		call append(line(".")+3, "    > Blog: https://josiahbristow.githuh.io") 
        call append(line(".")+4, "    > Created Time: ".strftime("%c")) 
		call append(line(".")+5, "    > Last Modified: ") 
        call append(line(".")+6, " ************************************************************************/") 
        call append(line(".")+7, "")
	elseif &filetype == 'python' 
        call setline(1, "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "	  > Author: Josiah Bristow") 
        call append(line(".")+2, " 	  > E-mail: w231726@163.com ") 
		call append(line(".")+3, "    > Blog: https://josiahbristow.githuh.io") 
        call append(line(".")+4, "    > Created Time: ".strftime("%c")) 
		call append(line(".")+5, "    > Last Modified: ") 
        call append(line(".")+6, "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''") 
        call append(line(".")+7, "")
	elseif &filetype == 'rust' 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Josiah Bristow") 
        call append(line(".")+2, "    > E-mail: w231726@163.com ") 
		call append(line(".")+3, "    > Blog: https://josiahbristow.githuh.io") 
        call append(line(".")+4, "    > Created Time: ".strftime("%c"))
		call append(line(".")+5, "    > Last Modified: ")  
        call append(line(".")+6, " ************************************************************************/") 
        call append(line(".")+7, "")
    endif
	"新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 


"----------------------------------------------------------------------
" 更新最后更改文件时间
"----------------------------------------------------------------------
func SetLastModifiedTime(lineno)
        let modif_time = strftime("%c")
        if a:lineno == "-1"
                let line = getline(4) "此处行号要和上面create time行号对应
        else
                let line = getline(a:lineno)
        endif    
        if line =~ '^\sLast Modified'
                let line = substitute( line,':\s\+.*\d\{4\}', ':'.modif_time, "" )
        else
			if &filetype == 'sh' 
                let line = '#    > Last Modified: '.modif_time
			else
				let line = '    > Last Modified: '.modif_time
			endif
        endif
		if a:lineno == "-1"
				call setline(7, line) "此处行号为要显示行号（绝对行号）
		else
				call append(a:lineno, line)
		endif

endfunc
" map the SetLastModifiedTime command automatically
au BufWrite *.py,*.rs,*.cpp,*.[ch],*.sh call SetLastModifiedTime(-1)


"----------------------------------------------------------------------
" 启用鼠标
"----------------------------------------------------------------------
set mouse=a
