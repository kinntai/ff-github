" vim内部の文字コード、バッファの内容はこの文字コードで扱われる
set encoding=utf-8
" vim scriptファイルの文字コードを指定
scriptencoding utf-8
" set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932
set fileencodings=utf-8,ucs-bom,euc-jp,eucjp-ms,cp932

" dein {{{
let s:base_dir = '~/.cache/dein'
let s:dein_repos_dir = expand(s:base_dir) . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repos_dir)
  if executable('git')
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repos_dir))
  else
    echomsg 'Not git'
  endif
endif

let g:vimproc#download_windows_dll = 1

" deinの設定 
let &runtimepath .= ',' . s:dein_repos_dir
"let &runtimepath = s:dein_repos_dir . ',' . &runtimepath
unlet! s:dein_repos_dir

let s:token_file = expand('<sfile>:h') . '/github_api_token.vim' 
if filereadable(s:token_file)
  execute 'source' s:token_file
  unlet! s:token_file
endif
let g:dein#install_progress_type = "echo"
let g:dein#lazy_rplugins = 0
let g:dein#enable_notification = 0
if dein#load_state(s:base_dir)
  call dein#begin(s:base_dir)
  unlet! s:base_dir
  " Shougo
  call dein#add('Shougo/dein.vim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/neoinclude.vim')      " 重いから有効にしてない
	call dein#add('Shougo/vimproc.vim')
  call dein#add('Shougo/vinarise.vim')
  call dein#add('Shougo/neco-vim')
  " other
  call dein#add('hachy/eva01.vim')            " カラースキーム
  call dein#add('vim-scripts/DirDiff.vim')
  call dein#add('tpope/vim-fugitive')         " 編集系、コマンドの直接実行
  call dein#add('junegunn/gv.vim')            " コミットツリー表示、管理
  call dein#add('idanarye/vim-merginal')      " ブランチ管理
  call dein#add('airblade/vim-gitgutter')     " 編集中のファイルの差分情報表示
  call dein#add('kristijanhusak/defx-icons')  " なんかアイコンのやつがneovimでも表示できるようなやつ
  call dein#add('thinca/vim-localrc')         " ローカル設定、プロジェクトの設定はだいたいこれでやったほうが楽な気がする
  call dein#add('scrooloose/nerdcommenter')   " コメントアウト   
  call dein#add('simeji/winresizer')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('haya14busa/vim-open-googletranslate')
  call dein#add('tyru/open-browser.vim')
  call dein#add('raghur/fruzzy')
  call dein#add('previm/previm')
  call dein#add('tpope/vim-markdown')
  call dein#add('deoplete-plugins/deoplete-dictionary')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mattn/sonictemplate-vim')
  call dein#add('mechatroner/rainbow_csv')
  call dein#add('elzr/vim-json')
  call dein#add('kana/vim-altr')
  call dein#add('itchyny/lightline.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('pepo-le/win-ime-con.nvim')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('sjl/gundo.vim')
  call dein#add('mattn/vim-goimports')
  call dein#add('tyru/columnskip.vim')
  call dein#add('voldikss/vim-translator')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('chemzqm/denite-git')
  call dein#add('glidenote/memolist.vim')
  call dein#add('kinntai/denite-bookmark')
  call dein#add('w1mvy/vim-denite-tab')

	call dein#config(['vim-markdown'], {
	\ 'lazy' : 1, 'on_ft' : 'markdown',
	\ })
	call dein#config('vim-goimports', {
	\ 'lazy' : 1, 'on_ft' : 'go',
	\ })
	call dein#config('vim-cpp-enhanced-highlight', {
	\ 'lazy' : 1, 'on_ft' : 'cpp',
	\ })
	call dein#config('rainbow_csv', {
	\ 'lazy' : 1, 'on_ft' : 'csv',
	\ })
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
if len(dein#check_clean()) > 0
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
"}}}

filetype plugin indent on   "ファイルタイプ用のインデント設定を自動読み込みする

noremap s <Nop>
let g:mapleader = "s"

" plugin
if dein#is_sourced('winresizer') "{{{
  let g:winresizer_start_key="\<Leader>e"
endif "}}}

if dein#is_sourced('nerdcommenter') "{{{
  let g:NERDSpaceDelims=1
  let g:NERDDefaultAlign='left'
endif "}}}

if dein#is_sourced('defx.nvim') "{{{
  nnoremap <silent> <Leader>d :<C-u>Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
  nnoremap <silent> <Leader>f :<C-u>Defx -split=vertical -winwidth=30 -direction=topleft<CR>
  augroup defx_settings
    autocmd!
    autocmd FileType defx call s:defx_my_settings()
    autocmd BufWritePost * call defx#redraw()
  augroup END
	function! s:defx_my_settings() abort
	  " Define mappings
    nnoremap <silent><buffer><expr> <CR>
          \ defx#is_binary() ?
          \ defx#do_action('execute_system') :
          \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> l
          \ defx#is_binary() ?
          \ defx#do_action('execute_system') :
          \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
          \ defx#is_binary() ?
          \ defx#do_action('execute_system') :
          \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> c
          \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
          \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
          \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> P
          \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
          \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> O
          \ defx#do_action('open_tree', 'recursive')
    nnoremap <silent><buffer><expr> K
          \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
          \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
          \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
          \ defx#do_action('toggle_columns',
          \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> St
          \ defx#do_action('multi',
          \                [['toggle_sort', 'time'], 'redraw'])
    nnoremap <silent><buffer><expr> Se
          \ defx#do_action('multi',
          \                [['toggle_sort', 'extension'], 'redraw'])
    nnoremap <silent><buffer><expr> Ss
          \ defx#do_action('multi',
          \                [['toggle_sort', 'size'], 'redraw'])
    nnoremap <silent><buffer><expr> Sf
          \ defx#do_action('multi',
          \                [['toggle_sort', 'filename'], 'redraw'])
    nnoremap <silent><buffer><expr> d
          \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
          \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
          \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
          \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
          \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
          \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
          \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
          \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
          \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
          \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
          \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
          \ defx#do_action('toggle_select_all')
    vnoremap <silent><buffer><expr> <Space>
          \ defx#do_action('toggle_select_visual')
    nnoremap <silent><buffer><expr> j
          \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
          \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
          \ defx#do_action('multi', ['redraw', 'clear_select_all'])
    nnoremap <silent><buffer><expr> <C-g>
          \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
          \ defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> a
          \ defx#do_action('add_session')
    nnoremap <silent><buffer><expr> > 
          \ defx#do_action('resize', defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> < 
          \ defx#do_action('resize', defx#get_context().winwidth - 10)
    nnoremap <silent><buffer> [denite]dd :<C-u>Denite defx/drive<CR>
    nnoremap <silent><buffer> [denite]dh :<C-u>Denite defx/history<CR>
    nnoremap <silent><buffer> [denite]ds :<C-u>Denite defx/session<CR>
	endfunction
  let s:defx_sessions_path = expand('~/.vim/defx-sessions')
  if !isdirectory(s:defx_sessions_path)
    call mkdir(s:defx_sessions_path, "p")
  endif
  call defx#custom#option('_', {
        \ 'auto_cd': v:false,
        \ 'columns': 'mark:indent:icons:filename:type:size:time:git',
        \ 'show_ignored_files': v:true,
        \ 'session_file': s:defx_sessions_path . '/default',
        \ 'toggle': v:true,
        \ 'drives': [expand('D:'), expand('~'), expand('~/Downloads'), expand('~/Documents'), expand('~/Desktop')]
        \ })
  unlet s:defx_sessions_path
  call defx#custom#column('time', {
        \ 'format': '%y/%m/%d %H:%M',
        \ })
	call defx#custom#column('filename', {
	      \ 'min_width': 40,
	      \ 'max_width': 80,
	      \ })
	call defx#custom#column('mark', {
	      \ 'readonly_icon': '✗',
	      \ 'selected_icon': '✓',
	      \ })
