REPO=probr-core kubernetes aks

.PHONY: $(REPO)
$(REPO):
	cd $@
	echo "Pulling $@ main branch"
	git stash
	git pull origin main
	echo "Fetching $@ tags"
	git fetch --tags
	echo "Checking out $@:$(VERSION)"
	git checkout $(VERSION)
	echo "Making $@ binary"
	make binary && \
	mv $@ ../cmd/bin
