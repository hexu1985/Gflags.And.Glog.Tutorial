
GFLAGS_ROOT_DIR=$(HOME)/local/gflags

RM = rm -f
CXX = g++
CXXFLAGS = -Wall -g -std=c++11
INCLUDES = -I$(GFLAGS_ROOT_DIR)/include
LDFLAGS = -lgflags -lpthread
LDPATH = -Wl,-rpath,$(GFLAGS_ROOT_DIR)/lib -Wl,--enable-new-dtags -L$(GFLAGS_ROOT_DIR)/lib
VPATH = 

SOURCES = $(shell ls *.cpp)
PROGS = sample

all: $(PROGS)
	@echo "PROGS = $(PROGS)" 

clean:
	$(RM) $(PROGS)

$(PROGS): $(SOURCES) $(LIB_SOURCES)
	$(CXX) -o $@ $(CXXFLAGS) $(INCLUDES) $^ $(LDFLAGS) $(LDPATH)
