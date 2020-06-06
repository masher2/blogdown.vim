" Blogdown plugin
" vim: foldmethod=marker

if exists("g:loaded_blogdown") || &compatible
    finish
endif
let g:loaded_blogdown = 1

" Configuration variables -----------------------------------------------------
let g:blogdown_content_dir = get(g:, 'blogdown_content_dir', 'content')
let g:blogdown_blogs = get(g:, 'blogdown_blogs', [])
let g:blogdown_map_edit_post = get(g:, 'blogdown_map_edit_post', 0)

