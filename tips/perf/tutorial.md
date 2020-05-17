# Installation

##  Method 1: Get Source Code from APT

Stolen from answer: https://stackoverflow.com/questions/33057653/perf-enable-demangling-of-callgraph/34061874#34061874

```
sudo apt-get install libiberty-dev binutils-dev
mkdir ~/install
cd ~/install
# If the following apt-get doesn't work on your system,
# uncomment deb-src lines in your /etc/apt/sources.list, and run 
# `sudo apt-get update`
# as suggested by @ctitze
# or you can download it manually from packages.ubuntu.com
# as @aleixrocks suggested in the comment below
apt-get source linux-tools-`uname -r`
sudo apt-get build-dep linux-tools-`uname -r`
cd linux-`uname -r | sed 's/-.*//'`/tools/perf
make

# now you should see the new "perf" executable here
./perf
```

## Method 2: Get Source Code from git

TBD

# Usage Example

Run the sample code which contains a infinite loop

```
SHARED_LIB=shared_lib.so
OUTPUT=perf_test.out

g++ -std=c++14 -shared -fvisibility=hidden -o ${SHARED_LIB} -fPIC shared_lib.cc
g++ -std=c++14 main.cc -o ${OUTPUT} -L. shared_lib.so
./${OUTPUT}
```

Get the code's PID and run the commands to record cpu-clock in call stack fashion and read result:

- Note that a.out is not stripped, thus the report will contain detailed function (symbols) name
- For stripped a.out (`strip a.out`), the function name will not be displayed, instead hex fn
  address is displayed and not readible


```
OUTPUT=perf_test.out

sudo perf record -F 99 -ag -e cpu-clock,page-faults,block:block_rq_issue,major-faults,minor-faults,syscalls:sys_enter_mmap --call-graph dwarf -p `pgrep ${OUTPUT}`

sudo perf report
```
