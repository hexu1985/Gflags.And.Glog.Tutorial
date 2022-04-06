
GFLAGS_ROOT_DIR=$(HOME)/local/gflags
GLOG_ROOT_DIR=$(HOME)/local/glog

RM = rm -f
CXX = g++
CXXFLAGS = -Wall -g
INCLUDES = -I$(GFLAGS_ROOT_DIR)/include -I$(GLOG_ROOT_DIR)/include
LDFLAGS = -lglog -lgflags -lpthread
LDPATH = -Wl,-rpath,"$(GFLAGS_ROOT_DIR)/lib:$(GLOG_ROOT_DIR)/lib" -Wl,--enable-new-dtags -L$(GFLAGS_ROOT_DIR)/lib -L$(GLOG_ROOT_DIR)/lib

SOURCES = $(shell ls *.cpp)
PROGS = $(SOURCES:%.cpp=%)

all: $(PROGS)
	@echo "PROGS = $(PROGS)" 

clean:
	$(RM) $(PROGS) log/*

%: %.cpp
	$(CXX) -o $@ $(CXXFLAGS) $(INCLUDES) $^ $(LDFLAGS) $(LDPATH)
