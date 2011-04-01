" Lucius vim color file
" Maintainer: Jonathan Filip <jfilip1024@gmail.com>
" Version: 5.2

hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="lucius"

" Summary:
" Dark, light, and blue color schemes in one file (GUI and 256 color terminal).

" Description:
" This file contains three color schemes that focus on using blues and greens.
"
" The original dark color scheme started out by combining pieces of several
" other color schemes and has evolved into what it is today. Those color
" schemes are:
"
" * oceandeep (vimscript #368)
" * peaksea (vimscript #760)
" * wombat (vimscript #1778)
" * moria (vimscript #1464)
" * zenburn (vimscript #415)
"
" The default color scheme is the original, dark scheme. You can change this by
" setting the g:lucius_style variable to "light", "dark", or "blue". Once the
" color scheme is loaded, you can use the commands "LuciusLight", "LuciusDark",
" and "LuciusBlue" to change schemes quickly.
"
" Screenshots of the different color schemes in a Windows 7 GUI:
"
" * Dark: http://i.imgur.com/z0bDr.png
" * Light: http://i.imgur.com/BXDiv.png
" * Blue: http://i.imgur.com/Ea1Gq.png
"
" colorsupport.vim (vimscript #2682) is used to help with mapping the GUI
" settings to the 256 terminal colors.

" Installation:
" Copy the file to your vim colors directory and then do :colorscheme lucius.

set background=dark
if exists("g:lucius_style")
    if g:lucius_style == "light"
        set background=light
    endif
else
    let g:lucius_style="dark"
endif

