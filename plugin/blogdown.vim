" Blogdown plugin
" vim: foldmethod=marker

if exists("g:loaded_blogdown") || &compatible
    finish
endif
let g:loaded_blogdown = 1

" Configuration variables -----------------------------------------------------
let g:blogdown_content_dir = get(g:, 'blogdown_content_dir', 'content')
let g:blogdown_blogs = get(g:, 'blogdown_blogs', [])


" Commands --------------------------------------------------------------------
command! BlogdownEditPost call <SID>EditPost(g:blogdown_content_dir, 'edit')
command! BlogdownTabEditPost call <SID>EditPost(g:blogdown_content_dir, 'tabedit')
command! BlogdownVertSplitPost call <SID>EditPost(g:blogdown_content_dir, 'vsplit')
command! BlogdownHoriSplitPost call <SID>EditPost(g:blogdown_content_dir, 'split')


" Functions -------------------------------------------------------------------
function! s:EditPost(content, sink) " {{{
    let arg_source = "'source': 'find " 
                \ . a:content 
                \ . " -name \"*md\" | sort'"
    let arg_sink = "'sink': '" 
                \ . a:sink 
                \ . "'"
    exe ":call fzf#run(fzf#wrap({" . arg_source . ", " . arg_sink . "}))"
endfunction "}}}

" WIP: avoid fzf dependency
function! s:FindPost(content) " {{{
    exe ":echo split(globpath('" . a:content . "', '**/*?md'), '\n')"
endfunction " }}}
