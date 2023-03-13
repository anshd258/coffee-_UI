.PHONY: format ## format code
format:
	dart format .
	dart fix --apply
	
.PHONY: build ## build code
build:
	flutter pub get
	flutter packages pub run build_runner build
	flutter build apk