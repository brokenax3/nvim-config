" Make Spellcheck at the end
" syntax spell toplevel

" Don't mark URL-like things as spelling errors
" syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell

" " Don't count acronyms / abbreviations as spelling errors
" " (all upper-case letters, at least three characters)
" " Also will not count acronym with 's' at the end a spelling error
" " Also will not count numbers that are part of this
" " Recognizes the following as correct:
" syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

" syn region tex start=/\\$\\$/ end=/\\$\\$/
" syn match tex '\\$[^$].\{-}\$'

" hi link tex Statement
