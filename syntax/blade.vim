" Language:	    Blade (Laravel)
" Maintainer:	xsbeats <jwalton512@gmail.com>
" URL:	        http://github.com/xsbeats/vim-blade
" License:      WTFPL

if exists("b:current_syntax")
    finish
endif

runtime! syntax/html.vim
unlet b:current_syntax

syn include @php syntax/php.vim
unlet b:current_syntax

syn match bladeConditional /@\(choice\|each\|elseif\|extends\|for\|foreach\|if\|include\|lang\|section\|unless\|while\|yield\)\>/ skipwhite nextgroup=bladeParenBlock

syn match bladeKeyword /@\(else\|endfor\|endforeach\|endif\|endsection\|endunless\|endwhile\|overwrite\|parent\|show\|stop\)\>/

syn region bladeCommentBlock start="{{--" end="--}}" contains=bladeComment keepend
syn match bladeComment /.*/ contained containedin=bladeCommentBlock

syn region bladeEchoUnescaped matchgroup=bladeEchoDelim start="\([@|{]\)\@<!{{\(--\)\@!" end="}}" contains=@phpClInside containedin=htmlString
syn region bladeEchoEscaped matchgroup=bladeEchoDelim start="\(@\)\@<!{{{" end="}}}" contains=@phpClInside containedin=htmlString

syn region bladeParenBlock start="(" end=")" contained oneline contains=bladeParenBlock,@phpClInside keepend

hi def link bladeComment Comment
hi def link bladeConditional Conditional
hi def link bladeKeyword Keyword
hi def link bladeEchoDelim Delimiter

let b:current_syntax = 'blade'
