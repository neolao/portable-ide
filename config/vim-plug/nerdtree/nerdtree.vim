" Afficher / Cacher NERDTree
let g:nerdtreeopened=1
function! ToggleNERDTree()
    execute(":NERDTreeToggle")
    if g:nerdtreeopened != 0
        let g:nerdtreeopened=0
    else
        let g:nerdtreeopened=1
    endif
endfunction
function! ResumeNERDTree()
    if g:nerdtreeopened != 0
        execute(":NERDTree")
        execute(":NERDTreeMirror")
    else
        execute(":NERDTreeClose")
    endif
endfunction

" Ouvrir NERDTree à chaque fois qu'on lance vim
" Et aussi à chaque fois qu'on change d'onglet
" La même sidebar est réutilisée à chaque fois
"autocmd VimEnter * execute ResumeNERDTree()
"autocmd VimEnter * wincmd p
"autocmd TabLeave * wincmd p
"autocmd TabEnter * execute ResumeNERDTree()
"autocmd TabEnter * wincmd p

" Ne pas ignorer de fichiers
let NERDTreeIgnore=[]

" Affichier les dossiers et fichiers cachés
let NERDTreeShowHidden=1

" Taille de l'explorateur
let NERDTreeWinSize=30

let g:NERDTreeNodeDelimiter = "\u00a0"


let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_focus_on_files = 1

autocmd VimEnter * NERDTreeToggle
autocmd VimEnter * NERDTreeTabsOpen

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['tsx'] = s:salmon