if g:lucius_style == "dark"
    hi Normal           guifg=#e0e0e0           guibg=#202020
    hi Normal           ctermfg=253             ctermbg=234

    hi Comment          guifg=#606060                                   gui=none
    hi Comment          ctermfg=240                                     cterm=none

    hi Constant         guifg=#70c0d8                                   gui=none
    hi Constant         ctermfg=74                                      cterm=none
    hi ConstantBold     guifg=#70c0d8                                   gui=bold
    hi ConstantBold     ctermfg=74                                      cterm=bold

    hi Identifier       guifg=#86c6b6                                   gui=none
    hi Identifier       ctermfg=116                                     cterm=none
    hi IdentifierBold   guifg=#86c6b6                                   gui=bold
    hi IdentifierBold   ctermfg=116                                     cterm=bold

    hi Statement        guifg=#b3d38c                                   gui=none
    hi Statement        ctermfg=150                                     cterm=none
    hi StatementBold    guifg=#b3d38c                                   gui=bold
    hi StatementBold    ctermfg=150                                     cterm=bold

    hi PreProc          guifg=#e0e8b0                                   gui=none
    hi PreProc          ctermfg=187                                     cterm=none
    hi PreProcBold      guifg=#e0e8b0                                   gui=bold
    hi PreProcBold      ctermfg=187                                     cterm=bold

    hi Type             guifg=#90d0a0                                   gui=none
    hi Type             ctermfg=115                                     cterm=none
    hi TypeBold         guifg=#90d0a0                                   gui=bold
    hi TypeBold         ctermfg=115                                     cterm=bold

    hi Special          guifg=#b0a0c0                                   gui=none
    hi Special          ctermfg=182                                     cterm=none
    hi SpecialBold      guifg=#b0a0c0                                   gui=bold
    hi SpecialBold      ctermfg=182                                     cterm=bold

    " == Text Markup ==
    " text that stands out, html links
    hi Underlined       guifg=fg                                        gui=underline
    hi Underlined       ctermfg=fg                                      cterm=underline
    " any erroneous construct
    hi Error            guifg=#e37170           guibg=#432323           gui=none
    hi Error            ctermfg=167             ctermbg=236             cterm=none
    " todo, fixme, note, xxx
    hi Todo             guifg=#e0e090           guibg=NONE              gui=underline
    hi Todo             ctermfg=186             ctermbg=NONE            cterm=underline
    " match parenthesis, brackets
    hi MatchParen       guifg=#00ff00           guibg=NONE              gui=bold
    hi MatchParen       ctermfg=46              ctermbg=NONE            cterm=bold
    " the '~' and '@' and showbreak, '>' double wide char doesn't fit on line
    hi NonText          guifg=#404040                                   gui=none
    hi NonText          ctermfg=238                                     cterm=none
    " meta and special keys used with map, unprintable characters
    hi SpecialKey       guifg=#405060
    hi SpecialKey       ctermfg=239
    " titles for output from :set all, :autocmd, etc
    hi Title            guifg=#62bdde                                   gui=none
    hi Title            ctermfg=74                                      cterm=none

    " == Text Selection ==
    " character under the cursor
    hi Cursor           guifg=bg                guibg=#a3e3ed
    hi Cursor           ctermfg=bg              ctermbg=153
    " like cursor, but used when in IME mode
    hi CursorIM         guifg=bg                guibg=#96cdcd
    hi CursorIM         ctermfg=bg              ctermbg=116
    " cursor column
    hi CursorColumn     guifg=NONE              guibg=#404448           gui=none
    hi CursorColumn     ctermfg=NONE            ctermbg=236             cterm=none
    " cursor line/row
    hi CursorLine       guifg=NONE              guibg=#404448           gui=none
    hi CursorLine       ctermfg=NONE            ctermbg=236             cterm=none
    " visual mode selection
    hi Visual           guifg=NONE              guibg=#364458
    hi Visual           ctermfg=NONE            ctermbg=24
    " visual mode selection when vim is not owning the selection (x11 only)
    hi VisualNOS        guifg=fg                                        gui=underline
    hi VisualNOS        ctermfg=fg                                      cterm=underline
    " highlight incremental search text; also highlight text replaced with :s///c
    hi IncSearch        guifg=#66ffff                                   gui=reverse
    hi IncSearch        ctermfg=87                                      cterm=reverse
    " hlsearch (last search pattern), also used for quickfix
    hi Search                                    guibg=#ffaa33          gui=none
    hi Search                                    ctermbg=214            cterm=none

    " == UI ==
    " normal item in popup
    hi Pmenu            guifg=#e0e0e0           guibg=#303840           gui=none
    hi Pmenu            ctermfg=253             ctermbg=233             cterm=none
    " selected item in popup
    hi PmenuSel         guifg=#cae682           guibg=#505860           gui=none
    hi PmenuSel         ctermfg=186             ctermbg=237             cterm=none
    " scrollbar in popup
    hi PMenuSbar                                guibg=#505860           gui=none
    hi PMenuSbar                                ctermbg=59              cterm=none
    " thumb of the scrollbar in the popup
    hi PMenuThumb                               guibg=#808890           gui=none
    hi PMenuThumb                               ctermbg=102             cterm=none
    " status line for current window
    hi StatusLine       guifg=#e0e0e0           guibg=#363946           gui=bold
    hi StatusLine       ctermfg=254             ctermbg=237             cterm=bold
    " status line for non-current windows
    hi StatusLineNC     guifg=#767986           guibg=#363946           gui=none
    hi StatusLineNC     ctermfg=244             ctermbg=237             cterm=none
    " tab pages line, not active tab page label
    hi TabLine          guifg=#b6bf98           guibg=#363946           gui=none
    hi TabLine          ctermfg=244             ctermbg=236             cterm=none
    " tab pages line, where there are no labels
    hi TabLineFill      guifg=#cfcfaf           guibg=#363946           gui=none
    hi TabLineFill      ctermfg=187             ctermbg=236             cterm=none
    " tab pages line, active tab page label
    hi TabLineSel       guifg=#efefef           guibg=#414658           gui=bold
    hi TabLineSel       ctermfg=254             ctermbg=236             cterm=bold
    " column separating vertically split windows
    hi VertSplit        guifg=#777777           guibg=#363946           gui=none
    hi VertSplit        ctermfg=243             ctermbg=237             cterm=none
    " line used for closed folds
    hi Folded           guifg=#d0e0f0           guibg=#202020           gui=none
    hi Folded           ctermfg=117             ctermbg=235             cterm=none
    " column on side used to indicated open and closed folds
    hi FoldColumn       guifg=#c0c0d0           guibg=#363946           gui=none
    hi FoldColumn       ctermfg=117             ctermbg=238             cterm=none

    " == Spelling ==
    " word not recognized
    hi SpellBad         guisp=#ee0000                                   gui=undercurl
    hi SpellBad                                 ctermbg=196             cterm=undercurl
    " word not capitalized
    hi SpellCap         guisp=#eeee00                                   gui=undercurl
    hi SpellCap                                 ctermbg=226             cterm=undercurl
    " rare word
    hi SpellRare        guisp=#ffa500                                   gui=undercurl
    hi SpellRare                                ctermbg=214             cterm=undercurl
    " wrong spelling for selected region
    hi SpellLocal       guisp=#ffa500                                   gui=undercurl
    hi SpellLocal                               ctermbg=214             cterm=undercurl

    " == Diff ==
    " added line
    hi DiffAdd          guifg=#80a090           guibg=#313c36           gui=none
    hi DiffAdd          ctermfg=fg              ctermbg=22              cterm=none
    " changed line
    hi DiffChange       guifg=NONE              guibg=#4a343a           gui=none
    hi DiffChange       ctermfg=fg              ctermbg=52              cterm=none
    " deleted line
    hi DiffDelete       guifg=#6c6661           guibg=#3c3631           gui=none
    hi DiffDelete       ctermfg=fg              ctermbg=58              cterm=none
    " changed text within line
    hi DiffText         guifg=#f05060           guibg=#4a343a           gui=bold
    hi DiffText         ctermfg=203             ctermbg=52              cterm=bold

    " == Misc ==
    " directory names and other special names in listings
    hi Directory        guifg=#c0e0b0                                   gui=none
    hi Directory        ctermfg=151                                     cterm=none
    " error messages on the command line
    hi ErrorMsg         guifg=#ee0000           guibg=NONE              gui=none
    hi ErrorMsg         ctermfg=196             ctermbg=NONE            cterm=none
    " columns where signs are displayed (used in IDEs)
    hi SignColumn       guifg=#9fafaf           guibg=#181818           gui=none
    hi SignColumn       ctermfg=145             ctermbg=233             cterm=none
    " line numbers
    hi LineNr           guifg=#818698           guibg=#363946
    hi LineNr           ctermfg=245             ctermbg=237
    " the 'more' prompt when output takes more than one line
    hi MoreMsg          guifg=#2e8b57                                   gui=none
    hi MoreMsg          ctermfg=29                                      cterm=none
    " text showing what mode you are in
    hi ModeMsg          guifg=#76d5f8           guibg=NONE              gui=none
    hi ModeMsg          ctermfg=117             ctermbg=NONE            cterm=none
    " the hit-enter prompt (show more output) and yes/no questions
    hi Question         guifg=fg                                        gui=none
    hi Question         ctermfg=fg                                      cterm=none
    " warning messages
    hi WarningMsg       guifg=#e5786d                                   gui=none
    hi WarningMsg       ctermfg=173                                     cterm=none
    " current match in the wildmenu completion
    hi WildMenu         guifg=#cae682           guibg=#363946           gui=bold,underline
    hi WildMenu         ctermfg=16              ctermbg=186             cterm=bold
    " color column highlighting
    hi ColorColumn      guifg=NONE              guibg=#403630           gui=none
    hi ColorColumn      ctermfg=NONE            ctermbg=95              cterm=none
    " left blank, hidden
    hi Ignore           guifg=bg
    hi Ignore           ctermfg=bg

