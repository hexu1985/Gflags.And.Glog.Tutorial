
GFLAGS_ROOT_DIR=$(HOME)/local/gflags
GLOG_ROOT_DIR=$(HOME)/local/glog

RM = rm -f
CXX = g++
CXXFLAGS = -Wall -g -std=c++11
INCLUDES = -I$(GFLAGS_ROOT_DIR)/include -I$(GLOG_ROOT_DIR)/include
LDFLAGS = -lglog -lgflags -lpthread
LDPATH = -Wl,-rpath,"$(GFLAGS_ROOT_DIR)/lib:$(GLOG_ROOT_DIR)/lib" -Wl,--enable-new-dtags -L$(GFLAGS_ROOT_DIR)/lib -L$(GLOG_ROOT_DIR)/lib
VPATH = 

PROGS = sample_noflush sample_flush

all: $(PROGS)
	@echo "PROGS = $(PROGS)" 

clean:
	$(RM) $(PROGS)

sample_noflush: sample_noflush.cpp 
	$(CXX) -o $@ $(CXXFLAGS) $(INCLUDES) $^ $(LDFLAGS) $(LDPATH)

sample_flush: sample_flush.cpp 
	$(CXX) -o $@ $(CXXFLAGS) $(INCLUDES) $^ $(LDFLAGS) $(LDPATH)
