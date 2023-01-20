clear all
cls
pwd

adopath + "D:/Dropbox/Projects/setroot/"
cd D:\Dropbox\Projects\Dow\sergio\project\data\aggregates

set trace off
cap noi setroot

setroot, verbose search(aggregates)
asd
setroot, verbose
setroot, local
di "`root'"
setroot, search(README.md) verbose

setroot, more
di "$code"

di as text "Done"
exit
