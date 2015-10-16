# Toolbox

Toolbox is a collection of tools. The tools are:

* [Planner](https://github.com/learning-on-chip/planner),
* [Recorder](https://github.com/learning-on-chip/recorder), and
* [Streamer](https://github.com/learning-on-chip/streamer).

## Installation

Clone:

```bash
git clone https://github.com/learning-on-chip/toolbox.git --recursive
```

Compile:

```bash
cd toolbox && make
```

Add the `bin` directory to the `PATH` environment variable:

```bash
export PATH="`pwd`/bin:$PATH"
```

Add the `lib` directory to the `DYLD_LIBRARY_PATH` (OS X) or `LD_LIBRARY_PATH`
(GNU/Linux) environment variable:

```bash
export DYLD_LIBRARY_PATH="`pwd`/lib:$DYLD_LIBRARY_PATH"
```
