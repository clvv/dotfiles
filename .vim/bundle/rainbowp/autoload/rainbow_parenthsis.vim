"------------------------------------------------------------------------------
"  Description: Rainbow colors for parenthsis
"          $Id: rainbow_parenthsis.vim 50 2007-10-08 18:42:51Z krischik@users.sourceforge.net $
"    Copyright: Copyright (C) 2007 Martin Krischik
"   Maintainer: Martin Krischik (krischik@users.sourceforge.net)
"               John Gilmore
"               Luc Hermitte (hermitte@free.fr)
"      $Author: krischik@users.sourceforge.net $
"        $Date: 2007-10-08 20:42:51 +0200 (Mo, 08 Okt 2007) $
"      Version: 4.0
"    $Revision: 50 $
"     $HeadURL: https://vim-scripts.googlecode.com/svn/trunk/1561%20Rainbow%20Parenthsis%20Bundle/autoload/rainbow_parenthsis.vim $
"      History: 24.05.2006 MK Unified Headers
"               15.10.2006 MK Bram's suggestion for runtime integration
"               06.09.2007 LH Buffer friendly (can be used in different buffers),
"                             can be toggled
"               09.09.2007 MK Use on LH's suggestion but use autoload to
"                             impove memory consumtion and startup performance
"               09.10.2007 MK Now with round, square brackets, curly and angle
"                             brackets.
"        Usage: copy to autoload directory.
"------------------------------------------------------------------------------
" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parens in different colors, to make
" it visually obvious what matches which.
"
" Obviously, most useful when working with lisp or Ada. But it's also nice other
" times.
"------------------------------------------------------------------------------

" Section: highlight {{{1

function rainbow_parenthsis#Activate()
    if &background == "dark"
        highlight default level1c ctermfg=yellow      guifg=orange1
        highlight default level2c ctermfg=green       guifg=yellow1
        highlight default level3c ctermfg=cyan        guifg=greenyellow
        highlight default level4c ctermfg=magenta     guifg=green1
        highlight default level5c ctermfg=red         guifg=springgreen1
        highlight default level6c ctermfg=yellow      guifg=cyan1
        highlight default level7c ctermfg=green       guifg=slateblue1
        highlight default level8c ctermfg=cyan        guifg=magenta1
        highlight default level9c ctermfg=magenta     guifg=purple1
        highlight default level10c ctermfg=red         guifg=springgreen1
        highlight default level11c ctermfg=yellow      guifg=cyan1
        highlight default level12c ctermfg=green       guifg=slateblue1
        highlight default level13c ctermfg=cyan        guifg=magenta1
        highlight default level14c ctermfg=magenta     guifg=purple1
        highlight default level15c ctermfg=yellow      guifg=orange1
        highlight default level16c ctermfg=red         guifg=springgreen1
    else
        highlight default level1c ctermfg=darkyellow  guifg=orangered3
        highlight default level2c ctermfg=darkgreen   guifg=orange2
        highlight default level3c ctermfg=blue        guifg=yellow3
        highlight default level4c ctermfg=darkmagenta guifg=olivedrab4
        highlight default level5c ctermfg=red         guifg=green4
        highlight default level6c ctermfg=darkyellow  guifg=paleturquoise3
        highlight default level7c ctermfg=darkgreen   guifg=deepskyblue4
        highlight default level8c ctermfg=blue        guifg=darkslateblue
        highlight default level9c ctermfg=darkmagenta guifg=darkviolet
        highlight default level10c ctermfg=red         guifg=green4
        highlight default level11c ctermfg=darkyellow  guifg=paleturquoise3
        highlight default level12c ctermfg=darkgreen   guifg=deepskyblue4
        highlight default level13c ctermfg=blue        guifg=darkslateblue
        highlight default level14c ctermfg=darkmagenta guifg=darkviolet
        highlight default level15c ctermfg=darkyellow  guifg=orangered3
        highlight default level16c ctermfg=red         guifg=green4
    endif
    let rainbow_parenthesis#active = 1
endfunction

function rainbow_parenthsis#Clear()
    let i = 0
    while i != 16
        let i = i + 1
        exe 'highlight clear level' . i . 'c'
    endwhile
    let rainbow_parenthesis#active = 0
endfunction

function rainbow_parenthsis#Toggle ()
    if ! exists('rainbow_parenthesis#active')
        call rainbow_parenthsis#LoadRound ()
    endif
    if rainbow_parenthesis#active != 0
        call rainbow_parenthsis#Clear ()
    else
        call rainbow_parenthsis#Activate ()
    endif
endfunction

