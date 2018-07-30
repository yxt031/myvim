set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	  
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
   
" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
	Plugin 'davidhalter/jedi-vim'          "python自动补全
"	Plugin 'Valloric/YouCompleteMe'        "自动补全
	Plugin 'tmhedberg/SimpylFold'          "折叠插件
	Plugin 'vim-scripts/indentpython.vim'  "自动缩进
	Plugin 'vim-syntastic/syntastic'
	Plugin 'scrooloose/nerdtree'           "树目录插件
	Plugin 'jistr/vim-nerdtree-tabs'       "树插件tab
	Plugin 'kien/ctrlp.vim'                "全局搜索插件
	Plugin 'benmills/vimux'                "安装VIMUX
"	Plugin 'julienr/vimux-pyutils'       "安装VIMUX-PYTHON
	Plugin 'mbbill/undotree'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
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

" 设置NerdTree,按F3即可显示或隐藏NerdTree区域了
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree "设置自动运行NERDTree
map <F5> :call VimuxRunCommand("ls") <CR> "设置自动打开第二个TMUX面板 


let g:nerdtree_tabs_open_on_console_startup=1  "启用NERDTree-tabs


"airline配置
let g:airline_powerline_fonts = 1
set laststatus=2  "永远显示状态栏
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩

"Undotree
nnoremap <F6> :UndotreeToggle<cr>   "设置F6打开Undotree

"Tmux配置
if exists('$TMUX')   
	set term=screen-256color
endif
