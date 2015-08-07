#!bash

# DO NOT EDIT. This file generated by pkg/bin/generate-completion.pl.

_git_subrepo() {
    local _opts=" -h --help --version -a --all -b= --branch= -f --force -F --fetch -r= --remote= -u --update -q --quiet -v --verbose -d --debug -x --DEBUG"
    local subcommands="branch clean clone commit fetch help init pull push status version"
    local subdircommands="branch clean commit fetch init pull push status"
    local subcommand="$(__git_find_on_cmdline "$subcommands")"

    if [ -z "$subcommand" ]; then
        # no subcommand yet
        case "$cur" in
        -*)
            __gitcomp "$_opts"
        ;;
        *)
            __gitcomp "$subcommands"
        esac

    else

        case "$cur" in
        -*)
            __gitcomp "$_opts"
            return
        ;;
        esac

        if [[ "$subcommand" == "help" ]]; then
            __gitcomp "$subcommands"
            return
        fi

        local subdircommand="$(__git_find_on_cmdline "$subdircommands")"
        if [ ! -z "$subdircommand" ]; then
            local git_subrepos=`git subrepo status -q`
            __gitcomp "$git_subrepos"
        fi

    fi
}