endif "}}}

if dein#is_sourced('vim-localrc') "{{{
  augroup vim_localrc_setting
    autocmd!
    autocmd BufEnter * nested
          \   call s:project_my_settings()
  augroup END

  function! s:project_my_settings() abort
    let git_dir = finddir('.git', expand('%:p:h') . ';')
    if git_dir !=# ''
      let project_path = fnamemodify(git_dir . '/../', ':p')
      if isdirectory(project_path)
        execute('lcd ' . project_path)
        execute('setlocal path+=' . project_path . '**')
      endif
    endif

    let load_files = localrc#search(g:localrc_filename)
    if !empty(load_files)
      call localrc#load(g:localrc_filename)
    endif
  endfunction
endif "}}}

if dein#is_sourced('denite.nvim') "{{{
  augroup denite_settings
    autocmd!
    autocmd FileType denite call s:denite_my_settings()
  augroup END
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> a
          \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> <TAB>
          \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> l
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> s
          \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> v
          \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> t
          \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> w
          \ denite#do_map('do_action', 'switch')
    nnoremap <silent><buffer><expr> d
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
          \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> h
          \ denite#do_map('move_up_path')
    nnoremap <silent><buffer><expr> q
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <ESC>
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-o>
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
          \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> *
          \ denite#do_map('toggle_select_all')
    nnoremap <silent><buffer><expr> <C-l>
          \ denite#do_map('redraw')
    nnoremap <silent><buffer><expr> m
          \ denite#do_map('quick_move')
	  nnoremap <silent><buffer><expr> j
          \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
          \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer> <C-b>
          \ :<C-u>call <SID>denite_quickfix()<CR>
  endfunction
	function! s:denite_quickfix()
	  call denite#call_map('toggle_select_all')
	  call denite#call_map('do_action', 'quickfix')
	endfunction

  augroup denite_filter_settings
    autocmd!
    autocmd FileType denite-filter call s:denite_filter_my_settings()
  augroup END
  function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	  imap <silent><buffer> <C-[> <Plug>(denite_filter_quit)
	  imap <silent><buffer> <ESC> <Plug>(denite_filter_quit)
	  imap <silent><buffer> <CR> <Plug>(denite_filter_update)
  endfunction

	" For ripgrep
	" Note: rg is faster than ag
	call denite#custom#var('file/rec', 'command',
	\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

  " Change matchers.
  call denite#custom#source(
        \ '_', 'matchers', ['matcher/fruzzy'])

  " Change sorters.
  call denite#custom#source(
        \ '_', 'sorters', ['sorter/rank'])

  call denite#custom#source(
        \ '_', 'max_candidates', 5000)

  call denite#custom#source('grep',
        \ 'converters', ['converter/abbr_word'])

  call denite#custom#kind('bookmark/directory', 'default_action', 'candidate_file_rec')

	" Ripgrep command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['--vimgrep', '--no-heading', '--smart-case'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

  " Define alias
  call denite#custom#alias('source', 'file/rec/git', 'file/rec')
  call denite#custom#var('file/rec/git', 'command',
        \ ['git', 'ls-files', '-co', '--exclude-standard'])
  call denite#custom#alias('source', 'grep/git', 'grep')
  call denite#custom#var('grep/git', 'command',
        \ ['git', 'grep', '-i'])
  call denite#custom#var('grep/git', 'recursive_opts', [])
  call denite#custom#var('grep/git', 'pattern_opt', [])
  call denite#custom#var('grep/git', 'separator', ['--'])
  call denite#custom#var('grep/git', 'final_opts', [])
  call denite#custom#alias('source', 'file/rec/py', 'file/rec')
  call denite#custom#var('file/rec/py', 'command',['scantree.py'])

  let s:menus = {}
	let s:menus.my_commands = {
		\ 'description': 'commands'
		\ }
	let s:menus.my_commands.command_candidates = [
		\ ['Format Json', 'set nobomb | %!python -m json.tool'],
		\ ['Make tags file', '!ctags -R'],
		\ ['Count character num', '%s/./&/gn'],
		\ ['Count word num', '%s/\i\+/&/gn'],
		\ ['Lcd current buffer dir', 'lcd %:h'],
		\ ['Cd current buffer dir', 'cd %:h'],
		\ ['Change CRLF', 'e ++ff=dos'],
		\ ['Change LF', 'e ++ff=mac'],
		\ ['Change cp932', 'set fenc=cp932'],
		\ ]
  call denite#custom#var('menu', 'menus', s:menus)

  call denite#custom#option('_', {
        \ 'auto_resize': v:true,
        \ 'empty': v:false,
        \ 'direction': 'dynamictop',
        \ 'winheight': 35,
        \ 'winwidth': &columns * 3 / 5,
        \ 'winrow': &lines / 2 - 18,
        \ 'smartcase': v:true,
        \ })

  " Change default prompt
  augroup denite_resize_settings
    autocmd!
    autocmd VimResized * call denite#custom#option('_', {
                            \ 'auto_resize': v:true,
                            \ 'empty': v:false,
                            \ 'direction': 'dynamictop',
                            \ 'winheight': 35,
                            \ 'winwidth': &columns * 3 / 5,
                            \ 'winrow': &lines / 2 - 18,
                            \ 'smartcase': v:true,
                            \ })
  augroup END
  if has('nvim')
    call denite#custom#option('_', {
          \ 'split': 'floating',
          \ })
  endif

  " Change ignore_globs
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
        \ ['*~', '*.o', '*.exe', '*.bak',
        \  '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
        \  '.hg/', '.git/', '.bzr/', '.svn/',
        \  'tags', 'tags-*', '__pycache__'])

  " Custom action
  " Note: lambda function is not supported in Vim8.
	function! s:candidate_file_rec(context)
	  let path = a:context['targets'][0]['action__path']
	  let narrow_dir = denite#util#path2directory(path)
	  let sources_queue = a:context['sources_queue'] + [[
	        \ {'name': 'file/rec', 'args': [narrow_dir]},
	        \ ]]
	  return {'sources_queue': sources_queue}
	endfunction
	call denite#custom#action('buffer,directory,file,openable,bookmark/directory',
	        \ 'candidate_file_rec', function('s:candidate_file_rec'))

  " 候補にコマンドを実行
  " :Denite -resume -do='normal! A;'

  nnoremap [denite] <Nop>
  nmap , [denite]
  nnoremap <silent> [denite]n  :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
  nnoremap <silent> [denite]p  :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>
  nnoremap <silent> [denite]rg :<C-u>Denite -resume -buffer-name=search-buffer<CR>
  nnoremap <silent> [denite]rm :<C-u>Denite -resume -buffer-name=bookmark-buffer<CR>
  nnoremap <silent> [denite]ff :<C-u>Denite file<CR>
  nnoremap <silent> [denite]fr :<C-u>Denite file/rec<CR>
  nnoremap <silent> [denite]fg :<C-u>Denite file/rec/git<CR>
  nnoremap <silent> [denite]b  :<C-u>Denite buffer<CR>
  nnoremap <silent> [denite]cf :<C-u>DeniteBufferDir file<CR>
  nnoremap <silent> [denite]cr :<C-u>DeniteBufferDir file/rec<CR>
  nnoremap <silent> [denite]gg :<C-u>Denite -buffer-name=search-buffer grep<CR>
  nnoremap <silent> [denite]ig :<C-u>Denite -buffer-name=search-buffer -start-filter grep:::!<CR>
  nnoremap <silent> [denite]pg :<C-u>Denite -buffer-name=search-buffer grep::-w<CR>
  nnoremap <silent> [denite]w  :<C-u>Denite -buffer-name=search-buffer `'grep:::' . expand('<cword>')`<CR>
  nnoremap <silent> [denite]pw :<C-u>Denite -buffer-name=search-buffer `'grep::-w:' . expand('<cword>')`<CR>
  nnoremap <silent> [denite]<Space> :<C-u>Denite -buffer-name=bookmark-buffer bookmark<CR>
  nnoremap <silent> [denite]ch :<C-u>Denite change<CR>
  nnoremap <silent> [denite]dr :<C-u>Denite directory_rec<CR>
  nnoremap <silent> [denite]fo :<C-u>Denite file/old<CR>
  nnoremap <silent> [denite]h  :<C-u>Denite file_mru<CR>
  nnoremap <silent> [denite]j  :<C-u>Denite jump<CR>
  nnoremap <silent> [denite]e  :<C-u>Denite menu<CR>
  nnoremap <silent> [denite]s  :<C-u>Denite output:message<CR>
  nnoremap <silent> [denite]re :<C-u>Denite register<CR>
  nnoremap <silent> [denite]t  :<C-u>Denite tag<CR>
  nnoremap <silent> [denite]dl :<C-u>Denite dein/log<CR>
  nnoremap <silent> [denite]k  :<C-u>Denite mark<CR>
  nnoremap <silent> [denite]y  :<C-u>Denite neoyank<CR>
  nnoremap <silent> [denite]l  :<C-u>Denite line::noempty<CR>
  nnoremap <silent> [denite]o :<C-u>Denite outline<CR>
  nnoremap <silent> [denite]t :<C-u>Denite tab<CR>
