# Makefile

# [target]: [Dependencies]
#	[commands {separated by tab}]

CXX=g++
DEPENDENCIES=rom_builder.cpp
EXE=build_rom
# REMOVE=

all: clean ${EXE}

${EXE}: ${DEPENDENCIES}
	${CXX} -std=c++11 -o ../$@ $^

# $@ ··· [target]
# $^ ··· {Dependencies}

clean:
	rm -f *.o ../${EXE}
# ${REMOVE}
