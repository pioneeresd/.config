" This is the vimrc file that will be copied. If you want to add plugins or
" anything put them in here. Once you are done hit <Shift-ZZ> or :wq to
" continue.
" BASIC -PUT THIS FIRST!- {{{
syntax enable 				" enable syntax processing
nnoremap <space> <nop>

let mapleader=" "           " leader is space
let maplocalleader=","      " local leader is ,

" Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" disable fish shell
if &shell =~# 'fish$'
  set shell=sh
endif

" set mouse scrolling
set mouse=a

" {{{ UltiSnip pre-settings
let g:UltiSnipsEnableSnipMate = 0 " Disable SnipMate snippets
" }}}

" }}}

" plug plugins go here {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'dockyard/vim-easydir'           " Automatically create directories
Plug 'tmhedberg/matchit'              " extend % matching for HTML, LaTeX, and many other languages
Plug 'OmniSharp/omnisharp-vim'        " c# Programming support
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-syntastic/syntastic'        " Syntax checking plugin
Plug 'flazz/vim-colorschemes'                 " Color scheme manager
" Plug 'altercation/vim-colors-solarized' " Solarized color scheme
Plug 'tpope/vim-dispatch'             " async builder and tester
Plug 'tpope/vim-ragtag'                " tag matching
Plug 'tpope/vim-rails'
Plug 'radenling/vim-dispatch-neovim'  " neovim support
Plug 'skwp/vim-easymotion'            " Highlight and move anywhere
" Plug 'terryma/vim-multiple-cursors'
Plug 'gisphm/vim-gitignore' " Syntax highlighting and snippets
Plug 'thinca/vim-template' " A template plugin
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'
Plug 'rust-lang/rust.vim'       " a standard rust plugin
Plug 'leafgarland/typescript-vim'      " Typescript syntax, etc.
Plug 'dag/vim-fish'                    " fish syntax highlighting
Plug 'vim-airline/vim-airline' " airline - powerline but lighter than air
Plug 'vim-airline/vim-airline-themes'
Plug 'timonv/vim-cargo'         " run cargo commands inside vim
Plug 'majutsushi/tagbar'        " Overview tags requires ctags
Plug 'szw/vim-tags'
Plug 'jiangmiao/auto-pairs'     " Automatically insert bracket pairs
Plug 'scrooloose/nerdcommenter' " automatic commenting
Plug 'tpope/vim-surround'       " modify tags, quotes, and anything that surrounds text
Plug 'MattesGroeger/vim-bookmarks'  " Allow the use of bookmarks
Plug 'w0rp/ale'                 " Async Lint Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome it should be illegal
Plug 'int3/vim-extradite' " use :Extradite for managing working tree
Plug 'dickeyxxx/status.vim' " A better status line
Plug 'ervandew/supertab'    " Use tab for completion
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }  " Preview markdown files.
call plug#end()
" }}}

" Plugin settings {{{

" colorscheme settings {{{
set background=dark
" colorscheme darkblue
colorscheme 1989
" }}}

" ultisnips settings {{{
if has('python') || has('python3')
  " Trigger configuration. Do not use <tab> if you use
  " https://github.com/Valloric/YouCompleteMe
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

  " packadd ultisnips

  " Completor SHOULD BE opened automatically
  " Completor and ultisnips to reuse TAB key
  " tab to trigger snip -> jump to next placeholder -> next completion or
  " insert a plain tab char
  fun! Tab_Or_Complete() " {{{
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        if pumvisible()
          return "\<C-n>"
        else
          return "\<TAB>"
        endif
      endif
    endif
    return ""
  endf "}}}

  au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=Tab_Or_Complete()<cr>"

  " packadd ale.vim
endif

" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" vim-tex-fold settings {{{
let g:tex_fold_additional_envs = [
      \ 'itemize',
      \ 'longtable',
      \ 'enumerate',
      \]
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'
let g:vimtex_compiler_latexmk={
      \ 'backend' : 'nvim',
      \ 'build_dir' : '',
      \ 'callback' : 0,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ]
      \}
" }}}

" {{{ rust.vim documentation and settings
" Provides Error checking through the syntastic plugin below
" Also provides tags for the Tagbar plugin below
" Provides rust format support and will automatically
" run on save with the following
let g:rustfmt_autosave = 1
" Also integrates with Playpen (not sure what that is?)
" Can use the command :RustTest to run a test under the cursor
" For more info run :help rust
" }}}

" vim-cargo documentation {{{
" Provides the following cargo commands:
" :CargoBench
" :CargoBuild
" :CargoClean
" :CargoDoc
" :CargoNew
" :CargoRun
" :CargoTest
" :CargoUpdate
" }}}

" {{{ vim-tags settings
" All tagbar commands begin with :Tagbar - this maps F8 to toggle the
" bar.
nmap <F8> :TagbarToggle<CR>
" }}}

" {{{ nerdcommenter settings

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" disable Default mappings
let g:NERDCreateDefaultMappings = 0

"The following key mappings are provided by default (there is also a menu provided that contains menu items corresponding to all the below mappings):

"Most of the following mappings are for normal/visual mode only. The |NERDCommenterInsert| mapping is for insert mode only.

"[count]<leader>cc |NERDCommenterComment|
nnoremap <leader>cl :call NERDComment(0, "comment")<CR>
vnoremap <leader>cl :call NERDComment(1, "comment")<CR>

"Comment out the current line or text selected in visual mode.

"[count]<leader>cn |NERDCommenterNested|
nnoremap <leader>cn :call NERDComment(0, "nested")<CR>
vnoremap <leader>cn :call NERDComment(1, "nested")<CR>

"Same as cc but forces nesting.

"[count]<leader>c<space> |NERDCommenterToggle|
nnoremap <leader>cc :call NERDComment(0, "toggle")<CR>
vnoremap <leader>cc :call NERDComment(1, "toggle")<CR>

"Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

" [count]<leader>cm |NERDCommenterMinimal|
nnoremap <leader>cm :call NERDComment(0, "minimal")<CR>
vnoremap <leader>cm :call NERDComment(1, "minimal")<CR>

"Comments the given lines using only one set of multipart delimiters.

"[count]<leader>ci |NERDCommenterInvert|
nnoremap <leader>ci :call NERDComment(0, "invert")<CR>
vnoremap <leader>ci :call NERDComment(1, "invert")<CR>

" Toggles the comment state of the selected line(s) individually.

"[count]<leader>cs |NERDCommenterSexy|
nnoremap <leader>cs :call NERDComment(0, "sexy")<CR>
vnoremap <leader>cs :call NERDComment(1, "sexy")<CR>

"Comments out the selected lines with a pretty block formatted layout.

"[count]<leader>cy |NERDCommenterYank|
nnoremap <leader>cy :call NERDComment(0, "yank")<CR>
vnoremap <leader>cy :call NERDComment(1, "yank")<CR>

"Same as cc except that the commented line(s) are yanked first.

"<leader>c$ |NERDCommenterToEOL|
nnoremap <leader>c$ :call NERDComment(0, "toEOL")<CR>
vnoremap <leader>c$ :call NERDComment(1, "toEOL")<CR>

"Comments the current line from the cursor to the end of line.

"<leader>cA |NERDCommenterAppend|
nnoremap <leader>cA :call NERDComment(0, "append")<CR>
vnoremap <leader>cA :call NERDComment(1, "append")<CR>

"Adds comment delimiters to the end of line and goes into insert mode between them.

"|NERDCommenterInsert|
nnoremap <leader>cI :call NERDComment(0, "insert")<CR>
vnoremap <leader>cI :call NERDComment(1, "insert")<CR>

"Adds comment delimiters at the current cursor position and inserts between. Disabled by default.

"<leader>ca |NERDCommenterAltDelims|
" nnoremap <leader>ca :call NERDComment(0, "")<CR>

"Switches to the alternative set of delimiters.

"[count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
nnoremap <leader>cl :call NERDComment(0, "alignLeft")<CR>
vnoremap <leader>cl :call NERDComment(1, "alignLeft")<CR>

"Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).

"[count]<leader>cu |NERDCommenterUncomment|
nnoremap <leader>cu :call NERDComment(0, "uncomment")<CR>
vnoremap <leader>cu :call NERDComment(1, "uncomment")<CR>

"    Uncomments the selected line(s).

" }}}

" {{{ Surround.vim documentation
"Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

"It's easiest to explain with examples. Press cs"' inside

""Hello world!"

"to change it to

"'Hello world!'

"Now press cs'<q> to change it to

"<q>Hello world!</q>

"To go full circle, press cst" to get

""Hello world!"

"To remove the delimiters entirely, press ds".

"Hello world!

"Now with the cursor on "Hello", press ysiw] (iw is a text object).

"[Hello] world!

"Let's make that braces and add some space (use } instead of { for no space): cs]{

"{ Hello } world!

"Now wrap the entire line in parentheses with yssb or yss).

"({ Hello } world!)

"Revert to the original text: ds{ds)

"Hello world!

"Emphasize hello: ysiw<em>

"<em>Hello</em> world!

"Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.

"<p class="important">
"<em>Hello</em> world!
"</p>

"This plugin is very powerful for HTML and XML editing, a niche which currently seems underfilled in Vim land. (As opposed to HTML/XML inserting, for which many plugins are available). Adding, changing, and removing pairs of tags simultaneously is a breeze.

"The . command will work with ds, cs, and yss if you install repeat.vim.
"}}}

" {{{ vim-bookmarks
" This is pretty self explanatory
nnoremap <TAB> :BookmarkNext<CR>
nnoremap mn :BookmarkNext<CR>
nnoremap <S-TAB> :BookmarkPrev<CR>
nnoremap mp :BookmarkPrev<CR>
nnoremap <leader>b :BookmarkToggle<CR>
nnoremap mm :BookmarkToggle<CR>
nnoremap <leader>a :BookmarkAnnotate<CR>
nnoremap <leader><TAB> :BookmarkShowAll<CR>
nnoremap <leader>x :BookmarkClear<CR>
" }}}

" {{{ ale settings

let g:ale_set_highlights = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_cursor_detail = 0
let g:ale_close_preview_on_insert = 1
let g:ale_set_balloons = 0
" let g:ale_set_loclist = 0
" let g:ale_open_list = 0
let g:ale_fix_on_save = 1
let g:ale_rust_rls_options = '--cli'
let g:ale_linters = {
      \ 'rust': ['rls'],
      \ 'tex': [ 'lacheck' ],
      \}
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_fixers = {
      \ 'rust': ['cargo-fmt'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'ruby': ['rubocop'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ }

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1
let g:ale_sign_error = "✗"
let g:airline#extensions#ale#error_symbol = "✗"
let g:ale_sign_warning = "⚠"
let g:airline#extensions#ale#warning_symbol = "⚠"
set omnifunc=ale#completion#OmniFunc
" }}}

" coc keybinds {{{
nmap <F2> <Plug>(coc-rename)
" remap for format selected line(s)
nmap <localleader>f <Plug>(coc-format-selected)
xmap <localleader>f <Plug>(coc-format-selected)
" remap for do codeAction of selected region
xmap <localleader>a <Plug>(coc-codeaction-selected)
nmap <localleader>a <Plug>(coc-codeaction-selected)
" remap for codeaction current line
nmap <localleader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <localleader>qf <Plug>(coc-fix-current)

" Mappings for function text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use :Format to format current buffer
command! -nargs=0 Format :call CocAction('format')
" }}}

" {{{ vim-fugitive documentation
" I'm not going to lie to you; fugitive.vim may very well be the best Git wrapper of all time. Check out these features:
"
" View any blob, tree, commit, or tag in the repository with :Gedit (and :Gsplit, :Gvsplit, :Gtabedit, ...). Edit a file in the index and write to it to stage the changes. Use :Gdiff to bring up the staged version of the file side by side with the working tree version and use Vim's diff handling capabilities to stage a subset of the file's changes.
"
" Bring up an enhanced version of git status with :Gstatus. Press - to add/reset a file's changes, or = to expand an inline diff and operate on individual hunks. Use :Gcommit % to commit the current file, editing the commit message inside the currently running Vim.
"
" :Gblame brings up an interactive vertical split with git blame output. Press enter on a line to edit the commit where the line changed, or o to open it in a split. When you're done, use :Gedit in the historic buffer to go back to the work tree version.
"
" :Gmove does a git mv on a file and simultaneously renames the buffer. :Gdelete does a git rm on a file and simultaneously deletes the buffer.
"
" Use :Ggrep to search the work tree (or any arbitrary commit) with git grep, skipping over that which is not tracked in the repository. :Glog loads all previous revisions of a file into the quickfix list so you can iterate over them and watch the file evolve!
"
" :Gread is a variant of git checkout -- filename that operates on the buffer rather than the filename. This means you can use u to undo it and you never get any warnings about the file changing outside Vim. :Gwrite writes to both the work tree and index versions of a file, making it like git add when called from a work tree file and like git checkout when called from the index or a blob in history.
"
" Use :Gbrowse to open the current file on the web front-end of your favorite hosting provider, with optional line range (try it in visual mode!). Plugins are available for popular providers such as GitHub, GitLab, Bitbucket, and Gitee.
"
" Add %{FugitiveStatusline()} to 'statusline' to get an indicator with the current branch in (surprise!) your statusline.
"
" Last but not least, there's :Git for running any arbitrary command, and Git! to open the output of a command in a temp file.
" }}}

" {{{ status.vim settings
"Load Fugitive
let g:statusline_fugitive = 1
"Do Not Load RVM
let g:statusline_rvm = 0
"Load Syntastic
let g:statusline_syntastic = 1
"Turn statusline on
let g:statusline_enabled = 1
"Turn on full paths
let g:statusline_fullpath = 1
" }}}

" {{{ vim-instant-markdown settings
filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
" }}}

" OmniSharp settings {{{
let g:OmniSharp_server_stdio = 1
" }}}
" }}}

" Put your non-Plugin stuff after this line

" Tell vim to remember certain things when we exit {{{
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.config/nvim/viminfo
" }}}

" Resume cursor position {{{
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

au!
au BufWinEnter * call ResCur()
" }}}

" Other key remaps {{{

" These let me move lines very easily with m and a direction.
nnoremap mj ddp
nnoremap mk ddkP
vnoremap mj :m '>+1<CR>gv=gv
vnoremap mk :m '<-2<CR>gv=gv

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" allow tab to jump between panes
nnoremap <tab> <c-w><c-w>
inoremap <c-s> <esc>:update<CR>a

" Quickly edit this file
nnoremap <leader>ev :split $MYVIMRC<cr>
" Quickly reload this file
nnoremap <leader>sv :source $MYVIMRC<cr>

" H and L go to the beginning and the end of a line respectively
nnoremap H 0
onoremap H 0
nnoremap L g_
onoremap L g_
" Remove unused keys
nnoremap <UP> <nop>
nnoremap <DOWN> <nop>
nnoremap <LEFT> <nop>
nnoremap <RIGHT> <nop>

inoremap <UP> <nop>
inoremap <DOWN> <nop>
inoremap <LEFT> <nop>
inoremap <RIGHT> <nop>

" ???
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F[vi[<cr>

" Terminal commands
tnoremap <ESC> <C-\><C-n>
nnoremap <C-t> :sp term://bash<cr>
" }}}

" abbreviations {{{
iabbrev @@ jhessin@gmail.com
iabbrev ccopy Copyright 2019 Jim Hessin, all rights reserved.
iabbrev ssig -- <cr>Jim Hessin<cr>jhessin@gmail.com
" }}}

" TAB spacing {{{
set tabstop=2				" number of visual spaces per TAB
set softtabstop=2			" number of spaces INSERTED or DELETED with TAB
set expandtab				" tabs are expanded to spaces
" }}}

" UI Config {{{
" set guicursor=    " disable gui cursor for my backward system.
set nocompatible  " Modernize vim
set tw=79         " Set word wrap at 79 characters
set number				" show line numbers
set showcmd				" show command in bottom bar
set cursorline				" highlight the current line
filetype indent on    " load filetype-specific indent file
set wildmenu          " visual autocomplet for command menu
set shiftround        " round to the nearest shiftstop
set shiftwidth=2      " set the tab stops to 2
set showmatch         " highlight matching [{()}]
set incsearch         " search as characters are entered
set hlsearch          " highlight matches
set clipboard+=unnamedplus " Use standard clipboard for yank and paste
set exrc
" auto indent files on save/load
  " spell check all md and txt files
au FileType text,markdown :setlocal spell
au BufNewFile,BufRead * setlocal formatoptions-=ro
" au BufWritePost init.vim so $MYVIMRC    " Automatically load changes
" }}}

" Folding! {{{
set foldenable        " enable folding
set foldlevelstart=2  " opening folds when opening a file
set foldnestmax=10    " maximum number of nested folds

set foldmethod=syntax         " use syntax folding
" }}}

" Backups {{{
" This puts backups in a temporary directory instead of with the files.
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" This is to load package help from the different plugins
" Not sure how it works yet.
" packloadall
" silent! helptags ALL
set modelines=1
set modelineexpr
" vim:foldmethod=marker:foldlevel=0
