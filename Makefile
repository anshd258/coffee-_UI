.PHONY: format ## format code
format:
	dart format .
	dart fix --apply
	flutter packages pub run build_runner build
	flutter build apk