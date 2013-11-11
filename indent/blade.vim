if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetBladeIndent()
setlocal indentkeys=o,O,*<Return>
setlocal nosmartindent

if exists("*GetBladeIndent")
  finish
endif

function! GetBladeIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  let pline = getline(lnum)
  let cline = getline(v:lnum)

  if cline =~ '^\s*\(@endforeach\|@stop\|@else\|@endif\|@endunless\|@endfor\|@endwhile\)\>'
    if pline =~ '^\s*\(@foreach\|@section\|@if\|@unless\|@for\|@while\)\>'
      return indent(lnum)
    else
      return indent(lnum) - &sw
    endif
  endif

  if pline =~ '^\s*\(@foreach\|@section\|@if\|@elseif\|@else\|@unless\|@for\|@while\)\>'
    return indent(lnum) + &sw
  endif

  return indent(lnum)
endfunction
