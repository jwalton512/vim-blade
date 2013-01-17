" only support 6.x+

if exists("b:current_syntax")
    finish
endif

runtime! syntax/php.vim

syntax case match

syntax match bladeTag /^\s*@if\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@elseif\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@else\>/
syntax match bladeTag /^\s*@endif\>/

syntax match bladeTag /^\s*@section\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@stop\>/
syntax match bladeTag /^\s*@parent\>/
syntax match bladeTag /^\s*@yield\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@extends\>/ nextgroup=bladeExpression skipwhite

syntax match bladeTag /^\s*@unless\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@endunless\>/

syntax match bladeTag /^\s*@for\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@endfor\>/

syntax match bladeTag /^\s*@foreach\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@endforeach\>/

syntax match bladeTag /^\s*@while\>/ nextgroup=bladeExpression skipwhite
syntax match bladeTag /^\s*@endwhile\>/

syntax match bladeTag /^\s*@each\>/ nextgroup=bladeExpression skipwhite

syntax match bladeTag /^\s*@include\>/ nextgroup=bladeExpression skipwhite

syntax match bladeTag /^\s*@show\>/

syntax region bladeEcho matchgroup=bladeEchoDelim start=/{{ / end=/ }}/ contains=@bladePHP
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

let b:current_syntax = "blade"
