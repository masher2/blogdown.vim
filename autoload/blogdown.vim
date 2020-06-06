function! blogdown#detect(filename)
    for blog in g:blogdown_blogs
        if expand(a:filename) =~# expand(blog)
            let b:is_blog = 1
            runtime! ftplugin/blogdown.vim
        endif
    endfor
endfunction

