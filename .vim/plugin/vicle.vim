" vicle.vim:  Vim - Interpreter Command Line Editor. Use vim like a front-end
"             for edit commands and send it to an interactive interpreter open
"             in a GNU Screen session.
" Maintainer: Jose Figuero Martinez <coloso at gmail dot com>
" Version:    1.2
" Require:    Vim7
" License:    BSD
" Os:         Linux, *Unix (both require GNU Screen)
" History:
"   2010-04-12:
"   - Version 1.2
"   - Removed the size limit for the buffer to send by calling multiple times
"     to Screen.
"   - Fixed behavior with multiple tabs.
"   2009-10-13:
"   - Fixed copying multiple times the same selection when sending a selected
"     text
"   2009-10-12:
"   - Fixed cursor return to the last position when sending a command
"   2009-10-04:
"   - Version 1.1.1
"   - Removed the annoying "Press ENTER ..." by adding preceding the "exec"
"     commands with the "silent" command.
"   2009-10-02:
"   - Added edition mode and more tips.
"   2009-02-24:
"   - Removed some doc.
"   - Command for send content.
"   - Fix problem with load/saving history commands.
"   2009-02-23:
"   - Fixed a bad behavior when open/save history files.
"   2009-02-19:
"   - Added the documentation.
"   - Added save and load history.
"   2009-02-18: Second release and stable version 1
"   - Better manage of history.
"   - Commands for: clear and save history and set/get screen session vars.
"   2009-02-13: First realease
"   - Send data to the screen session.
"   - History of commands (cyclic and without limit of size).
"   - Multiple vicle within a vim execution (using tabedit for example).
"
" Usage:
" - Load a Screen session and then load an interpreter (ipython, irb, shell,
"   sbcl, clisp, etc., etc) in the shell:
"   % screen -S rubySession
"   % irb
"   >>
"
" - Open Vim with the vicle plugin and type a command (without press ENTER):
"   puts "Ruby interpreter"
"
" - Type <C-c><C-c>  or <C-CR> or :VicleSend  to send to the interpreter the
"   current line (that can be changed by setting other Selection String).
"
" - If the identifiers of the screen are not set, you are going be asked for
"   it (put the session name and window number where your interpreter are.
"   All the windows in a Screen session have a unique number.
"   You can use TAB key for completion in the Session name):
"
"   Session name: rubySession
"   Window number: 0
"
"   In the screen window you are going to see:
"   >> puts "Ruby interpreter"
"   Ruby interpreter
"   => nil
"
"   If you disable the Edition Mode by calling the command :VicleEditionToggle
"   the <C-CR> and the other shortcut are going to send all the content of the
"   screen and after that, the screen of Vim are going to be cleared, just
"   like a normal command line.
"
" - You scroll through the commands with the key <C-Up> and <C-Down>   just
"   like the history of the shell.
"
" - Edition Mode
"   This mode do not clear the screen after send the command. Also, it send a
"   command selected by a custom Selection String that is in the variable
"
"   t:vicle_selection_string
"
"   Edition Mode is 1 (ON) by default.
"
"   By default, vicle in Edition mode send the current line.
"   Toggle the Edition Mode using the command :VicleEditionToggle
"
"   The selection string is by default "0v$y": go to column 0, enter visual
"   mode, go to the end of line and yank. Always is necesary to end with the
"   yank command "y".
"   It can be set to "{v}y" to select the current paragraph
"
" - Sending selected text using Vim's Visual Mode
"   Just select the text and press <C-CR> or <C-c><C-c> to send the selected
"   text without clear the screen. It is the same in Vicle Edition Mode and
"   Vicle Not Edicion Mode (send command and clear vim screen)
"
"   Just select the text. Vicle are going to yank it.
"
" - Usefull commands for manage the history. Use absolute paths for history
"   files:
"   :VicleHistoryToggle   " activate or deactivate history
"   :VicleHistoryClear
"   :VicleHistorySize
"   :VicleHistorySave
"   :VicleHistoryLoad
" - To change the screen name and window name use the command
"   :VicleSession
"
" - Some global variables that you can define in your .vimrc:
"   let g:vicle_session_name    = 'normal_session_name'
"   let g:vicle_session_window  = 'normal_session_window'
"
"   let g:vicle_history_active   = 0 " deactivate history
"   let g:vicle_edition_mode     = 1 " active edition mode
"   let g:vicle_selection_string = "0v$y"  " yank current line
"
"   let g:vicle_hcs             = '~~~your_command_separator~~~'
"
" Tips:
" - If you want to send commands to a Ruby interpreter (irb), open a file like
"   work.rb or other with the extension .rb  or set the filetype manually
"   :set filetype=ruby
"
"   This apply to other languages supported by vim.
"
" - For use Vicle with diferent languages
"
"   autocmd FileType python let t:vicle_selection_string = "0v}y"
"   autocmd FileType lisp let t:vicle_edition_mode = 1 | let t:vicle_history_active = 0 | let t:vicle_selection_string = "v%y"
"
" - Use of rlwrap to run the interpreter
"
"   It is known that by trying and testing that running the interpreter with
"   rlwrap improves the performances of vicle.
"
"   Clojure with rlwrap:
"   screen -S clojure rlwrap java -cp clojure.jar clojure.main
"
" - About the limit of size for the buffers to send
"   
"   Vicle call many times to Screen when the buffer to send its bigger than
"   1000 characters. This let vicle to send really big buffers.
"
" InspiredOn:
"   Slime for Vim from Jonathan Palardy
"   http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/
"   and the work of Jerris Welt
"   http://www.jerri.de/blog/archives/2006/05/02/scripting_screen_for_fun_and_profit/
"
"   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -

