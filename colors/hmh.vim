set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "handmade-hero"

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" Colors

let s:back = ['#161616', 233]
let s:default = ['#cdaa7d', 137]
let s:NONE = ["none", "none"]

let s:margin = ["#262626", 235]
let s:margin_hover = ["#333333", 236]
let s:margin_active = ["#404040", 238]
let s:cursor = ["#40FF40", 83]
let s:keyword = ["#cd950c", 23]
let s:highlight = ["#703419", 58]
let s:comment = ["#7f7f7f", 244]
let s:blue = ["#191970", 16]
let s:green = ["#6b8e23", 15]
let s:special = ["#FF0000", 196]
let s:none = ['NONE', 'NONE']
let s:underline = 'underline,'

call s:HL('Normal', s:default, s:back)
call s:HL('Visual', s:default, s:highlight)
call s:HL('Search', s:default, s:highlight)
call s:HL('IncSearch', s:default, s:highlight)
call s:HL('Special', s:default, s:back)
call s:HL('@punctuation', s:default, s:back)
call s:HL('@variable', s:default, s:back)
call s:HL('@keyword.type', s:keyword)
call s:HL('Directory', s:default)
call s:HL('String', s:green)
call s:HL('Visual', s:default, s:blue)

" The column separating vertically split windows
call s:HL('VertSplit', s:margin_active, s:margin)

" Error messages on the command line
call s:HL('ErrorMsg', s:special, s:back)

" Line number for :number and :# commands
call s:HL('LineNr', s:default, s:back)
call s:HL('CursorLineNr', s:keyword, s:back)

" Tilde (~)
call s:HL('NonText', s:back, s:back)

" Character under cursor
call s:HL('Cursor', s:default, s:cursor)
call s:HL('CursorLine', s:default, s:blue)

call s:HL('Comment', s:comment)
call s:HL('Todo', s:keyword, s:back)

" Generic statement
call s:HL('Statement', s:default)
" if, then, else, endif, swicth, etc.
hi! link Conditional Statement
" for, do, while, etc.
hi! link Repeat Statement
" case, default, etc.
hi! link Label Statement
" try, catch, throw
hi! link Exception Statement
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword Statement

" Variable name
hi! link Identifier Normal
" Function name
hi! link Function Statement

" Generic preprocessor
call s:HL('PreProc', s:default)
" Preprocessor #include
hi! link Include PreProc
" Preprocessor #define
hi! link Define PreProc
" Same as Define
hi! link Macro PreProc
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit PreProc

call s:HL('Constant', s:default)
hi! link Character Constant
hi! link Boolean Constant
hi! link Number Constant
hi! link Float Constant

hi! link Type Statement
hi! link StorageClass Statement
hi! link Structure Statement
hi! link Typedef Statement

" Completion Menu

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:default, s:back)
  " Popup menu: selected item
  hi! link PmenuSel Search
endif


hi! link markdownLinkText Statement
call s:HL('markdownLinkText', s:keyword, s:back, s:underline)