" Section: syntax {{{1
"
" Subsection: parentheses or round brackets: {{{2
"
function rainbow_parenthsis#LoadRound ()
    syn match   Quote "\('\|`\)"
    syn match   Unquote "\(\~@\|\~\)"
    syn match   Dispatch "\(#^\|#'\)"
    syn cluster LISPTop contains=TOP,Quote,Unquote,Dispatch
      syntax region level1 matchgroup=level1c start="(" end=")" contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level2 matchgroup=level2c start="(" end=")" contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level3 matchgroup=level3c start="(" end=")" contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level4 matchgroup=level4c start="(" end=")" contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level5 matchgroup=level5c start="(" end=")" contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level6 matchgroup=level6c start="(" end=")" contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level7 matchgroup=level7c start="(" end=")" contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level8 matchgroup=level8c start="(" end=")" contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
      syntax region level9 matchgroup=level9c start="(" end=")" contains=TOP,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level10 matchgroup=level10c start="(" end=")" contains=TOP,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level11 matchgroup=level11c start="(" end=")" contains=TOP,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level12 matchgroup=level12c start="(" end=")" contains=TOP,level12,level13,level14,level15,level16,NoInParens
    syntax region level13 matchgroup=level13c start="(" end=")" contains=TOP,level13,level14,level15,level16,NoInParens
    syntax region level14 matchgroup=level14c start="(" end=")" contains=TOP,level14,level15,level16,NoInParens
    syntax region level15 matchgroup=level15c start="(" end=")" contains=TOP,level15,level16,NoInParens
    syntax region level16 matchgroup=level16c start="(" end=")" contains=TOP,level16,NoInParens
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: box brackets or square brackets: {{{2
"
function rainbow_parenthsis#LoadSquare ()
    syntax region level1 matchgroup=level1c start=/\[/ end=/\]/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level2 matchgroup=level2c start=/\[/ end=/\]/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level3 matchgroup=level3c start=/\[/ end=/\]/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level4 matchgroup=level4c start=/\[/ end=/\]/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level5 matchgroup=level5c start=/\[/ end=/\]/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level6 matchgroup=level6c start=/\[/ end=/\]/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level7 matchgroup=level7c start=/\[/ end=/\]/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level8 matchgroup=level8c start=/\[/ end=/\]/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level9 matchgroup=level9c start=/\[/ end=/\]/ contains=TOP,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level10 matchgroup=level10c start=/\[/ end=/\]/ contains=TOP,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level11 matchgroup=level11c start=/\[/ end=/\]/ contains=TOP,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level12 matchgroup=level12c start=/\[/ end=/\]/ contains=TOP,level12,level13,level14,level15,level16,NoInParens
    syntax region level13 matchgroup=level13c start=/\[/ end=/\]/ contains=TOP,level13,level14,level15,level16,NoInParens
    syntax region level14 matchgroup=level14c start=/\[/ end=/\]/ contains=TOP,level14,level15,level16,NoInParens
    syntax region level15 matchgroup=level15c start=/\[/ end=/\]/ contains=TOP,level15,level16,NoInParens
    syntax region level16 matchgroup=level16c start=/\[/ end=/\]/ contains=TOP,level16,NoInParens
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: curly brackets or braces: {{{2
"
function rainbow_parenthsis#LoadBraces ()
    syntax region level1 matchgroup=level1c start=/{/ end=/}/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level2 matchgroup=level2c start=/{/ end=/}/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level3 matchgroup=level3c start=/{/ end=/}/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level4 matchgroup=level4c start=/{/ end=/}/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level5 matchgroup=level5c start=/{/ end=/}/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level6 matchgroup=level6c start=/{/ end=/}/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level7 matchgroup=level7c start=/{/ end=/}/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level8 matchgroup=level8c start=/{/ end=/}/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level9 matchgroup=level9c start=/{/ end=/}/ contains=TOP,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level10 matchgroup=level10c start=/{/ end=/}/ contains=TOP,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level11 matchgroup=level11c start=/{/ end=/}/ contains=TOP,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level12 matchgroup=level12c start=/{/ end=/}/ contains=TOP,level12,level13,level14,level15,level16,NoInParens
    syntax region level13 matchgroup=level13c start=/{/ end=/}/ contains=TOP,level13,level14,level15,level16,NoInParens
    syntax region level14 matchgroup=level14c start=/{/ end=/}/ contains=TOP,level14,level15,level16,NoInParens
    syntax region level15 matchgroup=level15c start=/{/ end=/}/ contains=TOP,level15,level16,NoInParens
    syntax region level16 matchgroup=level16c start=/{/ end=/}/ contains=TOP,level16,NoInParens
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: angle brackets or chevrons: {{{2
"
function rainbow_parenthsis#LoadChevrons ()
    syntax region level1 matchgroup=level1c start=/</ end=/>/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level2 matchgroup=level2c start=/</ end=/>/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level3 matchgroup=level3c start=/</ end=/>/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level4 matchgroup=level4c start=/</ end=/>/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level5 matchgroup=level5c start=/</ end=/>/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level6 matchgroup=level6c start=/</ end=/>/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level7 matchgroup=level7c start=/</ end=/>/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level8 matchgroup=level8c start=/</ end=/>/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level9 matchgroup=level9c start=/</ end=/>/ contains=TOP,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level10 matchgroup=level10c start=/</ end=/>/ contains=TOP,level10,level11,level12,level13,level14,level15,level16,NoInParens
    syntax region level11 matchgroup=level11c start=/</ end=/>/ contains=TOP,level11,level12,level13,level14,level15 level16,NoInParens
    syntax region level12 matchgroup=level12c start=/</ end=/>/ contains=TOP,level12,level13,level14,level15,level16,NoInParens
    syntax region level13 matchgroup=level13c start=/</ end=/>/ contains=TOP,level13,level14,level15,level16,NoInParens
    syntax region level14 matchgroup=level14c start=/</ end=/>/ contains=TOP,level14,level15,level16,NoInParens
    syntax region level15 matchgroup=level15c start=/</ end=/>/ contains=TOP,level15,level16,NoInParens
    syntax region level16 matchgroup=level16c start=/</ end=/>/ contains=TOP,level16,NoInParens
    let rainbow_parenthesis#active = 0
endfunction

   " }}}1
finish

"------------------------------------------------------------------------------
"   Copyright (C) 2006  Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 wrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab
" vim: filetype=vim foldmethod=marker
