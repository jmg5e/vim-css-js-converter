command! -range CssToJs <line1>,<line2>call CssToJs()
command! -range JsToCss <line1>,<line2>call JsToCss()

if !exists('g:css_js_converter#doublequotes')
    let g:css_js_converter#doublequotes = 0
endif

function! CssToJs()
    let line = getline('.') 
    let values = split(line, ':')
    if len(values) == 2
        let key = s:camelCase(values[0])
        " trim trailing whitespace
        let property = substitute(values[1], '\s\+$', '', 'e')
        " trim leading whitespace
        let property = substitute(property, '^\s\+', '', 'e')
        " add quotes
        if(g:css_js_converter#doublequotes)
            let property = substitute(property, '\([^;]*\)', '"\1"', 'e')
        else
            let property = substitute(property, '\([^;]*\)', "'\\1'", 'e')
        endif
        " replace semi with comma
        let property = substitute(property, '\;', ',', 'e')

        let newLine = key . ': '. property
        call setline('.', newLine)
    endif
endfun

function! JsToCss()
    let line = getline('.') 
    let values = split(line, ':')
    if len(values) == 2
        let key = s:hyphenCase(values[0])
        " remove quotes
        let property = substitute(values[1], "[\"']", '', 'ge')
        " replace comma with semi colon
        let property = substitute(property, ',', ';', 'e')

        let newLine = key . ':'. property
        call setline('.', newLine)
    endif
endfun

function! s:camelCase(word)
  let word = substitute(a:word, '-', '_', 'g')
  if word !~# '_' && word =~# '\l'
    return substitute(word,'^.','\l&','')
  else
    return substitute(word,'\C\(_\)\=\(.\)','\=submatch(1)==""?tolower(submatch(2)) : toupper(submatch(2))','g')
  endif
endfunction

function! s:hyphenCase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1-\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1-\2','g')
  let word = tolower(word)
  return word
endfunction
