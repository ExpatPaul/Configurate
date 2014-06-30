"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Numbering
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set ic "ignore case

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set filetype=on
so ~/.vim/mysyntax.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trim white space
function! TrimWhiteSpace()
     %s/\s\+$//
endfunction

" Convert a column of character values into a list
function! ListerateCharacter()
    %s/^/'
    %s/\n/', 
    %s/, $//
endfunction

" Convert a column of numeric values into a list
function! ListerateNumeric()
    %s/\n/, 
    %s/, $//
endfunction

" Reformat EDIFACT and ANSI X12 file for readability
function! ReformatEDI()
    %s/'/'\r/ge
    %s/\~/\~\r/ge
    1
endfunction

" List all Warning and Error messages
function! GrepErrors()
    g/Warning\|Error/p
endfunction

" De-cruft a DSPFFD
function! DecruftDSPFFD()
    1,19d
    %g/Display File Field/d
    %g/Record format/d
    %g/Field text/d
    %g/Coded Character/d
    3,%g/Data\s\+Field/d
    3,%g/Field\s\+Type/d
    0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = '\'

nnoremap <silent> <Leader>tws :call TrimWhiteSpace()<CR>
nnoremap <silent> <Leader>lc :call ListerateCharacter()<CR>
nnoremap <silent> <Leader>ln :call ListerateNumeric()<CR>
nnoremap <silent> <leader>edi :call ReformatEDI()<CR>
nnoremap <silent> <leader>trc :call GrepErrors()<CR>
nnoremap <silent> <leader>df :call DecruftDSPFFD()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stuff for making vim useful in Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More Mappings: Copy and Paste
nmap <C-V> "+gP
vmap <C-C> "+y
vmap <C-X> "+x

" Settings for gvim
if has("gui_running")
    colorscheme murphy
    set guifont=Lucida_Console:h10
    au GUIEnter * simalt ~x
else
    colorscheme default
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Twitvim
" Config settings to use TwitVim with Identi.ca
" UserID:Password refers to your Identi.ca UserID and Password
" Vimball: http://vim.sourceforge.net/scripts/script.php?script_id=2204
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let twitvim_api_root = "https://quitter.se/api"
let twitvim_cert_insecure = 0
let twitvim_login = "UserID:Password"

let twitvim_browser_cmd = 'firefox'
let twitvim_old_retweet = 1
let twitvim_retweet_format = 'RD %s: %t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Towel Day Easter Egg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let today = strftime("%m%d")
if today == 0525 + 0
    echo "Listen. It's a tough universe."  
    echo "There's all sorts of people and things trying to do you, " . 
         \ "kill you, rip you off, everything. " 
    echo "If you're going to survive out there, you've really got to know where your towel is."
endif
