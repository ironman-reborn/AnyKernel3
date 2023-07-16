NAME ?= Venom-Kernel
DATE := $(shell date "+%d%m%Y-%I%M")

LINUX_VERSION ?= 4.9

SZIP := $(NAME)-vince-$(LINUX_VERSION)-STABLE-$(DATE).zip
BZIP := $(NAME)-vince-$(LINUX_VERSION)-BETA-$(DATE).zip
TZIP := $(NAME)-vince-$(LINUX_VERSION)-TEST-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *.zip* README.md *placeholder ramdisk* patch*

stable: $(SZIP)
beta: $(BZIP)
test: $(TZIP)

$(SZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
$(BZIP):
	@echo "Creating ZIP: $(BZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
$(TZIP):
	@echo "Creating ZIP: $(TZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."		

clean:
	@rm -vf *.zip*
	@rm -vf Image.gz-dtb
	@echo "Done."
