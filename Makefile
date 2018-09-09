#
# Generic makefile, srcs in current directory, not packed; config in
# bash_env.sh
#

SHELL:=/bin/bash
BASH_ENV:=bash_env.sh
export BASH_ENV


build: FORCE
	$$ocamlc -c $$mls
	$$ocamlopt -c $$mls
	@echo "NOTE cma contains: $$cmos" # simple check
	$$mk_cma -g -a -o $$libname.cma $$cmos
	$$mk_cmxa -g -a -o $$libname.cmxa $$cmxs

#	$(MAKE) install


install:
	-ocamlfind remove $$package_name
	mk_meta
	ocamlfind install $$package_name META *.cmi *.o *.a *.cma *.cmxa *.cmo *.cmx 


uninstall:
	ocamlfind remove $$package_name


clean: 
	clean

real_clean:
	clean

doc:
	mk_doc

FORCE:
