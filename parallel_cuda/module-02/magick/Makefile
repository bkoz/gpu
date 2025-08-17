# 
# Makefile for CUDA and ImageMagick on RHEL
#
# yum install libomp-devel ImageMagick-c++-devel
#
# g++ `Magick++-config --cxxflags --cppflags` -o readWriteImages readWriteImages.cpp `Magick++-config --ldflags --libs`
# nvcc does not support the -fopenmp flag
#

CXX = nvcc

CXXFLAGS += -I/usr/include/ImageMagick-6 -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -Wno-deprecated-gpu-targets 
LDFLAGS += `Magick++-config --ldflags --libs`

all: clean build

build: 
	$(CXX) 00-readimage.cu --std c++17 -o 00-readimage -Wno-deprecated-gpu-targets $(CXXFLAGS) -I/usr/local/cuda/include -lcuda $(LDFLAGS)

run:
	./00-readimage $(ARGS)

clean:
	rm -f 00-readimage
	
