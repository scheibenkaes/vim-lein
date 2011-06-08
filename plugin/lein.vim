function! Lein_def_sym_with_read()
    let type = input("Insert n for defn, leave blank for def")
    :call Lein_def_sym(type)
endfunction

function! Lein_def_sym(type)
    :normal viw"ty
    :normal {
    :normal O
    :stopinsert
    :normal o
    let snip = "def" . a:type
    :execute ":normal i" . snip . "\t" . @t 
    :startinsert
endfunction

function! Lein_new()
    let project_name = input("Insert project name: ")
    if strlen(project_name) > 0
        execute ":!lein new " . project_name
    else
        echo "No name given. Aborting."
    endif
endfunction

function! Lein_restart_nailgun()
    let sure = input("This invokes `java killall` are you sure? (y/N)")
    if sure == "y"
        :exe "!killall java"
        :Lvim
    endif
endfunction

:command! Lnew :call Lein_new()

:command! Ltest :execute "!lein test"
:command! Ldeps :execute "!lein deps"
:command! Luber :execute "!lein uberjar"
:command! Ljar :execute "!lein jar"
:command! Lvim :execute "!lein vimclojure &"
:command! Lrestartnail :call Lein_restart_nailgun()

:command! Lproject :execute ":find project.clj"

:nmap <LocalLeader>ds :call Lein_def_sym_with_read()<Return>

:imap ;dd :dev-dependencies [[org.clojars.autre/lein-vimclojure "1.0.0"]]