if exists('g:vicle_loaded')
  finish
endif
let g:vicle_loaded=1


" Private. For reload initial parameters.
function! Vicle_up_vars()
  if exists('t:vicle_vars_loaded')
    return 0
  endif
  let t:vicle_vars_loaded = 1

  " vicle edition mode: don't clear screen, save historic, don't replace screen
  "   with historic, let send commands by programmed movement.
  if !exists('t:vicle_edition_mode')
    if !exists('g:vicle_edition_mode')
      let t:vicle_edition_mode = 1
    else
      let t:vicle_edition_mode =  g:vicle_edition_mode
    endif
  endif

  " vicle selection string, used for the edicion mode. Of course, you can use
  " what ever you like to select and finish in Visual mode to simple send the
  " command. It is necesary to end with the "yank" letter.
  " 
  " } paragraph, % brace bracet comment, $ line, see vim movements.
  " 0v$y is: go to begin of line, enter Visual Mode, go to end of line and yank
  if !exists('t:vicle_selection_string')
    if !exists('g:vicle_selection_string')
      let t:vicle_selection_string = "0v$y"
    else
      let t:vicle_selection_string = g:vicle_selection_string
    endif
  endif

  " vicle history active. If 1, the history is on, if 0, there is no history
  if !exists('t:vicle_history_active')
    if !exists('g:vicle_history_active')
      let t:vicle_history_active = 1
    else
      let t:vicle_history_active =  g:vicle_history_active
    endif
  endif
endfunc

" vicle history command separator
if !exists('g:vicle_hcs')
  let g:vicle_hcs = '~~~vvhcs~~~'
endif

" Internal Vars
let g:vicle_normal      = 1
let g:vicle_insert      = 2
let g:vicle_visual      = 3
let g:vicle_max_buffer  = 1010  " limit of send characters
"   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -
" SENDING

" Send the text of the screen to Screen
function! Vicle_send_command(mode)
  call Vicle_up_vars()
  let l:curpos = getpos(".")
  
  if a:mode != g:vicle_visual
    if t:vicle_edition_mode < 1
      call Vicle_send_command_noedition()
      return 0
    else
      call Vicle_send_command_edition()
    endif
  else
    call Vicle_send_selection()
  endif

  if a:mode != g:vicle_visual
    call setpos(".", l:curpos)
  endif
  if a:mode == g:vicle_insert   
    startinsert
  endif
endfunction

" -   -   -   -   -   -   -   -   -

function! Vicle_send_command_noedition()
  let l:lines= getline(0,'$')
  call Vicle_send_lines(l:lines)
  call Vicle_screen_clean()
  call Vicle_startinsert()
endfunction


function! Vicle_send_command_edition()
  silent exec 'normal '.t:vicle_selection_string
  call Vicle_send_cero_reg()

endfunction


function! Vicle_send_selection()
  silent exec "normal gvy"
  call Vicle_send_cero_reg()
endfunction
 
function! Vicle_send_cero_reg()
  let l:lines = split(getreg('"'), "\n")
  call Vicle_send_lines(l:lines)
  unlet l:lines
endfunction

function! Vicle_startinsert()
  startinsert
  silent exec 'normal G$'
endfunction
"   -   -   -   -   -   -   -   -

