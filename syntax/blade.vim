" Vim syntax file
" Language:     Blade (Laravel)
" Maintainer:   Jason Walton <jwalton512@gmail.com>
" Filenames:    *.blade.php

if exists('b:current_syntax')
    finish
endif

if !exists("main_syntax")
    let main_syntax = 'blade'
endif

runtime! syntax/html.vim
unlet! b:current_syntax
runtime! syntax/php.vim
unlet! b:current_syntax

syn case match
syn clear htmlError

syn region  bladeEcho       matchgroup=bladeDelimiter start="@\@<!{{" end="}}"  contains=@bladePhp  containedin=ALLBUT,@bladeExempt keepend
syn region  bladeEcho       matchgroup=bladeDelimiter start="{!!" end="!!}"  contains=@bladePhp  containedin=ALLBUT,@bladeExempt keepend
syn region  bladeComment    matchgroup=bladeDelimiter start="{{--" end="--}}"  contains=bladeTodo  containedin=ALLBUT,@bladeExempt keepend

syn keyword bladeKeyword    @if @elseif @foreach @forelse @for @while @can @include @each @inject @extends @section @unless nextgroup=bladePhp skipwhite
syn keyword bladeKeyword    @else @endif @endunless @endfor @endforeach @empty @endforelse @endwhile @endcan @stop @append

syn region  bladePhpParenBlock  matchgroup=bladeDelimiter start="(" end=")" contains=@bladePhp skipwhite keepend

syn cluster bladePhp contains=@phpClTop

syn keyword bladeTodo todo fixme xxx  contained

hi def link bladeDelimiter      PreProc
hi def link bladeComment        Comment
hi def link bladeTodo           Todo
hi def link bladeKeyword        Statement

let b:current_syntax = 'blade'

if exists('main_syntax') && main_syntax == 'blade'
    unlet main_syntax
endif
