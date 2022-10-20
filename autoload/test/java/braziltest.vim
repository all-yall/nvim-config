
" SEE https://w.amazon.com/bin/view/Users/igbanam/Quip/VimasJavaIDE#HRungranulartests for source!

if !exists('g:test#java#braziltest#file_pattern')
  let g:test#java#braziltest#file_pattern = '\v([Tt]est.*|.*[Tt]est(s|Case)?)\.java$'
endif

function! test#java#braziltest#test_file(file) abort
  return a:file =~? g:test#java#braziltest#file_pattern
    \ && exists('g:test#java#runner')
    \ && g:test#java#runner ==# 'braziltest'
endfunction

function! test#java#braziltest#build_position(type, position) abort
  let filename = fnamemodify(a:position['file'], ':t:r')
  let package = s:get_java_package(a:position['file'])[4:]

  " These are the Amazon transformations"
  " ex:  brazil-build single-unit-test -DtestClass com.you.pkg.App -DtestMethods=test_method"
  " ex:  brazil-build single-unit-test -DtestClass com.you.pkg.App"
  let command_segments = ['single-unit-test -DtestClass=' . package . '.' . filename]
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      call add(command_segments, ' -DtestMethods='.name)
    endif
    return command_segments

  " ex:  brazil-build single-unit-test -DtestClass com.you.pkg.App "
  elseif a:type ==# 'file'
    return command_segments

  " ex:  brazil-build test "
  else
    return ['test']
  endif

endfunction

function! test#java#braziltest#build_args(args) abort
  return a:args
endfunction

function! test#java#braziltest#executable() abort
  return 'brazil-build'
endfunction

function! s:get_java_package(filepath)
  " abspath to sourcefile
  let abspath = fnamemodify(a:filepath, ':p')
  let abspath = substitute(a:filepath, '\\', '/', 'g')

  " strip path-to-project and brazil-boilerplate dir-structure
  let relpath = substitute(abspath, '^.*src/\(main\|test\)/java/', "", "g")
  let package_path = substitute(relpath, '\/[^/]\+$', "", "g")
  let java_package = substitute(package_path, '/', '.', 'g')
  return java_package
  " So... what this does is infer the package name from the filepath. While"
  " this is standard, this does not always hold true in Amazon. There are"
  " cases where the classes are nested in folders, but the package defined at"
  " the top does not match the filename."
  ""
  " The fool-proof way to get this done would be to read the first line of the"
  " file —·which should read something like "package com.amazon.blah." — copy"
  " everything in the line after "package " and stick it into a variable here."
  " I think this is a more authoritative source to get the package of a file."
  " vim-test assumes IDE-level consistency, but Vim in itself shows that IDEs"
  " are bendable and composable."
  ""
  " These said, I am not worrying about these for now because I haven't hit"
  " this usecase yet. Just thought to log it here for whever I come back to it"
  " in the future."
endfunc

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#java#patterns)

  return join(name['test'])
endfunction