function! Vicle_send_lines(lines)
  if a:lines != ['']
    let l:text = substitute(join(a:lines, "\n") , "'", "'\\\\''", 'g') . "\n"
    call Vicle_up_svars()
    if t:vicle_history_active > 0
      call Vicle_history_save_command(a:lines)
    endif

    " Loop for sending lines. OpenBSD only allows to send 1010 chars aprox.
    let l:lentext = strlen(l:text)
    let l:ltimes  = l:lentext / g:vicle_max_buffer
    if (l:ltimes * g:vicle_max_buffer) < l:lentext
      let l:ltimes = l:ltimes + 1
    endif
    let l:i = 0
    while l:i < l:ltimes
      let l:ttext = strpart(l:text, l:i * g:vicle_max_buffer, g:vicle_max_buffer)
      " For debug
      "echo 'screen -S ' . t:vicle_screen_sn . ' -p ' . t:vicle_screen_wn . " -X stuff '" . l:ttext . "'"
      " -  -  -  -
      echo system('screen -S ' . t:vicle_screen_sn . ' -p ' . t:vicle_screen_wn . " -X stuff '" . l:ttext . "'")
      let l:i = l:i + 1
    endwhile

    unlet l:text
  endif
endfunction

"   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -

function! Vicle_screen_clean()
  silent exec 'normal ggdG'
endfunction

function! Vicle_screen_put(lines)
  call Vicle_screen_clean()
  call append(1, a:lines)
  " Remove extra line and go to end of file
  silent exec 'normal dd'
endfunction

" Session vars

function! Vicle_screen_sessions(A, L, P)
  return system("screen -ls | awk '/Attached/ {print $1}' | cut -d '.' -f 2")
endfunction

function! Vicle_clean_svars()
  unlet t:vicle_screen_sn
  unlet t:vicle_screen_wn
endfunction

" Historial of commands
function! Vicle_eh() " exists history
  return exists('t:vicle_history')
endfunction

function! Vicle_history_clear(msg)
  call Vicle_up_vars()
  if Vicle_eh()
    if (a:msg != '')
      echohl Identifier
      let l:res = confirm("Clear history?", "&no\n&yes", 1)
      echohl None
      if l:res != 1
        echohl Comment | echon a:msg | echohl None
      else
        return
      endif
    endif

    for l:item in t:vicle_history
      call remove(t:vicle_history, 0)
    endfor
    unlet t:vicle_history
    unlet t:vicle_h_pointer
    unlet t:vicle_h_len
  end

  let t:vicle_history   = []
  let t:vicle_h_pointer = 0
  let t:vicle_h_len     = 0
endfunction

function! Vicle_history_save_command(text)
  call Vicle_up_vars()
  call add(t:vicle_history, a:text)
  let t:vicle_h_len     = t:vicle_h_len + 1
  let t:vicle_h_pointer = t:vicle_h_len
endfunction

function! Vicle_history_move(ud)
  call Vicle_up_vars()
  if t:vicle_edition_mode > 0
    return 0
  endif

  if Vicle_eh()
    if t:vicle_h_len > 0
      if a:ud < 1 " up
        let t:vicle_h_pointer = t:vicle_h_pointer - 1
        if t:vicle_h_pointer < 0
          let t:vicle_h_pointer = t:vicle_h_len - 1
        endif
      else        " down
        let t:vicle_h_pointer = t:vicle_h_pointer + 1
        if !(t:vicle_h_pointer < t:vicle_h_len)
          let t:vicle_h_pointer = 0
        endif
      endif

      call Vicle_screen_put(t:vicle_history[t:vicle_h_pointer])
      call Vicle_startinsert()
    else
      return ''
    endif
  endif
endfunction

function! Vicle_history_size()
  call Vicle_up_vars()
  if Vicle_eh()
    let l:s = 0
    for l:item in t:vicle_history
      for l:i in l:item
        let l:s = l:s + strlen(l:i) + 2
      endfor
    endfor
    let l:s = l:s + 2 " list pointers

    echohl Comment    | echon 'Vicle history size: '
    echohl Constant   | echon string(l:s)
    echohl Comment    | echon ' bytes' | echohl None
  endif
endfunction

function! Vicle_history_save()
  call Vicle_up_vars()
  if Vicle_eh()
    try
      echohl Identifier
      let l:fname = input('History file (save): ', '', 'file')
      if l:fname != ''
        echohl None
        let l:lt = []
        for l:list in t:vicle_history
          for l:i in l:list
            call add(l:lt, l:i)
          endfor
          let l:lt = l:lt + [g:vicle_hcs]
        endfor
        call writefile(l:lt, l:fname)
        unlet l:lt
        echohl Comment | echon 'History file '. l:fname .' saved'
      end
      echohl None
    catch
      echoe 'Error writing vim vicle history to file: ' . string(l:fname)
    endtry
  endif