endif "}}}

if dein#is_sourced('deoplete.nvim') "{{{
	" Use deoplete.
	let g:deoplete#enable_at_startup = 1
	" Use smartcase.
	call deoplete#custom#option('smart_case', v:true)
  " call deoplete#custom#option('sources', {'_': ['around', 'buffer', 'file', 'member', 'file/include']})
  " call deoplete#custom#option('sources', {'_': ['around', 'buffer', 'file', 'member', 'include', 'lsp']})
  call deoplete#custom#option('sources', {'_': ['around', 'buffer', 'file', 'member', 'include']})
  call deoplete#custom#var('around', {
        \   'mark_above': '[↑]',
        \   'mark_below': '[↓]',
        \   'mark_changes': '[*]',
        \})

	" <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
  endfunction
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-p>" : "\<S-TAB>"
  inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-g> deoplete#undo_completion()       
endif "}}}

if dein#is_sourced('vim-gitgutter') "{{{
  if has('win32') || has('win64')
    let g:gitgutter_git_executable = expand('~\scoop\shims\git.exe')
  endif
  let g:gitgutter_diff_args = '-w'
endif "}}}

if dein#is_sourced('previm') "{{{
  if has('win32') || has('win64')
    " let g:previm_open_cmd = '"C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"'
  elseif has('mac')
    " let g:previm_open_cmd = 'open -a Google\ Chrome'
  endif
