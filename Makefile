

images:
	for f in versions/*; do \
          version=`basename $$f`;   \
          (cd $$f && docker build -t emacs-$$version .); \
        done

