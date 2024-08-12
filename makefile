datetime := $(shell date +%Y%m%d_%H%M%S)

push:commit
	proxychains git push

commit:build
	git add .
	git commit -m 'commit at $(datetime)'	
build:
	gbook install
	gbook build