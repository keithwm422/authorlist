
.PHONY: all 

tgts=output/anita_authors.html output/anita_authors.txt output/anita_authors_revtex.tex output/anita_institutes_revtex.tex output/anita_elsarticle_authors.tex output/anita_pos_authors.tex

all: index.html 

clean: 
	@rm -rf output 
	@unlink index.html 

$ (tgts): authors.in institutes.in anita_author_tool.py | output 
	@echo Running anita_author_tool.py
	@./anita_author_tool.py output/anita_ 

output: 
	@mkdir -p $@

index.html: output/anita_authors.html 
	@echo "<!DOCTYPE html><html><head><title>ANITA Author List</title></head> <body><h1>ANITA Author List</h1><hr/>" > $@
	@cat $^ >> $@ 
	@echo "</body></html>" >> $@
	

