CAT=cat
CP=cp
GIT=git
MARKDOWN=markdown
RM=rm

# BGC
BGC_SRC=../bgc/docs/html
BGC=bgc

# BGC++
BGCPP_SRC=../bgcpp/docs/html
BGCPP=bgcpp

PROJECT_ROOT=$(pwd)

INDEX_HTML=index.html
README_MD=README.md


.PHONY: all

all: clean build

build: homepage
# BGC
	cd ../$(BGC) && make clean && make docs && cd $(PROJECT_ROOT)
	cp -rf $(BGC_SRC) $(BGC)/
# BGC++
	cd ../$(BGCPP) && make clean && make docs && cd $(PROJECT_ROOT)
	cp -rf $(BGCPP_SRC) $(BGCPP)/

clean:
	$(RM) -rf $(BGC)/
	$(RM) -rf $(BGCPP)/
	$(RM) -f $(INDEX_HTML)

homepage:
	$(RM) -f $(INDEX_HTML)
	$(CP) src/header.htm $(INDEX_HTML)
	$(MARKDOWN) $(README_MD) >> $(INDEX_HTML)
	$(CAT) src/footer.htm >> $(INDEX_HTML)

publish:
	$(GIT) push -u origin main
