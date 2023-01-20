# stata-setroot
Find the root path of a project and set it as a global variable

## Install


To install from Github, type:

```stata
cap ado uninstall setroot
net install setroot, from("https://raw.githubusercontent.com/sergiocorreia/stata-setroot/master/src/")
```

To install locally, type:

```stata
cap ado uninstall setroot
net install setroot, from("c:\git\stata-setroot\src")
```


## Usage

First, ensure you have a specific file or folder in the root folder of your project, such as `.here`. You can create such a file with the `, add()` option.

Then, at the top of your do-file:

```stata
setroot

use "$root/data/mydata"
```

The list of files searched for are:
- `.here`
- `.project`
- `.git`
- `DESCRIPTION`
- `LICENSE`
- `README.md`
- `project.toml`
- `manifest.toml`
- `pyproject.toml`
