" Blogdown plugin
" vim: foldmethod=marker
if exists('g:loaded_blogdown_ftplugin') || !exists('b:is_blog')
  finish
endif

let g:loaded_blogdown_ftplugin = 1


" Commands --------------------------------------------------------------------
" function calls {{{1

command! BlogdownEditPost call <SID>EditPost(g:blogdown_content_dir, 'edit')
command! BlogdownTabEditPost call <SID>EditPost(g:blogdown_content_dir, 'tabedit')
command! BlogdownVertSplitPost call <SID>EditPost(g:blogdown_content_dir, 'vsplit')
command! BlogdownHoriSplitPost call <SID>EditPost(g:blogdown_content_dir, 'split')

"}}}
" direct blogdown calls: {{{1

command! BlogdownBuildSite execute ":! Rscript -e 'blogdown::hugo_build()'"
command! BlogdownBuildSite2 execute ":! Rscript -e 'blogdown::build_site()'"

"}}}

" Mappings --------------------------------------------------------------------
if g:blogdown_map_edit_post
    nnoremap <leader>e :BlogdownEditPost<CR>
    nnoremap <leader>t :BlogdownTabEditPost<CR>
    nnoremap <leader>/ :BlogdownHoriSplitPost<CR>
    nnoremap <leader>\ :BlogdownVertSplitPost<CR>
endif


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