endif "}}}

if dein#is_sourced('open-browser.vim') "{{{
	let g:netrw_nogx = 1 " disable netrw's gx mapping.
  let g:openbrowser_use_vimproc = 0
	nmap <Leader>x <Plug>(openbrowser-smart-search)
	vmap <Leader>x <Plug>(openbrowser-smart-search)
endif "}}}

if dein#is_sourced('vim-cpp-enhanced-highlight') "{{{
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_concepts_highlight = 1
endif "}}}

if dein#is_sourced('vim-altr') "{{{
  call altr#define_defaults()
  nmap <Leader>n <Plug>(altr-forward)
  nmap <Leader>p <Plug>(altr-back)
endif "}}}

if dein#is_sourced('neoinclude.vim') "{{{
  if !exists('g:neoinclude#exts')
    let g:neoinclude#exts = {}
  endif
  let g:neoinclude#exts.cpp = ['', 'h', 'hpp', 'hxx']
endif "}}}

if dein#is_sourced('lightline.vim') "{{{
  if has('win32') || has('win64')
    let s:offset = '' 
  elseif has('mac')
    let s:offset = ''
  endif
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [['mode', 'paste'],
        \            ['fugitive', 'readonly', 'filename', 'modified']],
	      \   'right': [['syntastic', 'lineinfo'],
        \             ['percent'], 
        \             ['fileformat', 'fileencoding', 'filetype']]
        \ },
        \ 'component': {
        \   'lineinfo': ' %3l:%-2v',
        \ },
        \ 'component_function': {
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
	      \   'fileformat': 'LightlineFileformat',
	      \   'filetype': 'LightlineFiletype',
	      \   'fileencoding': 'LightlineFileencoding',
        \ },
        \ 'separator': { 'left': ''. s:offset, 'right': ''. s:offset },
        \ 'subseparator': { 'left': '|', 'right': '|' },
        \ 'tab': {
        \   'active': [ 'tabnum', 'filename', 'fullpath', 'modified' ],
        \   'inactive': [ 'tabnum', 'filename', 'modified' ] 
        \ },
        \ 'tab_component_function': {
        \   'fullpath': 'LightlineFilename'
        \ }
        \ }
	function! LightlineReadonly()
    return &readonly ? ''. s:offset : ''
	endfunction
	function! LightlineFugitive()
		if exists('*fugitive#head')
			let branch = fugitive#head()
      return branch !=# '' ? ''. s:offset . branch : ''
		endif
		return ''
	endfunction
  function! LightlineFilename(tabcount)
    let path = expand('%:p:h')
    return path !=# '' ? '[' . path . ']' : ''
  endfunction
	function! LightlineFileformat()
    let ff_table = {'dos' : 'CRLF', 'unix' : 'LF', 'mac' : 'CR' }
	  return winwidth(0) > 85 ? ff_table[&fileformat] : ''
	endfunction
	function! LightlineFiletype()
	  return winwidth(0) > 85 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
	endfunction
	function! LightlineFileencoding()
	  return winwidth(0) > 85 ? (&fenc !=# '' ? &fenc : &enc) . (&bomb ? '[BOM]' : '') : ''
	endfunction
endif "}}}

if dein#is_sourced('defx-icons') "{{{
  let g:defx_icons_enable_syntax_highlight = 1
  let g:defx_icons_column_length = 2
  let g:defx_icons_directory_icon = ''
  let g:defx_icons_mark_icon = '*'
  let g:defx_icons_parent_icon = ''
  let g:defx_icons_default_icon = ''
  let g:defx_icons_directory_symlink_icon = ''
endif "}}}

if dein#is_sourced('tagbar') "{{{
  let g:tagbar_left = 1
  let g:tagbar_width = 90
  let g:tagbar_show_linenumbers = -1
  let g:tagbar_foldlevel = 1
endif "}}}

if dein#is_sourced('vim-test') "{{{
  let g:test#strategy = 'dispatch'
  " let g:test#project_root = 'C:\Users\taiki\ff-github\scripts\python\util'
endif "}}}

if dein#is_sourced('vim-easy-align')
  vmap <Enter> <Plug>(EasyAlign)
  xmap <Leader>a <Plug>(EasyAlign)
  nmap <Leader>a <Plug>(EasyAlign)
endif

if exists('g:loaded_netrw')
  if g:loaded_netrw == 1
    let g:netrw_liststyle = 1
    let g:netrw_banner = 0
    let g:netrw_sizestyle="H"
    let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
  endif
endif

if dein#is_sourced('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
endif

if dein#is_sourced('gundo.vim')
  let g:gundo_width = 70
  let g:gundo_preview_height = 20
  let g:gundo_right = 0
endif

if dein#is_sourced('vim-translator')
  " Text highlight of translator window
  hi def link TranslatorQuery     Identifier
  hi def link TranslatorPhonetic  Type
  hi def link TranslatorExplain   Statement
  hi def link TranslatorDelimiter Special
  " Background of translator window border
  hi def link TranslatorNF        NormalFloat
  hi def link TranslatorBorderNF  NormalFloat

  let g:translator_target_lang = 'ja'
  let g:translator_window_max_width = 0.3425
  let g:translator_window_max_height = 0.8
  " Echo translation in the cmdline
  nmap <silent> <Leader>t <Plug>Translate
  vmap <silent> <Leader>t <Plug>TranslateV
  " Display translation in a window
  nmap <silent> <Leader>w <Plug>TranslateW
  vmap <silent> <Leader>w <Plug>TranslateWV
  " Replace the text with translation
  nmap <silent> <Leader>r <Plug>TranslateR
  vmap <silent> <Leader>r <Plug>TranslateRV
  " Translate the text in clipboard
  nmap <silent> <Leader>y <Plug>TranslateX
endif

if dein#is_sourced('columnskip.vim')
  nmap <Leader>j <Plug>(columnskip:nonblank:next)
  omap <Leader>j <Plug>(columnskip:nonblank:next)
  xmap <Leader>j <Plug>(columnskip:nonblank:next)
  nmap <Leader>k <Plug>(columnskip:nonblank:prev)
  omap <Leader>k <Plug>(columnskip:nonblank:prev)
  xmap <Leader>k <Plug>(columnskip:nonblank:prev)
  nmap <Leader>] <Plug>(columnskip:first-nonblank:next)
  omap <Leader>] <Plug>(columnskip:first-nonblank:next)
  xmap <Leader>] <Plug>(columnskip:first-nonblank:next)
  nmap <Leader>[ <Plug>(columnskip:first-nonblank:prev)
  omap <Leader>[ <Plug>(columnskip:first-nonblank:prev)
  xmap <Leader>[ <Plug>(columnskip:first-nonblank:prev)
endif

if dein#is_sourced('vim-fugitive')
  nnoremap <Leader>gs :<C-u>Git<CR>
  nnoremap <Leader>gb :<C-u>Git blame<CR>
  nnoremap <Leader>gd :<C-u>Gdiffsplit<CR>
  nnoremap <Leader>gf :<C-u>Git fetch<CR>
  nnoremap <Leader>gl :<C-u>Git pull<CR>
  nnoremap <Leader>gp :<C-u>Git push<CR>
  augroup gstatus_settings
    autocmd!
    autocmd FileType fugitive call s:gstatus_my_settings()
  augroup END
  function! s:gstatus_my_settings() abort
    nnoremap <buffer> q <C-w>q
  endfunction
endif

if dein#is_sourced('switch.vim')
  let g:switch_mapping = '<Leader>s'
endif

if dein#is_sourced('scrollbar.nvim')
  augroup scrollbar_nvim_settings
    autocmd!
    autocmd BufEnter    * silent! lua require('scrollbar').show()
    autocmd BufLeave    * silent! lua require('scrollbar').clear()
    autocmd CursorMoved * silent! lua require('scrollbar').show()
    autocmd VimResized  * silent! lua require('scrollbar').show()
    autocmd FocusGained * silent! lua require('scrollbar').show()
    autocmd QuitPre     * silent! lua require('scrollbar').show()
    autocmd FocusLost   * silent! lua require('scrollbar').clear()
  augroup end
  let g:scrollbar_width = 2
endif

if dein#is_sourced('memolist.vim')
  nnoremap <silent> [denite]mm  :MemoList<CR>
  nnoremap <silent> [denite]mn  :MemoNew<CR>
  nnoremap <silent> [denite]mg  :MemoGrep<CR>
  let g:memolist_denite = 1
  let g:memolist_memo_suffix = "md"
  let g:memolist_prompt_categories = 0
  let g:memolist_prompt_tags = 0
  let g:memolist_path = "~/Documents/memo"
endif

" 設定{{{
" packadd
if !has('nvim')
  packadd! matchit
endif
" 設定
" 表示
set termguicolors
set number        "行番号表示
set relativenumber " 相対行番号表示
set title         "編集中のファイル名を表示
set showcmd       "入力中のコマンド表示
set ruler         "座標を表示
set showmatch     "対応する括弧を表示
set laststatus=2  "ステータスラインを表示
set nowrap        "端で折り返さない
set cursorline    "カーソルラインをハイライト
" set cursorcolumn  "縦にもハイライト
set previewheight=36
set cindent
set cinoptions=g1,N-s,h1,l1,j1 "| setl foldmethod=indent
set scrolloff=9  "カーソルの上または下に表示される最低行数
set diffopt=internal,filler,indent-heuristic,algorithm:histogram
set cmdheight=2   "コマンドラインに使われる画面上の行数
set listchars=tab:>-,trail:-,nbsp:+
" set list
if has('nvim')
  set pumblend=15
  set winblend=15
endif
if has('win32') || has('win64')
  set ambiwidth=single
elseif has('mac')
  set ambiwidth=double
endif
" set iminsert=0
"set scrolljump=5 "画面外に出た時にスクロールする行数
"set fileformat?  "e ++ff=dos "(CRLF) "e ++ff=mac "(LF)
"e ++enc=utf-8
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
let g:ff_table = {'dos' : 'CRLF', 'unix' : 'LF', 'mac' : 'CR' }
function! s:MyStatusLine()
  let str = '%<%f %m%r%h%w%y'
  let str .= '[%{(&fenc!=""?&fenc:&enc)}]'
  let str .= '%{&bomb?"[BOM]":""}'
  let str .= '[%{ff_table[&ff]}]'
  let str .= '%{FugitiveStatusline()}'
  let str .= '%=%l/%L %4c %4P'
  return str
endfunction
" let &statusline = '%!' . s:SID_PREFIX() . 'MyStatusLine()'
function! s:MyTabLine()
  let str = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let str .= '%'.i.'T'
    let str .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let str .= no . ':' . title
    let str .= mod
    let str .= '%#TabLineFill# '
  endfor
  let str .= '%#TabLineFill#%T%=%#TabLine#'
  if tabpagenr('$') > 1
    let str .= '%999X[X]'
  endif
  return str
endfunction
" let &tabline = '%!'. s:SID_PREFIX() . 'MyTabLine()'
set showtabline=2 " 常にタブラインを表示
set matchpairs+=<:>
augroup setting_per_filetype
  autocmd!
  autocmd FileType c,cpp let b:match_words='private\::protected\::public\:,if:else,switch:case:default,#if:#else:#elif:#endif'
  autocmd FileType cs,markdown,python,groovy setl shiftwidth=4 softtabstop=4 tabstop=4
  " autocmd FileType json setl foldmethod=syntax foldlevel=3
augroup END
augroup terminal_setting
  autocmd!
  autocmd TermOpen * setlocal statusline=%{b:term_title}
  autocmd TermOpen * setlocal list
augroup END
"set cindent       "C言語インデントに従って自動インデント
"set cinoptions=g1,N-s "スコープ宣言をブロックのインデントから１の位置に，namespaceはインデントしない
set expandtab     "タブをスペースに置き換え、タブ死すべし
set tabstop=2     "画面上でのタブ幅
set shiftwidth=2  "自動インデントでずれる幅
set shiftround    "インデントをshiftwidthの倍数に丸める
set softtabstop=2 "連続した空白でのタブやバックスペースで動く幅
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭，行末で止まらないように
set clipboard=unnamed "無名レジスタに
set wildmenu      "コマンドモードの補完
set wildmode=full
set nofixeol      "最後に改行のないファイルを編集したときに改行を付けない
set history=200   "コマンドラインモードの履歴を200に
"set textwidth=80 "グーグルコーディング規約に従って
"set colorcolumn=+1
"set foldcolumn=3
set completeopt-=preview
" ファイル
set hidden    "変更中でも他のファイルを開けるように
set autoread  "ファイル内容が変更されると自動読み込み
set undofile
set undodir=~/.vim/undofile
set directory=~/.vim/swapfile   "スワップファイル
let s:backup_path = expand('~/.vim/backupfile')
if !isdirectory(s:backup_path)
  call mkdir(s:backup_path, "p")
endif
execute 'set backupdir=' . s:backup_path
unlet! s:backup_path
" 検索
set incsearch "インクリメンタルサーチ
set hlsearch  "検索結果をハイライト
set ignorecase "大文字小文字を区別しない
set smartcase "検索時に大文字を含んでいたら大小を区別
set wrapscan  "検索をファイルの先頭へループ
" 入力
set mouse=a
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup binary_edit
  autocmd!
  autocmd BufReadPre   *.bin let &bin=1
  autocmd BufReadPost  * if &bin | %!xxd
  autocmd BufReadPost  * set ft=xxd | endif
  autocmd BufWritePre  * if &bin | %!xxd -r
  autocmd BufWritePre  * endif
  autocmd BufWritePost * if &bin | %!xxd
  autocmd BufWritePost * set nomod | endif
augroup END

command! -nargs=* Terminal split | resize 20 | terminal <args>
command! -nargs=* T split | resize 20 | terminal <args>
command! -nargs=* Vterminal vsplit | terminal <args>
command! -nargs=* V vsplit | terminal <args>
command! Bd :bp | :sp | :bn | :bd   " ウィンドウを閉じずにバッファを閉じる
nnoremap <silent> <F2> :<C-u>Terminal<CR>

let s:session_path = expand('~/.vim/sessions')
if !isdirectory(s:session_path)
  call mkdir(s:session_path, "p")
endif
command! -nargs=1 SaveSession call s:saveSession(<f-args>)
function! s:saveSession(file_name)
  execute 'mksession!' s:session_path . '/' . a:file_name
endfunction
command! -nargs=1 LoadSession call s:loadSession(<f-args>)
function! s:loadSession(file_name)
  execute 'silent source' s:session_path . '/' . a:file_name
endfunction
command! -nargs=1 DeleteSession call s:deleteSession(<f-args>)
function! s:deleteSession(file_name)
  call delete(s:session_path . '/' . a:file_name)
endfunction
nnoremap <C-s> :<C-u>SaveSession default<CR>
nnoremap g<C-l> :<C-u>LoadSession default<CR>
nnoremap g<C-d> :<C-u>DeleteSession default<CR>
"}}}

" プラグインに関係ないキーマップ{{{
nnoremap / /\v
nnoremap ? ?\v
" 挙動をC、Dと同じにする
nnoremap Y y$
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>
" inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
" inoremap <silent> <C-[> <ESC>:set iminsert=0<CR>
nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>:GitGutter<CR>
nnoremap <silent> <C-]> g<C-]>
nnoremap <silent> <C-w>} <C-w>g}
noremap ; :
noremap : ;
" cnoremap ; :
" cnoremap : ;
nnoremap ' `
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap gT :tabfirst<CR>
nnoremap gt :tablast<CR>
nnoremap <C-k> :tablast <bar> tabnew<CR>
" tnoremap <C-[> <C-W>N
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
inoremap <A-h> <C-\><C-n><C-w>h
inoremap <A-j> <C-\><C-n><C-w>j
inoremap <A-k> <C-\><C-n><C-w>k
inoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>
cnoremap <expr> / (getcmdtype() == '/') ? '\/' : '/'
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
" ドットコマンドが使えない
" nnoremap go :<C-u>call append(expand('.'), '')<CR>j
nnoremap go o<ESC>
nnoremap gO O<ESC>
inoremap jj <ESC>
inoremap っｊ <ESC>
nnoremap ^ 0
nnoremap 0 ^
" nnoremap p gp
" nnoremap P gP
" nnoremap gp p
" nnoremap gP P
nnoremap <F5> :call dein#check_update(v:true)<CR>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap ? :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  normal! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
if has('win32') || has('win64')
  nnoremap <silent> <F3> :<C-u>!start .<CR>
