set guifont=Monaco:h13  " font settings
set guioptions=-t       " hide toolbar

" return to normal mode after saving
iunmenu File.Save 
imenu <silent> File.Save <Esc>:if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR> 
