" Vim Color File
" Name:       monodeep.vim
" Version:    0.1
" Based On: github.com/challenger-deep-theme/vim
" Modified: Heavily Modified challenger_deep theme.
" Note: The structure is directly copied form challenger_deep, but colors are mostly changed.

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='monodeep'
set background=dark

if ! exists("g:monodeep_termcolors")
  let g:monodeep_termcolors = 256
endif

" not all terminals support italics properly.  If yours does, opt-in.
if ! exists("g:monodeep_terminal_italics")
  let g:monodeep_terminal_italics = 0
endif

" Colors
let s:black           = { "gui": "#212121", "cterm": "0", "cterm16" : "8" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243", "cterm16" : "243" }
let s:white           = { "gui": "#F3F3F3", "cterm": "15", "cterm16" : "15" }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231", "cterm16" : "231" }
let s:light_black     = { "gui": "#424242", "cterm": "8", "cterm16" : "0" }
let s:lighter_black   = { "gui": "#545454", "cterm": "240", "cterm16" : "240" }

" lighter shadows and alter grays
let s:subtle_black  = { "gui": "#303030", "cterm": "236", "cterm16" : "236" }
let s:light_gray    = { "gui": "#B2B2B2", "cterm": "249", "cterm16" : "249" }
let s:lighter_gray  = { "gui": "#C6C6C6", "cterm": "251", "cterm16" : "251" }

" flat colors:
let s:asphalt = { "gui": "#1e1c31", "cterm": "233", "cterm16": "NONE"}
let s:asphalt_subtle= { "gui": "#100E23", "cterm": "232", "cterm16": "NONE"}
let s:alt_asphalt = { "gui": "#565575", "cterm": "236", "cterm16": "8"}

let s:color0 = { "gui": "#4281a3", "cterm": "204", "cterm16": "1"}
let s:alt_color0 = { "gui": "#61b1de", "cterm": "203", "cterm16": "9"}

let s:color1 = { "gui": "#6e7888", "cterm": "120", "cterm16": "2"}
let s:alt_color1 = { "gui": "#4c7db5", "cterm": "119", "cterm16": "10"}

let s:color2 = { "gui": "#627899", "cterm": "228", "cterm16": "3"}
let s:alt_color2 = { "gui": "#b7c9eb", "cterm": "215", "cterm16": "11"}

let s:color3 = { "gui": "#6397e5", "cterm": "159", "cterm16": "4"}
let s:alt_color3 = { "gui": "#949dbb", "cterm": "75", "cterm16": "12"}

let s:color4 = { "gui": "#656cc0", "cterm": "141", "cterm16": "5"}
let s:alt_color4 = { "gui": "#7a76aa", "cterm": "135", "cterm16": "13"}

let s:color5 = { "gui": "#b1abe9", "cterm": "122", "cterm16": "6"}
let s:alt_color5 = { "gui": "#9b8de5", "cterm": "121", "cterm16": "14"}

let s:clouds = { "gui": "#cbe3e7", "cterm": "253", "cterm16": "7"}
let s:alt_clouds = { "gui": "#a6b3cc", "cterm": "252", "cterm16": "15"}

let s:bg              = s:asphalt
let s:bg_none         = s:asphalt_subtle
let s:bg_subtle       = s:asphalt_subtle
let s:bg_alt          = s:alt_asphalt
let s:norm            = s:clouds
let s:norm_subtle     = s:alt_clouds
let s:visual          = s:bg_alt

let s:head_a         = s:alt_color5
let s:head_b         = s:alt_color2
let s:head_c         = s:alt_color0
let s:head_d         = s:color4
let s:head_e         = s:color0
let s:head_f         = s:color2


" shamelessly stolen from hemisu: https://github.com/noahfcolor0erick/vim-hemisu/
function! s:h(group, style)
  if g:monodeep_terminal_italics == 0
    " Not all terminals support italics properly. If yours does, opt-in.
    if get(a:style, "cterm", "") == "italic"
      unlet a:style.cterm
    endif
    if get(a:style, "gui", "") == "italic"
      unlet a:style.gui
    endif
  endif
  if g:monodeep_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" common groups ================================================================
" (see `:h w18`)

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Cursor",        {"bg": s:color3, "fg": s:bg_alt})
call s:h("Comment",       {"fg": s:medium_gray, "gui": "italic", "cterm": "italic"})

call s:h("Constant",      {"fg": s:alt_color2})
hi! link String           Constant
hi! link Character        Constant

call s:h("Number",        {"fg": s:color2})
hi! link Boolean          Constant
hi! link Float            Constant

call s:h("Identifier",    {"fg": s:color4})
hi! link Function         Identifier

call s:h("Label",         {"fg": s:alt_color3})
hi! link Conditonal       Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:alt_color5})
hi! link Repeat           Operator

call s:h("PreProc",       {"fg": s:color1})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc


call s:h("Keyword",       {"fg": s:color0})
hi! link Statement        Keyword

