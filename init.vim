"-----------------------vim-plug----------------------------
call plug#begin('~/.config/nvim/plugged') "call plugin manager.
" IDE UI
Plug 'mhinz/vim-startify'
" coc plugins
Plug 'neoclide/coc.nvim', {'branch':'release'}
let g:coc_global_extensions=[
            \'coc-blade',
            \'coc-html',
            \'coc-solidity',
            \'coc-sh',
            \'coc-eslint',
            \'coc-tsserver',
            \'coc-snippets',
            \'coc-rust-analyzer',
            \'coc-git',
            \'coc-emmet',
            \'coc-kotlin',
            \'coc-clangd',
            \'coc-java',
            \'coc-yaml',
            \'coc-wxml',
            \'coc-vetur',
            \'coc-python',
            \'coc-pyright',
            \'coc-stylelint',
            \'coc-pairs',
            \'coc-json',
            \'coc-lists',
            \'coc-highlight',
            \'coc-css',
            \'coc-phpls',
            \'coc-prettier',
            \'coc-webpack',
            \'coc-diagnostic',
            \'coc-lightbulb',
            \'coc-marketplace',
            \'coc-emoji',
            \'coc-floaterm',
            \'coc-markdownlint',
            \'coc-webview',
            \'coc-markdown-preview-enhanced'
            \]

" code syntax
" astro
Plug 'wuelnerdotexe/vim-astro'
Plug 'thesis/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue',{'for':'vue'}
Plug 'uiiaoo/java-syntax.vim', {'for':'java'}
"Plug 'othree/html5.vim', {'for':['html','vue','php']}
Plug 'ap/vim-css-color'
"Plug 'hail2u/vim-css3-syntax',{'for':['html','vue','php','css']}
Plug 'stephpy/vim-yaml',{'for':'yaml'}
Plug 'tpope/vim-haml',{'for':['haml','sass','scss']}
" themes
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'
Plug 'majutsushi/tagbar', {'on':'TagbarToggle'}
"let g:tagbar_ctags_bin='/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='qwq'
" others
Plug 'honza/vim-snippets'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'voldikss/vim-floaterm'
let g:floaterm_position = 'center'
Plug 'Chiel92/vim-autoformat'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim', {'for':['html','xml','vue','php','typescriptreact','javascriptreact']}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'maxmellon/vim-jsx-pretty', {'for':['typescriptreact','javascript','typescript','javascriptreact']}
Plug 'HerringtonDarkholme/yats.vim', {'for':['typescriptreact','javascript','typescript','javascriptreact']}
let g:vim_jsx_pretty_colorful_config = 1 " default 0
Plug 'vim-scripts/matchit.zip', {'for':['html','xml','vue','php','typescriptreact','javascript','typescript','javascriptreact']}
" CLang
Plug 'jackguo380/vim-lsp-cxx-highlight'
" json
Plug 'leshill/vim-json', {'for':'json'}
"kotlin
Plug 'udalov/kotlin-vim',{'for':'kotlin'}
" markdown
Plug 'godlygeek/tabular'

"Plug 'plasticboy/vim-markdown'
" nerdtree plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeShowHidden=1
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" px to rem
Plug 'Oldenborg/vim-px-to-rem'
let g:px_to_rem_base = 50 "use flexble.js default 1rem = 50px
call plug#end() "end of plugin manager

"------------------------------coc.nvim---------------------------------------
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"------------------------------coc.nvim---------------------------------------------

"vim settings-----------------------------------------------------------------------------
syntax on
set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
color molokai
"-----------------------------------------------------------------------------------
set cul "can be commented to remove column lines
set cuc
set ruler
set showcmd
set scrolloff=2
set laststatus=2
set foldenable
set foldmethod=manual
" set cursorline
set magic

set autoindent
set cindent
" Tab
set tabstop=4
"
set softtabstop=4
set shiftwidth=4
"
set expandtab
"
set smarttab
"
set number
set relativenumber
set showmode
"
set history=1000
"
set hlsearch
set incsearch
"
set cmdheight=1
"
set viminfo+=!
"
set iskeyword+=$,@,%,#,-,_
filetype plugin on
"tab, buffer----------------------------------------------------------------------------
map <S-H> :tabp<CR>
map <S-L> :tabn<CR>
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map <C-H> :bn<CR>
map <C-L> :bp<CR>
map <C-Left> :bn<CR>
map <C-Right> :bp<CR>
"Format Code---------------------------------------------------------------------------------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
map <F12> :Format<CR>
autocmd filetype vim noremap <buffer> <F12> :Autoformat<CR>
autocmd filetype markdown noremap <buffer> <F12> :CocCommand markdownlint.fixAll<CR>
"autocmd filetype vue,typescriptreact,javascriptreact noremap <buffer> <F12> :Prettier<CR>
let g:shfmt_opt="-ci"
autocmd filetype cs,c,cpp,kotlin,sh,zsh noremap <buffer> <F12> :Neoformat<CR>
"---------------------------------------------------------------------------------------
nnoremap <F2> :g/^\s*$/d<CR>:g/\s\+$/s<CR>
"html
"map! <C-O> <C-Y>,

"Change function keys to your relevent use.
noremap <F3> :NERDTreeToggle<CR>
nmap <F4> :CocCommand floaterm.toggle<CR>
let g:floaterm_keymap_toggle = '<F4>'
"tagbar
noremap <F9> :TagbarToggle<CR>
"F5 for saving the file
noremap <F5> :w<CR>
"markdown preview
"autocmd filetype markdown nmap <F6> :CocCommand markdown-preview-enhanced.openPreview<CR>
map <F6>  <CR> :!gcc % -o %< && ./%< <CR>

"------------------------------------------------------------------------------
" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set autoread
au FocusGained * :checktime
" quickfix
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

set completeopt=longest,menu

set autowrite

"set noeb

set confirm

set wrap
set linebreak

set noundofile
set nobackup
set nowritebackup
set noswapfile

set ignorecase
set smartcase
set linespace=0
"set spell spelllang=en_us
" （backspace）indent, eol, start
set listchars=tab:»■,trail:■
set list
set backspace=2
"
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"
set report=0
"
set fillchars=vert:\ ,stl:\ ,stlnc:\
"
set showmatch
"
set matchtime=5
" buffer
set scrolloff=5
set autochdir
set termencoding=UTF-8
set encoding=UTF-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030

"fzf-----------------------------------------------------------------------
function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
let g:fzf_action = { 'ctrl-b': 'edit' }
" Advanced customization using Vim function
inoremap <expr> <c-x><c-w> fzf#vim#complete#word({'right': '20%'})
"fzf-----------------------------------------------------------------------
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rust-analyzer'],
            \ }

" map usual keys, command control------------------------------------------
imap <C-x><C-w> <plug>(fzf-complete-word)
imap <C-x><C-p> <plug>(fzf-complete-path)
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
nmap <C-f> :Files<CR>
nmap ff :Files<CR>
" copy
vnoremap <C-c> "+y
vmap <D-c> "+y
" parse
inoremap <C-v> <Esc>"+gpa
nnoremap <C-v> "+gp
"save
nnoremap <D-s> :w

nmap <C-B> :Buffers<CR>
nmap fb :Buffers<CR>
imap <C-B> <Esc>:Buffers<CR>
nmap <C-T> :Tags<CR>
nmap ft :Tags<CR>
" map usual keys, command control------------------------------------------

"------------------------------------------------------------------
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
