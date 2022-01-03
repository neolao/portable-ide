" Supprimer une ligne
map <silent> <C-d> :delete<cr>
imap <C-d> <Esc><C-d>:startinsert<cr>

" Déplacer la ligne vers le haut
map <silent> <C-u> :.move .-2<cr>
imap <C-u> <Esc><C-u>:startinsert<cr>

" Déplacer la ligne vers le bas
map <silent> <C-j> :.move .+1<cr>
imap <C-j> <Esc><C-j>:startinsert<cr>

" Déplacer les lignes vers le haut
vmap <silent> <C-u> :move '<-2<cr>gv

" Déplacer les lignes vers le bas
vmap <silent> <C-j> :move '>+1<cr>gv

" Dupliquer la ligne vers le bas
map <silent> <C-k> :.copy .<cr>
imap <C-k> <Esc><C-k>:startinsert<cr>

" Dupliquer les lignes vers le haut
vmap <silent> <C-i> :copy '><cr>gv

" Dupliquer les lignes vers le bas
vmap <silent> <C-k> :copy '<-1<cr>gv
