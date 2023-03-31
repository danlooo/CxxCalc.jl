.PHONY: main
main:
	earthly +main
	earthly --artifact +build/out out