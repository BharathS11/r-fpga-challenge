# [/r/fpga](https://reddit.com/r/fpga) challenge

Let's write some circuits!

## How to compete
First, [fork this repository](https://help.github.com/articles/fork-a-repo/).

```
$ git clone https://github.com/[MYUSERNAME]/r-fpga-challenge
$ cd r-fpga-challenge
```

Each week's challenge has a template in the folder `challenge/week[N]/[language]`; for example, `challenge/week1/verilog`.

To run using the open-source toolchain:
```
$ cd challenge/week[N]/[language]/
$ make
```
See the [open-source toolchains](#open-source-toolchains) section for install information.
You can also [run open-source toolchains in a docker vm](#running-with-docker) for highly repeatable builds.
Or, you can run with whatever your preferred toolchain is.

Implement the interface for the week's challenge using with whatever toolchain you want. The interface will be in `challenge.v` or `challenge.vhdl`. Once you've got it running, the testbench should pass:

```
$ make
tests passed
```

Then, you can commit and push to your repo:

```
$ git commit -am "Finished this week's challenge!"
$ git push origin master
```

Then, make a [pull request to this repository](https://help.github.com/articles/about-pull-requests/). Your code will be automatically tested with an open-source toolchain. If it does, you've completed the challenge! You can comment in the weekly `/r/fpga` thread and, like, brag or whatever.

Note that we will never actually *merge* your PR, because this repository is supposed to only have project templates. You can leave it open, though, and reuse it next week.

To update the code when a new challenge releases:
```sh
git remote add upstream https://github.com/kazimuth/r-fpga-challenge
git pull upstream master
```
This should add new weeks to your repo.

## Open-source toolchains
Note: on windows, you should probably install [MinGW](http://www.mingw.org/) and use the mingw shell. Alternatively, [use docker](#running-with-docker).

If you [use docker](#running-with-docker), all of these toolchains will be installed in the VM.

### Verilog
You'll need to install [icarus verilog](http://iverilog.wikia.com/wiki/Installation_Guide) and put it on your PATH, or run with Docker.

Files: 
- `challenge.v`: the interface for your component
- `testbench.v`: the testbench

### VHDL
...TODO...

### Other toolchains
...TODO...

## Running with docker
Docker is basically a lightweight VM tool. When you submit your results with a pull request, they'll be run in Docker.

First, [Install Docker](https://docs.docker.com/install/), which supports windows 10, mac, and linux. (If you're on an earlier Windows version, or Windows 10 Home, you can installing Docker Machine from [Here](https://docs.docker.com/toolbox/overview/) instead.)

To run docker:

```sh
cd r-fpga-challenge
docker run -v $(pwd):/project -it kazimuth2/r-fpga-challenge
```

This will give you a shell in a Debian Linux VM with the tools you need installed. Its file system will be in sync with your machine's; your `r-fpga-challenge` folder is mounted at `/project` in the VM. That means that you can edit in whatever editors you have on your system and just run builds in the VM.

Note that the VM image is somewhat large (up to 1GB) because it has a bunch of tools installed (icarus, ghdl, verilator, probably java, scala and python eventually...)

You can update your VM image: 
`docker pull kazimuth2/r-fpga-challenge`.

You can clean up old images:
```
docker container prune
docker image prune
```

## FAQ
### Can I use [XYZ professional tool]?
Yeah, sure

You'll have to set up the project files yourself though. Just run the testbench file.

### Can I use an IP from [XYZ professional tool]?
Your code probably won't pass the tests if it can't build with our Makefiles, and you definitely shouldn't be committing licensed IPs to git. Anyway, the point is to code things yourself ;)

### Can I license the code I submit?
This folder has an MIT license in it, so your code will too, unless you swap out the license in your fork.

### Can I make a pull request that isn't a submission?
Sure! If you want to make an actual pull request - like, one that isn't a submission - just include "actual" in the name of your branch, for instance `actual-fixnewlines` or `actual-addchisel`. The CI will then run tests on pre-provided solutions in your PR, and test all of the code in the repo.

### Can I add a new language?
Sure! Your language should be put in its own folder, and have a Makefile, where the default target runs tests on the challenge template, and the target named `cheat` runs tests on a pre-provided solution. If possible, you should put the pre-provided solution in some kind of "hidden" folder (e.g. `.solution` for the verilog template), so that users don't have to look at it if they're not trying to.

You should also add the language to the Dockerfile. There must be a free, repeatable way to install the language; but we don't require that the language is fully open-source / GPL or anything like that.

### Isn't this all kinda jank?
is anything about FPGA development not jank

