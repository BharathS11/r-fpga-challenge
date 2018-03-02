MAGENTA:=\033[0;35m
RED:=\033[0;31m
GREEN:=\033[0;32m
CLEAR:=\033[0m

all: test

testbench: *.v
	@echo "${MAGENTA}building...${CLEAR}"
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

testbench-solution:
	@echo "${MAGENTA}building pre-provided solution...${CLEAR}"
	iverilog -o testbench-solution testbench.v .solution/challenge.v

solution: testbench-solution
	@echo "${MAGENTA}running tests on pre-provided solution...${CLEAR}"
	@echo ./testbench-solution
	@./testbench-solution | tee .output.txt
	@if grep "assertion failed" .output.txt 1>/dev/null; then \
		echo "${RED}tests failed${CLEAR}";\
		exit 1;\
	else\
		echo "${GREEN}tests passed${CLEAR}";\
	fi

clean:
	@echo "${MAGENTA}cleaning...${CLEAR}"
	-rm -rf .output.txt testbench testbench.vcd testbench-solution
	-rm -rf *.fit.* *.flow.* *.jdi *.map.* *.pin *.qpf *.qsp *.qsf *.sld *.sof *.sta.* *.asm.* db/ incremental_db/
	@echo "${GREEN}succeeded${CLEAR}"

# for synthesis using free Quartus Lite toolchain
PROJECT:=challenge
TOP_LEVEL_ENTITY:=challenge.v
DEVICE_FAMILY:=Arria II
DEVICE_PART:=EP2AGX45CU17I3
PACKING_OPTION:=minimize_area

quartus-synth:
	@echo "${MAGENTA}building project with quartus lite 17.1...${CLEAR}"
	quartus_map ${PROJECT} --source="${TOP_LEVEL_ENTITY}" --family="${DEVICE_FAMILY}"
	quartus_fit ${PROJECT} --part="${DEVICE_PART}" --pack_register="${PACKING_OPTION}"
	quartus_asm ${PROJECT}
	quartus_sta ${PROJECT}
	@echo "${GREEN}succeeded${CLEAR}"
	@echo "${MAGENTA}=== fit report ===${CLEAR}"
	@-cat challenge.fit.summary
	@echo "${MAGENTA}=== timing report ===${CLEAR}"
	@-awk '/^; Clocks     /,/^$$/' challenge.sta.rpt | head -n 6 | tail -n 5

.PHONY: clean test all quartus-synth
