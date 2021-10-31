if exists('g:loaded_ruby_fold') || &cp
  finish
endif
let g:loaded_ruby_fold = 1

if has("autocmd")
  augroup ruby_fold
    autocmd!
    autocmd FileType ruby
          \ if expand('%:t') =~# '_spec.rb$' |
          \   let b:rspec_fold_end = 0 |
          \   setlocal foldexpr=ruby#simple_rspec_fold(v:lnum) foldmethod=expr foldtext=ruby#simple_fold_text()|
          \ else |
          \   setlocal foldexpr=ruby#fold(v:lnum) foldmethod=expr foldtext=ruby#simple_fold_text() |
          \ endif
  augroup END
endif
