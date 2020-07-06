# Makefile #

###############################################################################

#TOOL INPUT
TESTBENCH = BrainFuzz.tb.v
EXE = BrainFuzz
DUMP = dump.vcd

###############################################################################

#TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave
#TOOL OPTIONS
COFLAGS = -o
SFLAGS = 
SOUTPUT = -lxt		#SIMULATOR OUTPUT TYPE
#TOOL OUTPUT
COUTPUT = compiler.out			#COMPILER OUTPUT


###############################################################################


# #MAKE DIRECTIVES
all: clean ${EXE}

rom_builder:
	

${EXE} : ${TESTBENCH}
	$(COMPILER) ${COFLAGS} $@ $^

run: $(EXE)
	$(SIMULATOR) $(SFLAGS) $^

display: $(EXE)
	$(VIEWER) $(DUMP) &

clean:
	rm -f $(EXE) $(DUMP)
