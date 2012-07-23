CURRENT_BRANCH = $(shell git name-rev --name-only HEAD)
ifndef CURRENT_BRANCH
CURRENT_BRANCH = $(error Could not get current branch.)
endif

DATE=$(shell date)

deploy:
ifneq ("${CURRENT_BRANCH}", "gh-pages")
	git branch -D gh-pages
	git checkout -b gh-pages
	sass --scss --style compressed --quiet stylesheets/base.scss stylesheets/base.css
	rm stylesheets/*.scss
	rm Procfile
	rm README.org
	rm Makefile
	rm .gitignore
	@echo "#*" >> .gitignore
	@echo "*~" >> .gitignore
	@echo "*.scss" >> .gitignore
	@echo ".sass-cache" >> .gitignore
	git add .
	git add -u
	git commit -m "Automatic deploy on $(DATE)."
	git push --force origin gh-pages
	git checkout ${CURRENT_BRANCH}
else
	@echo "not on this branch, bro"
endif