endfunction

function! Vicle_history_load()
  call Vicle_up_vars()
  if ! Vicle_eh()
    call Vicle_history_clear('')
  endif
  try
    echohl Identifier
    let l:fname = input('History file (load): ', '', 'file')
    if l:fname != ''
      echohl None
      let l:lines = readfile(l:fname)
      let l:lt = []
      call Vicle_history_clear('')

      for l:line in l:lines
        if l:line != g:vicle_hcs
          call add(l:lt, l:line)
        else
          call Vicle_send_lines(l:lt)
          unlet l:lt
          let l:lt = []
        endif
      endfor
      echohl Comment | echon 'History' . l:fname . 'file loaded'
    endif
    echohl None
  catch
    echoe 'Error loading vim vicle history file: ' . string(l:fname)
  endtry
endfunction

function! Vicle_history_toggle()
  call Vicle_up_vars()
  if t:vicle_history_active > 0
    let t:vicle_history_active = 0
  else
    let t:vicle_history_active = 1
  endif
  echohl Comment | echon 'Vicle history active: '
  echohl Constant | echon t:vicle_history_active
  echohl None
endfunc

"   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -
" Up vars
function! Vicle_up_svars()
  call Vicle_up_vars()
  if !exists('t:vicle_default_loaded')
    let t:vicle_default_loaded = 1
    " Define the 2 vars!!
    if exists('g:vicle_session_name')
      let t:vicle_screen_sn = g:vicle_session_name
      let t:vicle_screen_wn = g:vicle_session_window
    endif

    call Vicle_history_clear('')
  end

  if !exists('t:vicle_screen_sn') || !exists('t:vicle_screen_wn')
    echohl Identifier
    let t:vicle_screen_sn = input('Session name: ', '', 'custom,Vicle_screen_sessions')
    let t:vicle_screen_wn = input('Window number: ', '0')
    echohl None
  end
endfunction

function! Vicle_session()
  call Vicle_clean_svars()
  call Vicle_up_svars()
  call Vicle_up_vars()
endfunction

function! Vicle_session_vars()
  call Vicle_up_vars()
  if exists('t:vicle_screen_sn')
    echohl Comment  | echon 'Screen Session/Windot: '
    echohl Constant | echon t:vicle_screen_sn
    echohl Comment  | echon '/'
    echohl Constant | echon t:vicle_screen_wn
    echohl None
  endif
endfunction

"   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -
function! Vicle_edition_toggle()
  call Vicle_up_vars()
  if t:vicle_edition_mode > 0
    let t:vicle_edition_mode = 0
  else
    let t:vicle_edition_mode = 1
  endif
  echohl Comment | echon 'Vicle edition mode: '
  echohl Constant | echon t:vicle_edition_mode
  echohl None
endfunction

"   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -
" Shortcuts and commands

if !mapcheck('<C-CR>')
  nmap <C-CR> :call Vicle_send_command(g:vicle_normal)<CR>
  imap <C-CR> <ESC>:call Vicle_send_command(g:vicle_insert)<CR><Right>
  vmap <C-CR> <ESC>:call Vicle_send_command(g:vicle_visual)<CR>
endif

" Maps for sending
nmap <C-c><C-c> :call Vicle_send_command(g:vicle_normal)<CR>
imap <C-c><C-c> <ESC>:call Vicle_send_command(g:vicle_insert)<CR><Right>
vmap <C-c><C-c> <ESC>:call Vicle_send_command(g:vicle_visual)<CR>

" Maps for history
nmap <C-Up> :call Vicle_history_move(-1)<CR>
imap <C-Up> <ESC><C-Up>
nmap <C-Down> :call Vicle_history_move(1)<CR>
imap <C-Down> <ESC><C-Down>

" Commands
command! -complete=command VicleSend call Vicle_send_command(g:vicle_normal)
command! -complete=command VicleSession call Vicle_session()
command! -complete=command VicleSessionVars call Vicle_session_vars()
command! -complete=command VicleEditionToggle call Vicle_edition_toggle()
command! -complete=command VicleHistoryToggle call Vicle_history_toggle()
command! -complete=command VicleHistoryClear call Vicle_history_clear('Vicle history cleared')
command! -complete=command VicleHistorySize call Vicle_history_size()
command! -complete=command VicleHistorySave call Vicle_history_save()
command! -complete=command VicleHistoryLoad call Vicle_history_load()

