capture program drop setroot
program define setroot, rclass
	syntax, [LOCal GLObal MORE SEArch(string) ADD(string) VERBOSE]

	* Create placeholder files and exit
	if ("`add'" != "") {
		tempname myfile
		file open `myfile' using "`add'", write
		exit
	}

	* Parse rest of syntax
	if (`"`search'"' == "") loc search .here .project .git DESCRIPTION LICENSE README.md project.toml manifest.toml pyproject.toml

	loc verbose = ("`verbose'" != "")
	opts_exclusive "`local' `global'"
	if ("`local'`global'" == "") loc global global // Default is global
	*loc local = "`local'" != ""
	loc more = "`more'" != ""

	* Cleanup globals (for sanity)
	global root
	if (`more') {
		global code
		global data
		global temp
		global log
		global input
		global output
	}

	* Find placeholder files
	loc found_path // empty
	loc path `"`c(pwd)'"'
	if ("`c(os)'" == "Windows") loc path = usubinstr(`"`path'"', "\", "/", .) // Windows files can't contain "/"
	while ("`path'" != "") {
		if (`"`found_path'"' != "") continue, break
		* Search
		if (`verbose') di as text `"[setroot] searching for placeholder files in {res}"`path'" "'

		foreach fn of local search {
			loc fullfn "`path'/`fn'"
			*if (`verbose') di as text `"    candidate: {res}"`fn'""' _c
			if (`verbose') di as text `"          {res}"`fn'""' _c
			mata: st_local("exists", strofreal(fileexists("`fullfn'") | direxists("`fullfn'")))
			assert inlist(`exists', 0, 1)
			if (`exists') {
				loc found_path = "`path'"
				if (`verbose') di as text `" found! <<<<"'
				continue, break
			}
			else {
				if (`verbose') di as error `" x"'
			}
		}

		* Update path
		loc dash = ustrrpos(`"`path'"', "/")
		loc path = usubstr(`"`path'"', 1, `dash'-1)
	}

	* Save local/globals
	if (`"`found_path'"' != "") {
		di as text `"updating `local'`global' variable "root" = {inp}"`found_path'" "'
		if (`more') di as text `"also updating `local'`global' variables "code", "data", "temp", "log", "input", and "output""'
		return local root "``root''"
		if ("`local'" != "") {
			c_local root "`found_path'"
			if (`more') {
				c_local code			"`root'/code"
				c_local data			"`root'/data"
				c_local temp			"`root'/temp"
				c_local log				"`root'/log"
				c_local input			"`root'/input"
				c_local output			"`root'/output"
			}
		}
		else {
			global root "`found_path'"
			if (`more') {
				global code				"$root/code"
				global data				"$root/data"
				global temp				"$root/temp"
				global log				"$root/log"
				global input			"$root/input"
				global output			"$root/output"
			}
		}
	}
	else {
		di as error "Root folder of project not found"
		exit 601
	}
end