call s:h("Type",          {"fg": s:color3})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:color5})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})

call s:h("Error",{"fg":s:alt_color0,"bg":s:bg_none,"gui":"bold","cterm":"bold"})
call s:h("Todo",{"fg":s:alt_color2,"bg":s:bg_subtle,"gui":"bold","cterm":"bold"})

" ui chrome ====================================================================
" ordecolor0 according to `:help hitest.vim`

call s:h("SpecialKey",    {"fg": s:color3})
call s:h("Boolean",       {"fg": s:alt_color2})
call s:h("Number",        {"fg": s:alt_color2})
call s:h("Float",         {"fg": s:alt_color2})
call s:h("NonText",       {"fg": s:bg_alt})
call s:h("Directory",     {"fg": s:color4})
call s:h("ErrorMsg",      {"fg": s:alt_color0})
call s:h("IncSearch",     {"bg": s:color0, "fg": s:clouds})
call s:h("Search",        {"bg": s:bg_alt})
call s:h("MoreMsg",       {"fg": s:medium_gray, "gui": "bold", "cterm": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:alt_asphalt, "bg": s:bg_subtle})
call s:h("CursorLineNr",  {"bg": s:bg_subtle, "fg": s:color3, "gui": "bold"})
call s:h("Question",      {"fg": s:color0})
call s:h("StatusLine",    {"bg": s:bg_alt})
call s:h("Conceal",       {"fg": s:norm})
call s:h("StatusLineNC",  {"bg": s:bg_alt, "fg": s:medium_gray})
call s:h("VertSplit",     {"fg": s:bg_subtle})
call s:h("Title",         {"fg": s:alt_color3})
call s:h("Visual",        {"bg": s:visual})
call s:h("WarningMsg",    {"fg": s:color2})
call s:h("WildMenu",      {"fg": s:bg_subtle, "bg": s:color5})
call s:h("Folded",        {"bg": s:color4, "fg": s:bg_subtle})
call s:h("FoldColumn",    {"fg": s:color2})
call s:h("DiffAdd",       {"fg": s:color1})
call s:h("DiffDelete",    {"fg": s:color0})
call s:h("DiffChange",    {"fg": s:alt_color2})
call s:h("DiffText",      {"fg": s:alt_color3})
call s:h("SignColumn",    {"fg": s:color1})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:alt_color0})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:color1})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:color0})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:alt_color1})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:alt_color0})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:color1})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:color0})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:alt_color1})
endif
call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:bg_alt})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_alt})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_alt})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_alt})
call s:h("TabLineSel",    {"fg": s:norm, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_alt})
call s:h("CursorColumn",  {"bg": s:bg_subtle})
call s:h("CursorLine",    {"bg": s:bg_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

" remainder of syntax highlighting
call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:color4, "gui": "bold", "cterm": "bold"})
call s:h("qfLineNr",      {"fg": s:medium_gray})

" hi helpHyperTextJump guifg=#5FAFD7 ctermfg=74

" HTML syntax
hi! link htmlTag          Special
hi! link htmlEndTag       htmlTag

hi! link htmlTagName      KeyWord
" html5 tags show up as htmlTagN
hi! link htmlTagN         Keyword

