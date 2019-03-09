let s:definitions = [
\   {
\       'start': ['section'],
\       'middle': ['parent'],
\       'end': ['show', 'append', 'overwrite', 'stop', 'endsection']
\   },
\   {
\       'start': 'push',
\       'end': 'endpush',
\   },
\   {
\       'start': 'prepend',
\       'end': 'endprepend',
\   },
\   {
\       'start': ['if', 'unless', 'can', 'cannot', 'hasSection', 'auth', 'guest', 'isset'],
\       'middle': ['elseif', 'else', 'elsecan', 'elsecannot', 'elseauth', 'elseguest'],
\       'end': ['endif', 'endunless', 'endcan', 'endcannot', 'endauth', 'endguest', 'endisset']
\   },
\   {
\       'start': ['switch'],
\       'middle': ['case', 'break', 'default'],
\       'end': ['endswitch'],
\   },
\   {
\       'start': ['while'],
\       'middle': ['continue', 'break'],
\       'end': ['endwhile'],
\   },
\   {
\       'start': ['for'],
\       'middle': ['continue', 'break'],
\       'end': ['endfor'],
\   },
\   {
\       'start': ['foreach'],
\       'middle': ['continue', 'break'],
\       'end': ['endforeach'],
\   },
\   {
\       'start': ['forelse'],
\       'middle': ['continue', 'break', 'empty'],
\       'end': ['endforelse'],
\   },
\   {
\       'start': 'php',
\       'end': 'endphp',
\       'is_single_when_has_arguments': v:true
\   },
\   {
\       'start': 'component',
\       'end': 'endcomponent',
\   },
\   {
\       'start': 'slot',
\       'end': 'endslot',
\       'is_single_when_has_arguments': 2
\   },
\   {
\       'start': 'empty',
\       'is_single_when_has_arguments': v:true
\   },
\   'include',
\   'includeWhen',
\   'includeFirst',
\   'each',
\   'yield',
\   'stack',
\   'inject',
\   'lang',
\   'choice',
\   'extends',
\   'unset',
\   'csrf',
\   'method',
\   'json',
\]

function! s:format_definition(definition) abort
    if type(a:definition) == v:t_string
        let l:definition = {'start': [a:definition]}
    else
        let l:definition = a:definition
    endif

    return {
    \   'start': s:format_directives(l:definition.start),
    \   'middle': s:format_directives(get(l:definition, 'middle', [])),
    \   'end': s:format_directives(get(l:definition, 'end', [])),
    \   'has_parentheses': get(l:definition, 'has_parentheses', 1),
    \   'is_single_when_has_arguments': get(l:definition, 'is_single_when_has_arguments', v:false)
    \}
endfunction

function! s:format_directives(directives) abort
    return type(a:directives) != v:t_list
    \   ? [a:directives]
    \   : a:directives
endfunction

let g:blade#definitions = map(deepcopy(s:definitions), { _, d -> s:format_definition(d) })
let g:blade#single_directives = filter(deepcopy(g:blade#definitions), { _, d -> !len(d.middle) && !len(d.end) })
