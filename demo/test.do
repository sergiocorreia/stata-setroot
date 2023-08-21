cd "C:\Git\stata-setroot\demo"
clear all
cls

ado uninstall setroot
net install setroot, from("C:\Git\stata-setroot\src")

cd "C:/Git/stata-require/test/"
setroot
setroot, more
setroot, verbose
setroot, quietly

cd "C:\Git\stata-setroot\demo"
