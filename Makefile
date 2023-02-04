.PHONY: format ## format code
format:
	dart format .
	dart fix --apply