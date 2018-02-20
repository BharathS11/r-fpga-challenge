MAGENTA:=\033[0;35m
RED:=\033[0;31m
GREEN:=\033[0;32m
CLEAR:=\033[0m

all: test

testbench: *.v
	@echo "${MAGENTA}running build...${CLEAR}"
	iverilog -o testbench *.v
	@echo "${GREEN}succeeded${CLEAR}"

test: testbench
	@echo "${MAGENTA}running tests...${CLEAR}"
	@echo ./testbench
	@./testbench | tee .output.txt
	@if grep "assertion failed" .output.txt 1>/dev/null; then \
		echo "${RED}tests failed${CLEAR}";\
		exit 1;\
	else\
		echo "${GREEN}tests passed${CLEAR}";\
	fi

clean:
	@echo "${MAGENTA}cleaning...${CLEAR}"
	-rm -rf .output.txt testbench testbench.vcd
	@echo "${GREEN}succeeded${CLEAR}"

.PHONY: clean test all
