" Vim syntax file
" Language:     Blade (Laravel)
" Maintainer:   Jason Walton <jwalton512@gmail.com>
" Filenames:    *.blade.php

syn case match
syn clear htmlError htmlTagError

if has('patch-7.4.1142')
    syn iskeyword @,48-57,_,192-255,@-@,:
else
    setlocal iskeyword+=@-@
endif

"{{{ blade lone directives
let g:blade_directives = [
      \'append',
      \'break',
      \'choice',
      \'continue',
      \'each',
      \'else',
      \'elsecan',
      \'elsecannot',
      \'elseif',
      \'empty',
      \'extends',
      \'hasSection',
      \'include',
      \'inject',
      \'lang',
      \'overwrite',
      \'show',
      \'stack',
      \'stop',
      \'unset',
      \'yield'
      \]
"}}}

"{{{ blade directive pairs
" this separation is purely for organization
let g:blade_directive_pairs = {
      \'can':       'endcan',
      \'cannot':    'endcannot',
      \'component': 'endcomponent',
      \'for':       'endfor',
      \'foreach':   'endforeach',
      \'forelse':   'endforelse',
      \'if':        'endif',
      \'php':       'endphp',
      \'prepend':   'endprepend',
      \'push':      'endpush',
      \'section':   'endsection',
      \'slot':      'endslot',
      \'unless':    'endunless',
      \'verbatim':  'endverbatim',
      \'while':     'endwhile'
      \}
"}}}

if exists('g:blade_custom_directives')
  let g:blade_directives += g:blade_custom_directives
endif

if exists('g:blade_custom_directives_pairs')
  call extend(g:blade_directive_pairs, g:blade_custom_directives_pairs)
endif

let g:blade_directive_opening = g:blade_directives + keys(g:blade_directive_pairs)
let g:blade_directive_closing = values(g:blade_directive_pairs)

for i in g:blade_directive_opening
  exec 'syn match bladeDirective /\<@'.i.'\>/ nextgroup=bladeParenBlock skipwhite containedin=ALLBUT,@bladeExempt'
endfor

for i in g:blade_directive_closing
  exec 'syn match bladeDirective /\<@'.i.'\>/ containedin=ALLBUT,@bladeExempt'
endfor

syn region bladeParenBlock  matchgroup=Delimiter start="\s*(" end=")" contains=@phpClTop,bladeParenBlock skipwhite contained
syn region bladeEcho        matchgroup=Delimiter start="@\@<!{{" end="}}" contains=@phpClTop,bladeParenBlock containedin=ALLBUT,@bladeExempt keepend
syn region bladeEcho        matchgroup=Delimiter start="{!!" end="!!}" contains=@phpClTop,bladeParenBlock containedin=ALLBUT,@bladeExempt keepend
syn region bladeComment     matchgroup=Delimiter start="{{--" end="--}}" contains=bladeTodo containedin=ALLBUT,@bladeExempt keepend

syn match bladeTodo contained /\c\(todo\|fixme\|xxx\|note\):\=/

syn cluster bladeExempt contains=bladeComment,bladePhpRegion,bladeParenBlock

hi def link bladeDelimiter    PreProc
hi def link bladeDirective    Statement
hi def link bladeTodo         Todo
hi def link bladeComment      Comment

" vim:foldmethod=marker:foldlevel=0
