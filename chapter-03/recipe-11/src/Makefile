
RM = rm -rf
CXX = g++
CXXFLAGS = -Wall -g -std=c++11
INCLUDES = -I$(HOME)/local/include
LDFLAGS = -lglog -lgflags -lpthread
LDPATH = -L$(HOME)/local/lib
VPATH = 

SOURCES = $(shell ls *.cpp)
PROGS = sample

all: $(PROGS)
	@echo "PROGS = $(PROGS)" 

clean:
	$(RM) $(PROGS) ./log

$(PROGS): $(SOURCES) $(LIB_SOURCES)
	$(CXX) -o $@ $(CXXFLAGS) $(INCLUDES) $^ $(LDFLAGS) $(LDPATH)
