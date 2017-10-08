""""""""""""""""""""""""""""""
" => Pathogen 
""""""""""""""""""""""""""""""
" Must be placed on top to work
call pathogen#infect()


""""""""""""""""""""""""""""""
" Startup Theme
""""""""""""""""""""""""""""""
let g:solarized_termcolors=256
syntax enable
colorscheme solarized


"""""""""""""""""""""""""""""
" set 
"""""""""""""""""""""""""""""
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set formatoptions=croql
set number
set listchars=eol:¬,tab:│-,trail:.,extends:\#,nbsp:.
set list
set nowrap


""""""""""""""""""""""""""""""
" => Escape with jj
""""""""""""""""""""""""""""""
inoremap jj <Esc>
" nnoremap <Space>p :CtrlP<CR>
" nnoremap <Space>p :CtrlP<CR>
-

""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1" 
let g:airline_powerline_fonts = 1


""""""""""""""""""""""""""""""
" => indentLine
""""""""""""""""""""""""""""""
let g:indentLine_enable = 1


""""""""""""""""""""""""""""""
" => Buffer
""""""""""""""""""""""""""""""
map <right> :bn<cr>
map <left> :bp<cr>


"""""""""""""""""""""""""""""""
" => Bind Function Keys
"""""""""""""""""""""""""""""""
let helpmenu = "[F1]Help -- [F2]80Colum -- [F3]NERDTree -- [F4]ExitBuffer -- [F5]NewBuffer -- [F6]BgColor -- [F7]Number -- [F8]Tagbar -- [F9]None -- [F10]None -- [F11]None -- [F12]None"
map <F1> :echo helpmenu<cr>
" Toggle 80 column marker
nnoremap <F2> :call ToggleColorColumn()<cr>
map <F3> :NERDTreeToggle<cr> :echo helpmenu<cr>
nnoremap <F4> :bd!<cr> :echo helpmenu<cr>
nnoremap <F5> <esc>:e 
nnoremap <F6> :call ToggleSolarized()<cr> :echo helpmenu<cr>
nnoremap <F7> :set invnumber<cr> :call ToggleList()<cr> :IndentLinesToggle <cr> :echo helpmenu<cr>
nmap <F8> :TagbarToggle<cr> :echo helpmenu<cr>
nnoremap <S-Q> <esc>:q!<cr> 


"""""""""""""""""""""""""""""
" => Function
"""""""""""""""""""""""""""""
" <F2> Function Binding
func! ToggleColorColumn()
    if exists("b:colorcolumnon") && b:colorcolumnon
        let b:colorcolumnon = 0
        exec ':set colorcolumn=0'
        echo '80 column marker off'
    else
        let b:colorcolumnon = 1
        exec ':set colorcolumn=80'
        echo '80 column marker on'
    endif
endfunc

" <F6> Function Binding
func! ToggleSolarized()
    if &bg ==# "light"
        colorscheme solarized
        set bg=dark
        AirlineTheme dark
    else
        colorscheme solarized
        set bg=light
    endif
endfunc

" <F7> Function ToggleList
func! ToggleList()
    if &list ==# 0
        set list
    else
        set nolist
    endif
endfunc
