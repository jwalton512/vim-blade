" only support 6.x+

if exists("b:current_syntax")
    finish
endif

syntax include @bladeHTML syntax/html.vim
unlet! b:current_syntax
syntax include @bladePHP syntax/php.vim
unlet! b:current_syntax

syntax case match

syntax match bladeTag /\s*@if\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@elseif\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@else\>/ containedin=@bladeHTML
syntax match bladeTag /\s*@endif\>/ containedin=@bladeHTML

syntax match bladeTag /\s*@section\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@stop\>/ containedin=@bladeHTML
syntax match bladeTag /\s*@endsection\>/ containedin=@bladeHTML
syntax match bladeTag /\s*@parent\>/ containedin=@bladeHTML
syntax match bladeTag /\s*@yield\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@extends\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML

syntax match bladeTag /\s*@unless\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@endunless\>/ containedin=@bladeHTML

syntax match bladeTag /\s*@for\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@endfor\>/ containedin=@bladeHTML

syntax match bladeTag /\s*@foreach\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@endforeach\>/ containedin=@bladeHTML

syntax match bladeTag /\s*@while\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@endwhile\>/ containedin=@bladeHTML

syntax match bladeTag /\s*@each\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML

syntax match bladeTag /\s*@include\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML

syntax match bladeTag /\s*@show\>/ containedin=@bladeHTML
syntax match bladeTag /\s*@overwrite\>/ containedin=@bladeHTML

syntax match bladeTag /\s*@lang\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML
syntax match bladeTag /\s*@choice\>/ nextgroup=bladeExpression skipwhite containedin=@bladeHTML

syntax region bladeStringDouble start=/"/ end=/"/ contained oneline containedin=@bladeHTML

syntax region bladeEcho matchgroup=bladeEchoDelim start=/{{{ / end=/ }}}/ contains=@bladePHP containedin=@bladeHTML,bladeStringDouble,bladeNonBlade
syntax region bladeRawEcho matchgroup=bladeEchoDelim start=/{{ / end=/ }}/ contains=@bladePHP containedin=@bladeHTML,bladeStringDouble,bladeNonBlade

syntax region bladeComment start=/{{-- / end=/ --}}/


syntax match bladeExpression /\(.*\)\s*$/ contained contains=@bladePHP

syntax cluster bladePHP add=
    \phpBoolean,
    \phpComparison,
    \phpConditional,
    \phpConstant,
    \phpCoreConstant,
    \phpEnvVar,
    \phpFloat,
    \phpFunctions,
    \phpIdentifier,
    \phpIdentifierComplex,
    \phpIdentifierComplexP,
    \phpIdentifierSimply,
    \phpIntVar,
    \phpKeyword,
    \phpLabel,
    \phpMethods,
    \phpMethodsVar,
    \phpNumber,
    \phpOperator,
    \phpParent,
    \phpRelation,
    \phpRepeat,
    \phpSpecialChar,
    \phpStatement,
    \phpStringDouble,
    \phpStringSingle,
    \phpVarSelector

hi def link bladeTag Keyword
hi def link bladeEchoDelim phpParent
hi def link bladeComment Comment

runtime! syntax/html.vim
runtime! after/syntax/html.vim

let b:current_syntax = "blade"