elseif g:lucius_style == "light"
    hi Normal           guifg=#000000           guibg=#ffffff
    hi Normal           ctermfg=16              ctermbg=231

    hi Comment          guifg=#909090                                   gui=none
    hi Comment          ctermfg=246                                     cterm=none

    hi Constant         guifg=#008000                                   gui=none
    hi Constant         ctermfg=28                                      cterm=none
    hi ConstantBold     guifg=#008000                                   gui=bold
    hi ConstantBold     ctermfg=28                                      cterm=bold

    hi Identifier       guifg=#008898                                   gui=none
    hi Identifier       ctermfg=30                                      cterm=none
    hi IdentifierBold   guifg=#008898                                   gui=bold
    hi IdentifierBold   ctermfg=30                                      cterm=bold

    hi Statement        guifg=#0050b0                                   gui=none
    hi Statement        ctermfg=25                                      cterm=none
    hi StatementBold    guifg=#0050b0                                   gui=bold
    hi StatementBold    ctermfg=25                                      cterm=bold

    hi PreProc          guifg=#b07000                                   gui=none
    hi PreProc          ctermfg=130                                     cterm=none
    hi PreProcBold      guifg=#b07000                                   gui=bold
    hi PreProcBold      ctermfg=130                                     cterm=bold

    hi Type             guifg=#0070a0                                   gui=none
    hi Type             ctermfg=25                                      cterm=none
    hi TypeBold         guifg=#0070a0                                   gui=bold
    hi TypeBold         ctermfg=25                                      cterm=bold

    hi Special          guifg=#703080                                   gui=none
    hi Special          ctermfg=5                                       cterm=none
    hi SpecialBold      guifg=#703080                                   gui=bold
    hi SpecialBold      ctermfg=5                                       cterm=bold

    " == Text Markup ==
    " text that stands out, html links
    hi Underlined       guifg=fg                                        gui=underline
    hi Underlined       ctermfg=fg                                      cterm=underline
    " any erroneous construct
    hi Error            guifg=#c02020           guibg=#e0b0b0           gui=none
    hi Error            ctermfg=1               ctermbg=181             cterm=none
    " todo, fixme, note, xxx
    hi Todo             guifg=#504000           guibg=#fff880           gui=underline
    hi Todo             ctermfg=58              ctermbg=228             cterm=underline
    " match parenthesis, brackets
    hi MatchParen       guifg=NONE              guibg=#a0f0b0           gui=none
    hi MatchParen       ctermfg=NONE            ctermbg=157             cterm=bold
    " the '~' and '@' and showbreak, '>' double wide char doesn't fit on line
    hi NonText          guifg=#b0c0d0                                   gui=none
    hi NonText          ctermfg=146                                     cterm=none
    " meta and special keys used with map, unprintable characters
    hi SpecialKey       guifg=#b0d0c0
    hi SpecialKey       ctermfg=151
    " titles for output from :set all, :autocmd, etc
    hi Title            guifg=#0080e0                                   gui=bold
    hi Title            ctermfg=32                                      cterm=bold

    " == Text Selection ==
    " character under the cursor
    hi Cursor           guifg=bg                guibg=#406090
    hi Cursor           ctermfg=bg              ctermbg=4 
    " like cursor, but used when in IME mode
    hi CursorIM         guifg=bg                guibg=#96cdcd
    hi CursorIM         ctermfg=bg              ctermbg=116
    " cursor column
    hi CursorColumn     guifg=NONE              guibg=#e8e8e8           gui=none
    hi CursorColumn     ctermfg=NONE            ctermbg=254             cterm=none
    " cursor line/row
    hi CursorLine       guifg=NONE              guibg=#e8e8e8           gui=none
    hi CursorLine       ctermfg=NONE            ctermbg=254             cterm=none
    " visual mode selection
    hi Visual           guifg=NONE              guibg=#d0e0f0
    hi Visual           ctermfg=NONE            ctermbg=153
    " visual mode selection when vim is not owning the selection (x11 only)
    hi VisualNOS        guifg=fg                                        gui=underline
    hi VisualNOS        ctermfg=fg                                      cterm=underline
    " highlight incremental search text; also highlight text replaced with :s///c
    hi IncSearch        guifg=NONE              guibg=#a0e0e0           gui=none
    hi IncSearch        ctermfg=NONE            ctermbg=152             cterm=none
    " hlsearch (last search pattern), also used for quickfix
    hi Search                                   guibg=#f0b060           gui=none
    hi Search                                   ctermbg=215             cterm=none

    " == UI ==
    " normal item in popup
    hi Pmenu            guifg=#000000           guibg=#e0e8f0           gui=none
    hi Pmenu            ctermfg=NONE            ctermbg=254             cterm=none
    " selected item in popup
    hi PmenuSel         guifg=#003050           guibg=#a0c0e0           gui=none
    hi PmenuSel         ctermfg=23              ctermbg=251             cterm=none
    " scrollbar in popup
    hi PMenuSbar                                guibg=#d0d8e0           gui=none
    hi PMenuSbar                                ctermbg=188             cterm=none
    " thumb of the scrollbar in the popup
    hi PMenuThumb                               guibg=#a0a8c0           gui=none
    hi PMenuThumb                               ctermbg=145             cterm=none
    " status line for current window
    hi StatusLine       guifg=#000000           guibg=#90b0d0           gui=bold
    hi StatusLine       ctermfg=16              ctermbg=110             cterm=bold
    " status line for non-current windows
    hi StatusLineNC     guifg=#305070           guibg=#90b0d0           gui=none
    hi StatusLineNC     ctermfg=239             ctermbg=110             cterm=none
    " tab pages line, not active tab page label
    hi TabLine          guifg=#000000           guibg=#90b0d0           gui=none
    hi TabLine          ctermfg=16              ctermbg=110             cterm=none
    " tab pages line, where there are no labels
    hi TabLineFill      guifg=#606060           guibg=#90b0d0           gui=none
    hi TabLineFill      ctermfg=59              ctermbg=110             cterm=none
    " tab pages line, active tab page label
    hi TabLineSel       guifg=#007090           guibg=#90b0d0           gui=bold
    hi TabLineSel       ctermfg=24              ctermbg=110             cterm=bold
    " column separating vertically split windows
    hi VertSplit        guifg=#708090           guibg=#90b0d0           gui=none
    hi VertSplit        ctermfg=66              ctermbg=110             cterm=none
    " line used for closed folds
    hi Folded           guifg=#004080           guibg=#d0e0e0           gui=none
    hi Folded           ctermfg=24              ctermbg=253             cterm=none
    " column on side used to indicated open and closed folds
    hi FoldColumn       guifg=#004080           guibg=#d0e0e0           gui=none
    hi FoldColumn       ctermfg=24              ctermbg=253             cterm=none

    " == Spelling ==
    " word not recognized
    hi SpellBad         guisp=#ee0000                                   gui=undercurl
    hi SpellBad                                 ctermbg=210             cterm=undercurl
    " word not capitalized
    hi SpellCap         guisp=#eeee00                                   gui=undercurl
    hi SpellCap                                 ctermbg=227             cterm=undercurl
    " rare word
    hi SpellRare        guisp=#ffa500                                   gui=undercurl
    hi SpellRare                                ctermbg=221             cterm=undercurl
    " wrong spelling for selected region
    hi SpellLocal       guisp=#ffa500                                   gui=undercurl
    hi SpellLocal                               ctermbg=221             cterm=undercurl

    " == Diff ==
    " added line
    hi DiffAdd          guifg=#205020           guibg=#a0d0a0           gui=none
    hi DiffAdd          ctermfg=fg              ctermbg=151             cterm=none
    " changed line
    hi DiffChange       guifg=#000000           guibg=#d0a0a0           gui=none
    hi DiffChange       ctermfg=fg              ctermbg=181             cterm=none
    " deleted line
    hi DiffDelete       guifg=#606060           guibg=#d0c0a0           gui=none
    hi DiffDelete       ctermfg=fg              ctermbg=181             cterm=none
    " changed text within line
    hi DiffText         guifg=#a04040           guibg=#d0a0a0           gui=bold
    hi DiffText         ctermfg=131             ctermbg=181             cterm=bold

    " == Misc ==
    " directory names and other special names in listings
    hi Directory        guifg=#00a080                                   gui=none
    hi Directory        ctermfg=36                                      cterm=none
    " error messages on the command line
    hi ErrorMsg         guifg=#aa0000           guibg=NONE              gui=none
    hi ErrorMsg         ctermfg=124             ctermbg=NONE            cterm=none
    " columns where signs are displayed (used in IDEs)
    hi SignColumn       guifg=#708090           guibg=#f8f8f8           gui=none
    hi SignColumn       ctermfg=66              ctermbg=231             cterm=none
    " line numbers
    hi LineNr           guifg=#2060a0           guibg=#90b0d0
    hi LineNr           ctermfg=4               ctermbg=110
    " the 'more' prompt when output takes more than one line
    hi MoreMsg          guifg=#209020                                   gui=none
    hi MoreMsg          ctermfg=28                                      cterm=none
    " text showing what mode you are in
    hi ModeMsg          guifg=#2060c0           guibg=NONE              gui=none
    hi ModeMsg          ctermfg=4               ctermbg=NONE            cterm=none
    " the hit-enter prompt (show more output) and yes/no questions
    hi Question         guifg=fg                                        gui=none
    hi Question         ctermfg=fg                                      cterm=none
    " warning messages
    hi WarningMsg       guifg=#e06020                                   gui=none
    hi WarningMsg       ctermfg=166                                     cterm=none
    " current match in the wildmenu completion
    hi WildMenu         guifg=#000000           guibg=#a0f0b0           gui=bold
    hi WildMenu         ctermfg=24              ctermbg=110             cterm=bold
    " color column highlighting
    hi ColorColumn      guifg=NONE              guibg=#f0f0e0           gui=none
    hi ColorColumn      ctermfg=NONE            ctermbg=224             cterm=none
    " left blank, hidden
    hi Ignore           guifg=bg
    hi Ignore           ctermfg=bg

