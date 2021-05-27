REPO=probr kubernetes aks

.PHONY: $(REPO)
$(REPO):
	cd $@ && \
	git stash && git pull origin main && \
	git fetch --tags && \
	git checkout $(VERSION) && \
	make binary && \
	mv $@ ../cmd/bin
