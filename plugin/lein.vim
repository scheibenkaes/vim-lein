
function! Lein_new()
    let project_name = input("Insert project name: ")
    if strlen(project_name) > 0
        execute ":!lein new " . project_name
    else
        echo "No name given. Aborting."
    endif
endfunction

:command! Lnew :call Lein_new()

