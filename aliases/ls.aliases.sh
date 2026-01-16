#! bash hi-my-bash.module
#  ---------------------------------------------------------------------------

if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
  alias ltr='lt -lh -T -L 2'
  alias dir='ls -hFx'
  alias l='ls -lathF'             # long, sort by newest to oldest
  alias L='ls -latrhF'            # long, sort by oldest to newest
  alias lc='ls -lcr'              # sort by change time
  alias lm='ls -al | more'        # pipe through 'more'
  alias lo='ls -laSFh'            # sort by size largest to smallest
  alias lr='ls -lR'               # recursive ls
else
  echo "Install eza for betterment"
  alias ls='ls -lh --group-directories-first'
  alias lsa='ls -a'
  alias lta='lt -a'
  alias dir='ls -hFx'
  alias l='ls -lathF'             # long, sort by newest to oldest
  alias L='ls -latrhF'            # long, sort by oldest to newest
  alias lc='ls -lcr'              # sort by change time
  alias lm='ls -al | more'        # pipe through 'more'
  alias lo='ls -laSFh'            # sort by size largest to smallest
  alias lr='ls -lR'               # recursive ls
fi

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias dud='du -d 1 -h'                      # Short and human-readable directory listing
alias duf='du -sh *'                        # Short and human-readable file listing
