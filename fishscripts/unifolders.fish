set unipath  ~/documents/uni/
set dir  (ls $unipath | fzf)
cd $unipath$dir