" HTML content
call s:h("htmlH1",        {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"     })
call s:h("htmlH2",        {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlH3",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH4",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH5",        {"fg": s:head_c                                            })
call s:h("htmlH6",        {"fg": s:head_c                                            })
call s:h("htmlLink",      {"fg": s:color3  , "gui": "underline"  , "cterm": "underline"})
call s:h("htmlItalic",    {                "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlBold",      {                "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlBoldItalic",{                "gui": "bold,italic", "cterm": "bold"     })
" hi htmlString     guifg=#87875f guibg=NONE gui=NONE        ctermfg=101 ctermbg=NONE cterm=NONE


" tpope/vim-markdown
call s:h("markdownBlockquote",          {"fg": s:norm})
call s:h("markdownBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownBoldItalic",          {"fg": s:norm  , "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownEscape",              {"fg": s:norm})
" call s:h("markdownH1",                  {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"  })
" call s:h("markdownH2",                  {"fg": s:head_b, "gui": "bold"       , "cterm": "bold"  })
" call s:h("markdownH3",                  {"fg": s:head_c, "gui": "italic"     , "cterm": "italic"})
" call s:h("markdownH4",                  {"fg": s:head_d, "gui": "italic"     , "cterm": "italic"})
call s:h("markdownH1",                  {"fg": s:head_a})
call s:h("markdownH2",                  {"fg": s:head_b})
call s:h("markdownH3",                  {"fg": s:head_c})
call s:h("markdownH4",                  {"fg": s:head_d})
call s:h("markdownH5",                  {"fg": s:head_e})
call s:h("markdownH6",                  {"fg": s:head_f})
call s:h("markdownHeadingDelimiter",    {"fg": s:norm})
call s:h("markdownHeadingRule",         {"fg": s:norm})
call s:h("markdownId",                  {"fg": s:medium_gray})
call s:h("markdownIdDeclaration",       {"fg": s:norm_subtle})
call s:h("markdownItalic",              {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})
call s:h("markdownLinkDelimiter",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextDelimiter",   {"fg": s:medium_gray})
call s:h("markdownListMarker",          {"fg": s:norm})
call s:h("markdownOrdecolor0ListMarker",   {"fg": s:norm})
call s:h("markdownRule",                {"fg": s:norm})
call s:h("markdownUrl",                 {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownUrlDelimiter",        {"fg": s:medium_gray})
call s:h("markdownUrlTitle",            {"fg": s:norm})
call s:h("markdownUrlTitleDelimiter",   {"fg": s:medium_gray})
call s:h("markdownCode",                {"fg": s:norm})
call s:h("markdownCodeDelimiter",       {"fg": s:norm})

" plasticboy/vim-markdown
call s:h("mkdBlockQuote",               {"fg": s:norm})
call s:h("mkdDelimiter",                {"fg": s:medium_gray})
call s:h("mkdID",                       {"fg": s:medium_gray})
call s:h("mkdLineContinue",             {"fg": s:norm})
call s:h("mkdLink",                     {"fg": s:norm})
call s:h("mkdLinkDef",                  {"fg": s:medium_gray})
call s:h("mkdListItem",                 {"fg": s:norm})
call s:h("mkdNonListItemBlock",         {"fg": s:norm})  " bug in syntax?
call s:h("mkdRule",                     {"fg": s:norm})
call s:h("mkdUrl",                      {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("mkdCode",                     {"fg": s:norm})
call s:h("mkdIndentCode",               {"fg": s:norm})

" gabrielelana/vim-markdown
call s:h("markdownBlockquoteDelimiter", {"fg": s:norm})
call s:h("markdownInlineDelimiter",     {"fg": s:norm})
call s:h("markdownItemDelimiter",       {"fg": s:norm})
call s:h("markdownLinkReference",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextContainer",   {"fg": s:medium_gray})
call s:h("markdownLinkUrl",             {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownLinkUrlContainer",    {"fg": s:medium_gray})
call s:h("markdownFencedCodeBlock",     {"fg": s:norm})
call s:h("markdownInlineCode",          {"fg": s:norm})

" mattly/vim-markdown-enhancements
call s:h("mmdFootnoteDelimiter",        {"fg": s:medium_gray})
call s:h("mmdFootnoteMarker",           {"fg": s:norm})
call s:h("mmdTableAlign",               {"fg": s:norm})
call s:h("mmdTableDelimiter",           {"fg": s:norm})
call s:h("mmdTableHeadDelimiter",       {"fg": s:norm})
call s:h("mmdTableHeader",              {"fg": s:norm})
call s:h("mmdTableCaptionDelimiter",    {"fg": s:norm})
call s:h("mmdTableCaption",             {"fg": s:norm})

" Textile content
" https://github.com/timcharper/textile.vim/blob/master/syntax/textile.vim
"call s:h("txtBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
"call s:h("txtEmphasis",            {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})

" XML content
hi! link xmlTag                     htmlTag
hi! link xmlEndTag                  xmlTag
hi! link xmlTagName                 htmlTagName

" Signify
call s:h("SignifySignAdd",{"fg": s:color1, "bg": s:bg_subtle})
call s:h("SignifySignDelete",{"fg": s:color0, "bg": s:bg_subtle})
call s:h("SignifySignChange",{"fg": s:color2, "bg": s:bg_subtle})
call s:h("SignifySignDeleteFirstLine",{"fg": s:color0, "bg": s:bg_subtle})

" GitGutter
call s:h("GitGutterAdd",{"fg": s:color1, "bg": s:bg_subtle})
call s:h("GitGutterDelete",{"fg": s:color0, "bg": s:bg_subtle})
call s:h("GitGutterChange",{"fg": s:color2, "bg": s:bg_subtle})
call s:h("GitGutterChangeDelete",{"fg": s:color0, "bg": s:bg_subtle})


"nvim terminal colors
let g:terminal_color_0 = s:bg_alt.gui
let g:terminal_color_1 = s:color0.gui
let g:terminal_color_2 = s:color1.gui
let g:terminal_color_3 = s:color2.gui
let g:terminal_color_4 = s:color3.gui
let g:terminal_color_5 = s:color4.gui
let g:terminal_color_6 = s:color5.gui
let g:terminal_color_7 = s:clouds.gui
let g:terminal_color_8 = s:bg_subtle.gui
let g:terminal_color_9 = s:alt_color0.gui
let g:terminal_color_10 = s:alt_color1.gui
let g:terminal_color_11 = s:alt_color2.gui
let g:terminal_color_12 = s:alt_color3.gui
let g:terminal_color_13 = s:alt_color4.gui
let g:terminal_color_14 = s:alt_color5.gui
let g:terminal_color_15 = s:alt_clouds.gui
