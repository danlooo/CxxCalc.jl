.PHONY: main
main:
	earthly +main
	earthly --artifact +cxxcalc-julia/out out