elseif has('mac')
  nnoremap <silent> <F3> :<C-u>!open .<CR>
endif
nnoremap x "_x
nnoremap <Leader>c :cd %:h<CR>
nnoremap <Leader>lc :lcd %:h<CR>
" nnoremap p "0p
" nnoremap P "0P
"}}}

" MEMO{{{
" :r! date
" 再度コマンドを打つときはq:がいい気がする
" v_g_CTRL-A
" 10. ファイルを挿入する					*inserting-file*
" 文字数カウント
" command! Cc %s/./&/gn
" nnoremap <Leader>g :Gtags 
" nnoremap <Leader>r :Gtags -r 
" nnoremap <Leader>o :Gtags -f %<CR>
" nnoremap <Leader>c :GtagsCursor<CR>
" nnoremap <Leader>n :cn<CR>
" nnoremap <Leader>p :cp<CR>
"便利なマッピング					*useful-mappings*
"C のプログラムを編集する				*C-editing*
"*usr_29.txt*	For Vim バージョン 8.0.  Last change: 2016 Feb 27
"*41.11*	プラグインを書く				*write-plugin*
"単語や行などの数を数える				*count-items*
"	:%s/./&/gn		   文字
"	:%s/\i\+/&/gn		 単語
"	:%s/^//n		     行
"	:%s/the/&/gn		 "the" (どこかしら)
"	:%s/\<the\>/&/gn "the" (単語一致)
" inoremap <C-H> (
" inoremap <C-J> )
" inoremap <C-K> [
" inoremap <C-L> ]
" inoremap <C-D> *
" :%!python -m json.tool
" http://items.sjbach.com/319/configuring-vim-right	
" nnoremap 0 ^
" nnoremap ^ 0
" ヘルプ
" index
" eval
" functions
" function-list
"}}}
":g/検索したい文字列で検索したい文字列を含まれる行を一覧取得
"echo &ft

syntax on	            "シンタックスカラーリング
set background=dark
colorscheme eva01-LCL
" colorscheme eva01

"eva01{{{
" hi Comment cterm=NONE gui=NONE
hi CursorLine ctermbg=235 guibg=#262626 cterm=NONE gui=NONE
hi Visual cterm=NONE gui=NONE
hi Search cterm=NONE guifg=#FFFFFF guibg=#875FAF gui=NONE
hi DiffChange guifg=#000000 guibg=#AEEA00
" hi! NormalFloat cterm=NONE guifg=#FFFFFF guibg=#875FAF gui=NONE
" hi NormalFloat gui=NONE guifg=#D0D0D0 guibg=#585858
"}}}
