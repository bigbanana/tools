set nocompatible              " be iMproved, required
filetype off                  " required

set runtimepath+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.vim/bundle/YouCompleteMe
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'dracula/vim'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlp.vim'
Plugin 'delimitMate.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'javascript.vim'
Plugin 'bling/vim-airline'
Plugin 'posva/vim-vue'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mbbill/undotree'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'bufexplorer.zip'
Plugin 'winmanager'
Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()            " required
filetype plugin indent on    " required

if has("gui_running")
  au GUIEnter * simalt ~x "全屏
  set guioptions-=m " 隐藏菜单栏
  set guioptions-=T " 隐藏工具栏
  set guioptions-=L " 隐藏左侧滚动条
  set guioptions-=r " 隐藏右侧滚动条
  set guioptions-=b " 隐藏底部滚动条
  "set showtabline=0 " 隐藏Tab栏
endif

set encoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
source $VIMRUNTIME/delmenu.vim "菜单乱码
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8 "console乱码

let mapleader = ' '
set tabstop=2 "2空格宽度tab
set shiftwidth=2
set expandtab "转换tab为空格
%retab!
set autoindent "自动缩进
set smartindent "智能缩进
"set list "显示隐藏字符
set listchars=tab:->,eol:$,nbsp:·,extends:…,space:·,precedes:<,extends:>,trail:·
set number "显示行号
set relativenumber "相对行号
set foldmethod=indent "设置折叠
set cursorline "高亮当前行
set incsearch "高亮搜索
set hlsearch "高亮结果
set nobackup "禁止备份
set noswapfile
set autoread "自动加载
set guifont=Consolas:h10
syntax enable
syntax on
colorscheme dracula "默认主题

nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['node_modules$[[dir]]', '.o$[[file]]']

"minibufexpl
let g:miniBufExplMapCTabSwitchBufs = 1
map <C-l> :MBEbn<cr>
map <C-h> :MBEbp<cr>

" delimitmate
let delimitMate_expand_cr = 2 "自动换行

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_sign_column_always = 1

"YouCompleteMe
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

"undotree
nmap <Leader>ud :UndotreeToggle<CR>

"vim-session
let g:session_autoload='yes'
let g:session_autosave='yes'

" winmanager配置
" let g:NERDTree_title='NERD Tree'
" let g:winManagerWindowLayout='NERDTree|BufExplorer'
" function! NERDTree_Start()
"     exec 'NERDTree'
" endfunction

" function! NERDTree_IsValid()
"     return 1
" endfunction

" 绑定F2到winmanager
nmap <silent> <F2> :WMToggle<CR>
nmap <Leader>n :tabn<CR>
nmap <Leader>p :tabp<CR>
nmap <Leader>b :BufExplorer<CR>

"workspace
if filereadable("workspace.vim")
  source workspace.vim
endif
