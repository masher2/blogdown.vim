function! blogdown#detect(filename)
    for blog in g:blogdown_blogs
        if expand('%:p') =~# blog
            let b:is_blog = 1
            runtime! ftplugin/blogdown.vim
        endif
    endfor
endfunction

