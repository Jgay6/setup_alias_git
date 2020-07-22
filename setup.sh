#!/bin/bash

c_type="--local"

case $1 in
	global)
		c_type="--global"
	;;
	system)
		c_type="--system"
	;;
	*)
		c_type="--local"
	;;
esac

# Rename old aliases
eval "git config $c_type --rename-section alias 'alias-old'"
eval "git config $c_type --rename-section alias.undo 'alias-old.undo'"
eval "git config $c_type --rename-section alias.branches 'alias-old.branches'"

# Basics
eval "git config $c_type alias.st 'status'"
eval "git config $c_type alias.s 'status -s'"
eval "git config $c_type alias.f 'fetch'"
eval "git config $c_type alias.p 'pull'"
eval "git config $c_type alias.cp 'cherry-pick'"

# Logging
eval "git config $c_type alias.lol 'log --oneline --decorate --graph --abbrev-commit --all'"
eval "git config $c_type alias.lines 'log --oneline --decorate'"
eval "git config $c_type alias.logfile 'log --follow'"

# Alterations
eval "git config $c_type alias.undo.soft 'reset --soft HEAD^'"
eval "git config $c_type alias.undo.hard 'reset --hard HEAD^'"
eval "git config $c_type alias.undo.first 'update-ref -d HEAD'"

# Branches
eval "git config $c_type alias.branches.unmerged 'branch --no-merged'"
eval "git config $c_type alias.branches.merged 'branch --merged'"
eval "git config $c_type alias.branches.prune 'remote prune origin'"

# Utils
eval "git config $c_type alias.pullr 'pull --rebase'"
eval "git config $c_type alias.visual '!gitk'"
eval "git config $c_type alias.fst '!git fetch && git status'"
eval "git config $c_type alias.conf 'config -l'"

# Initialization
# Use it as git init.user "Username" "email"
eval "git config $c_type alias.init.user '!f() { git config --local user.name \"\$1\" && git config --local user.email \"\$2\"; }; f'"

# patching
v_patch_stash="git config $c_type alias.patch.stash '!f() { git show -p stash@{\"\$1\"} > \"\$2.patch\"; }; f'"
eval "$v_patch_stash"


echo "The aliases has been included in '$c_type' config. All the old aliases are new within 'alias-old'"
