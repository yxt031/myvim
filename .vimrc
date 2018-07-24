set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	  
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
   
" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'tmhedberg/SimpylFold'
	Plugin 'vim-scripts/indentpython.vim'
	Plugin 'vim-syntastic/syntastic'
	Plugin 'scrooloose/nerdtree'
	Plugin 'kien/ctrlp.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
	" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let python_highlight_all=1
syntax on
set guifont=Courier_New:h10:cANSI   " 设置字体 
colorscheme murphy
set autowrite  "自动保存

"自动补全 
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>   
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i      
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
	   return "\<Right>"
	else
	   return a:char
	endif
	endfunction
filetype plugin indent on 
"打开文件类型检测,
""加了这句才可以用智能补全
set completeopt=longest,menu
