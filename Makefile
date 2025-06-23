PROJECT_SOURCE_DIR := $(abspath ./)
BUILD_DIR ?= $(PROJECT_SOURCE_DIR)/build
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Linux)
    NUM_JOB := $(shell nproc)
else ifeq ($(UNAME_S), Darwin)
    NUM_JOB := $(shell sysctl -n hw.ncpu)
else
    NUM_JOB := 1
endif

CLANG_PATH ?= clang
CLANG_PATH := $(or $(CIELLAB_CLANG),$(CLANG_PATH))
CLANGXX_PATH ?= clang++
CLANGXX_PATH := $(or $(CIELLAB_CLANGXX),$(CLANGXX_PATH))

clean:
	rm -rf $(BUILD_DIR)
.PHONY: clean

clang_test_build:
	cmake -S . -B $(BUILD_DIR)/clang \
 		  -DCMAKE_C_COMPILER=$(CLANG_PATH) \
 		  -DCMAKE_CXX_COMPILER=$(CLANGXX_PATH) \
 		  -DCMAKE_CXX_FLAGS="-stdlib=libc++" && \
	cmake --build $(BUILD_DIR)/clang \
		  --target test_test \
  		  -j $(NUM_JOB)

clang_test_run:
	$(BUILD_DIR)/clang/test/test_test

clang_test: clang_test_build clang_test_run

test: clang_test
.PHONY: test