elseif g:lucius_style == "blue"
    hi Normal           guifg=#e0e0e0           guibg=#102030
    hi Normal           ctermfg=253             ctermbg=234

    hi Comment          guifg=#506070                                   gui=none
    hi Comment          ctermfg=59                                      cterm=none

    hi Constant         guifg=#90d0a0                                   gui=none
    hi Constant         ctermfg=115                                     cterm=none
    hi ConstantBold     guifg=#90d0a0                                   gui=bold
    hi ConstantBold     ctermfg=115                                     cterm=bold

    hi Identifier       guifg=#a0d0c0                                   gui=none
    hi Identifier       ctermfg=151                                     cterm=none
    hi IdentifierBold   guifg=#a0d0c0                                   gui=bold
    hi IdentifierBold   ctermfg=151                                     cterm=bold

    hi Statement        guifg=#90d0e0                                   gui=none
    hi Statement        ctermfg=117                                     cterm=none
    hi StatementBold    guifg=#b3d38c                                   gui=bold
    hi StatementBold    ctermfg=117                                     cterm=bold

    hi PreProc          guifg=#e0e0b0                                   gui=none
    hi PreProc          ctermfg=187                                     cterm=none
    hi PreProcBold      guifg=#d0d0a0                                   gui=bold
    hi PreProcBold      ctermfg=187                                     cterm=bold

    hi Type             guifg=#90d0d0                                   gui=none
    hi Type             ctermfg=116                                     cterm=none
    hi TypeBold         guifg=#80c0c0                                   gui=bold
    hi TypeBold         ctermfg=116                                     cterm=bold

    hi Special          guifg=#b0b0d0                                   gui=none
    hi Special          ctermfg=146                                     cterm=none
    hi SpecialBold      guifg=#a0a0c0                                   gui=bold
    hi SpecialBold      ctermfg=146                                     cterm=bold

    " == Text Markup ==
    " text that stands out, html links
    hi Underlined       guifg=fg                                        gui=underline
    hi Underlined       ctermfg=fg                                      cterm=underline
    " any erroneous construct
    hi Error            guifg=#e07078           guibg=#402028           gui=none
    hi Error            ctermfg=167             ctermbg=52              cterm=none
    " todo, fixme, note, xxx
    hi Todo             guifg=#e0e090           guibg=#505000           gui=underline
    hi Todo             ctermfg=186             ctermbg=58              cterm=underline
    " match parenthesis, brackets
    hi MatchParen       guifg=#00ff00           guibg=NONE              gui=bold
    hi MatchParen       ctermfg=46              ctermbg=NONE            cterm=bold
    " the '~' and '@' and showbreak, '>' double wide char doesn't fit on line
    hi NonText          guifg=#406050                                   gui=none
    hi NonText          ctermfg=238                                     cterm=none
    " meta and special keys used with map, unprintable characters
    hi SpecialKey       guifg=#505050
    hi SpecialKey       ctermfg=239
    " titles for output from :set all, :autocmd, etc
    hi Title            guifg=#00e0a0                                   gui=none
    hi Title            ctermfg=43                                      cterm=none

    " == Text Selection ==
    " character under the cursor
    hi Cursor           guifg=bg                guibg=#a0e0f0
    hi Cursor           ctermfg=bg              ctermbg=153
    " like cursor, but used when in IME mode
    hi CursorIM         guifg=bg                guibg=#90c0c0
    hi CursorIM         ctermfg=bg              ctermbg=116
    " cursor column
    hi CursorColumn     guifg=NONE              guibg=#283848           gui=none
    hi CursorColumn     ctermfg=NONE            ctermbg=236             cterm=none
    " cursor line/row
    hi CursorLine       guifg=NONE              guibg=#283848           gui=none
    hi CursorLine       ctermfg=NONE            ctermbg=236             cterm=none
    " visual mode selection
    hi Visual           guifg=NONE              guibg=#204050
    hi Visual           ctermfg=NONE            ctermbg=24
    " visual mode selection when vim is not owning the selection (x11 only)
    hi VisualNOS        guifg=fg                                        gui=underline
    hi VisualNOS        ctermfg=fg                                      cterm=underline
    " highlight incremental search text; also highlight text replaced with :s///c
    hi IncSearch        guifg=#60f0f0                                   gui=reverse
    hi IncSearch        ctermfg=87                                      cterm=reverse
    " hlsearch (last search pattern), also used for quickfix
    hi Search                                    guibg=#f0b030          gui=none
    hi Search           ctermfg=0                ctermbg=214            cterm=none

    " == UI ==
    " normal item in popup
    hi Pmenu            guifg=#e0e0e0           guibg=#305060           gui=none
    hi Pmenu            ctermfg=253             ctermbg=233             cterm=none
    " selected item in popup
    hi PmenuSel         guifg=#80f0b0           guibg=#406070           gui=none
    hi PmenuSel         ctermfg=186             ctermbg=237             cterm=none
    " scrollbar in popup
    hi PMenuSbar                                guibg=#406070           gui=none
    hi PMenuSbar                                ctermbg=59              cterm=none
    " thumb of the scrollbar in the popup 
    hi PMenuThumb                               guibg=#4090a0           gui=none
    hi PMenuThumb                               ctermbg=102             cterm=none
    " status line for current window
    hi StatusLine       guifg=#e0e0e0           guibg=#405060           gui=bold
    hi StatusLine       ctermfg=254             ctermbg=237             cterm=bold
    " status line for non-current windows
    hi StatusLineNC     guifg=#8090a0           guibg=#405060           gui=none
    hi StatusLineNC     ctermfg=244             ctermbg=237             cterm=none
    " tab pages line, not active tab page label
    hi TabLine          guifg=#b6bf98           guibg=#405060           gui=none
    hi TabLine          ctermfg=244             ctermbg=236             cterm=none
    " tab pages line, where there are no labels
    hi TabLineFill      guifg=#cfcfaf           guibg=#405060           gui=none
    hi TabLineFill      ctermfg=187             ctermbg=236             cterm=none
    " tab pages line, active tab page label
    hi TabLineSel       guifg=#efefef           guibg=#405060           gui=bold
    hi TabLineSel       ctermfg=254             ctermbg=236             cterm=bold
    " column separating vertically split windows
    hi VertSplit        guifg=#8090a0           guibg=#405060           gui=none
    hi VertSplit        ctermfg=242             ctermbg=237             cterm=none
    " line used for closed folds
    hi Folded           guifg=#d0e0f0           guibg=#102030           gui=none
    hi Folded           ctermfg=117             ctermbg=235             cterm=none
    " column on side used to indicated open and closed folds
    hi FoldColumn       guifg=#c0c0d0           guibg=#405060           gui=none
    hi FoldColumn       ctermfg=117             ctermbg=238             cterm=none

    " == Spelling ==
    " word not recognized
    hi SpellBad         guisp=#ee0000                                   gui=undercurl
    hi SpellBad                                 ctermbg=196             cterm=undercurl
    " word not capitalized
    hi SpellCap         guisp=#eeee00                                   gui=undercurl
    hi SpellCap                                 ctermbg=226             cterm=undercurl
    " rare word
    hi SpellRare        guisp=#ffa500                                   gui=undercurl
    hi SpellRare                                ctermbg=214             cterm=undercurl
    " wrong spelling for selected region
    hi SpellLocal       guisp=#ffa500                                   gui=undercurl
    hi SpellLocal                               ctermbg=214             cterm=undercurl

    " == Diff ==
    " added line
    hi DiffAdd          guifg=#80a090           guibg=#313c36           gui=none
    hi DiffAdd          ctermfg=fg              ctermbg=22              cterm=none
    " changed line
    hi DiffChange       guifg=NONE              guibg=#4a343a           gui=none
    hi DiffChange       ctermfg=fg              ctermbg=52              cterm=none
    " deleted line
    hi DiffDelete       guifg=#6c6661           guibg=#3c3631           gui=none
    hi DiffDelete       ctermfg=fg              ctermbg=58              cterm=none
    " changed text within line
    hi DiffText         guifg=#f05060           guibg=#4a343a           gui=bold
    hi DiffText         ctermfg=203             ctermbg=52              cterm=bold

    " == Misc ==
    " directory names and other special names in listings
    hi Directory        guifg=#c0e0b0                                   gui=none
    hi Directory        ctermfg=151                                     cterm=none
    " error messages on the command line
    hi ErrorMsg         guifg=#ee0000           guibg=NONE              gui=none
    hi ErrorMsg         ctermfg=196             ctermbg=NONE            cterm=none
    " columns where signs are displayed (used in IDEs)
    hi SignColumn       guifg=#9fafaf           guibg=#102030           gui=none
    hi SignColumn       ctermfg=145             ctermbg=233             cterm=none
    " line numbers
    hi LineNr           guifg=#a0b0c0           guibg=#405060
    hi LineNr           ctermfg=245             ctermbg=237
    " the 'more' prompt when output takes more than one line
    hi MoreMsg          guifg=#2e8b57                                   gui=none
    hi MoreMsg          ctermfg=29                                      cterm=none
    " text showing what mode you are in
    hi ModeMsg          guifg=#76d5f8           guibg=NONE              gui=none
    hi ModeMsg          ctermfg=117             ctermbg=NONE            cterm=none
    " the hit-enter prompt (show more output) and yes/no questions
    hi Question         guifg=fg                                        gui=none
    hi Question         ctermfg=fg                                      cterm=none
    " warning messages
    hi WarningMsg       guifg=#e5786d                                   gui=none
    hi WarningMsg       ctermfg=173                                     cterm=none
    " current match in the wildmenu completion
    hi WildMenu         guifg=#cae682           guibg=#405060           gui=bold,underline
    hi WildMenu         ctermfg=16              ctermbg=186             cterm=bold
    " color column highlighting
    hi ColorColumn      guifg=NONE              guibg=#403040           gui=none
    hi ColorColumn      ctermfg=NONE            ctermbg=95              cterm=none
    " left blank, hidden
    hi Ignore           guifg=bg
    hi Ignore           ctermfg=bg

endif

" == Vimwiki Colors ==
hi link VimwikiHeader1 PreProcBold
hi link VimwikiHeader2 ConstantBold
hi link VimwikiHeader3 StatementBold
hi link VimwikiHeader4 IdentifierBold
hi link VimwikiHeader5 SpecialBold
hi link VimwikiHeader6 TypeBold

" == Commands ==
command! LuciusLight let g:lucius_style = "light" | colorscheme lucius
command! LuciusDark let g:lucius_style = "dark" | colorscheme lucius
command! LuciusBlue let g:lucius_style = "blue" | colorscheme lucius
