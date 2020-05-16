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

# Example

Run the sample code which contains a infinite loop

```
g++ -std=c++14 main.cc && ./a.out
```

Get the code's PID and run the commands to record and read result:

```
sudo perf record -F 99 -ag -e cpu-clock --call-graph dwarf -p $PID

sudo perf report --stdio
```
