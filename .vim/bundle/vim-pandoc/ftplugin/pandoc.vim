""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ftplugin/pandoc.vim
"
" Thrown together by David Sanson <https://github.com/dsanson>, who is
" a complete newbie when it comes to vim, so doesn't really know what he is
" doing.
"
" Use at your own risk!
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Soft word wrapping
"
setlocal formatoptions=1
setlocal linebreak
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Do not add two spaces at end of punctuation when joining lines
"
setlocal nojoinspaces
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Use pandoc to tidy up text
"
" If you use this on your entire file, it will wipe out title blocks.
" To preserve title blocks, use :MarkdownTidy instead. (If you use
" :MarkdownTidy on a portion of your file, it will insert unwanted title
" blocks...)
"

setlocal equalprg=pandoc\ -t\ markdown\ --no-wrap

"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Folding sections with ATX style headers.
"
" Taken from
" http://stackoverflow.com/questions/3828606/vim-markdown-folding/4677454#4677454
"
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction
setlocal foldexpr=MarkdownLevel()
setlocal foldmethod=expr
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Save folding between sessions
"
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Autocomplete dictionary of citationkeys
"
" There must be a better way to do this. I've generated a list of citekeys from
" my bibtex file and put it in citationkeys.dict.
"
setlocal dictionary=~/.pandoc/citationkeys.dict
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Autocomplete citationkeys using function
"
"

"fun! CompleteKeys(findstart, base)
  "if a:findstart
	"" locate the start of the word
	"let line = getline('.')
	"let start = col('.') - 1
	"while start > 0 && line[start - 1] =~ '\a'
	  "let start -= 1
	"endwhile
	"return start
  "else
	"let res = system('bibkey -v ' . a:base)
	"return res
  "endif
"endfun
"setlocal completefunc=CompleteKeys

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Commands that call Pandoc
"
" ## Simple Commands
"
" Markdown tidy with hard wraps
" (Note: this will insert an empty title block if no title block is present)

	:command! MarkdownTidyWrap %!pandoc -t markdown -s

" Markdown tidy without hard wraps
" (Note: this will insert an empty title block if no title block is present)

	:command! MarkdownTidy %!pandoc -t markdown --no-wrap -s

" ## Complex commands

" Two options here: commands the rely on an external wrapper script, "pd", and
" commands that don't.
"
" ### Commands that rely on "pd"
"
" I've written a bash wrapper script, "pd", which can be found here:
"
" 	https://gist.github.com/857619
"
" "pd" provides some shortcuts for common tasks, an easy way to
" set default conversion options. For details, read the comments in the
" script or try `pd help`.
"
" The advantage of calling "pd" here rather than pandoc is that you can
" set all your defaults once, and the conversions are available both in
" vim and from the cli.
"
" Below are some commands I use regularly. It should be easy to expand this
" list to suit your needs.
"
" Generate html (will be saved as filename.html)

	:command! MarkdownHtmlpd	!pd html %

" Generate html and open in default html viewer

	:command! MarkdownHtmlOpenpd !pd html open %

" Generate pdf using citeproc and open in default pdf viewer

	:command! MarkdownPdfCiteOpenpd !pd bib pdf open %

" Generate odt using citeproc and open in default odt viewer

	:command! MarkdownOdtCiteOpenpd !pd bib odt open %

" ### Commands that call pandoc directly
"
" Here are three more complicated pandoc commands that don't rely on pd. The
" advantage is that you don't need to provide those external scripts. The
" disadvantage is that you have to manage all the cli options here.
"
" Note that these commands depend on OS X's "open" command. Linux users will
" want to rewrite them to use the "xdg-open" command.
"
" Generate html and open in default html viewer

	:command! MarkdownHtmlOpen !out="%";out="${out\%.*}.html";pandoc -t html -sS -o "$out" %;open "$out"

" Generate pdf and open in default pdf viewer

  	:command! MarkdownPdfOpen !out="%";out="${out\%.*}.pdf";markdown2pdf -o "$out" %;open "$out"

" Generate odt and open in default odt viewer

	:command! MarkdownOdtOpen !out="%";out="${out\%.*}.odt";pandoc -t odt -sS -o "$out" %;open "$out"
"
" # Some suggested <Leader> mappings
"
" It is bad form to put <Leader> mappings in ftplugins. Here are the mappings I
" have in my .vimrc. If you like them, you can either copy them to your vimrc
" or uncomment them here.
"
"map <silent> <Leader>html :MarkdownHtmlOpenpd<CR>
"map <silent> <LEADER>pdf :MarkdownPdfCiteOpenpd<CR>
"map <silent> <LEADER>odt :MarkdownOdtCiteOpenpd<CR>
"
" While I'm at it, here are a few more functions mappings that are useful when
" editing pandoc files.
"
" Open link in browser (OS X only; based on Gruber's url regex)
"
" (This isn't very pandoc-specific, but I use it in the next mapping below.)
"
"ruby << EOF
"  def open_uri
"    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

"    line = VIM::Buffer.current.line

"    if url = line[re]
"      system("open", url)
"      VIM::message(url)
"    else
"      VIM::message("No URI found in line.")
"    end
"  end
"EOF

"if !exists("*OpenURI")
"  function! OpenURI()
"    :ruby open_uri
"  endfunction
"endif
"map <Leader>w :call OpenURI()<CR>

"" Open reference link in browser (depends on above mapping of <LEADER>w)
"map <Leader>wr ya[#<LEADER>w*

"" Jump forward to existing reference link (or footnote link)
"map <Leader>fr ya[#E

"" Jump back to existing reference link (or fn link)
"map <Leader>br {jwya[*E

"" Add new reference link (or footnote link) after current paragraph. (This
"" works better than the snipmate snippet for doing this.)

"map <Leader>nr ya[o<CR><ESC>p$a:
