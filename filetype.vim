augroup blogdown
    autocmd BufRead,BufNewFile * call blogdown#detect(expand('<afile>:p'))
augroup END
