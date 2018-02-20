# /r/fpga challenge
Welcome to the /r/fpga weekly challenge!

## How to compete
To get started, fork this repository, and download it with git. (See https://help.github.com/articles/fork-a-repo/ if you don't know what that means.)

Each week's challenge is in that week's folder, with subfolders for languages (for example, `challenges/week1/verilog`). Go into that folder and edit away! You're welcome to use whatever tools to develop the code that you want. We provide Makefiles that use open source toolchains for simulation, for example [icarus](http://iverilog.icarus.com/) for verilog and [ghdl](http://ghdl.free.fr/) for VHDL. You should install these tools; you can then run `make test` to run the testbench with these tools. (You can also use Docker to run these tools; see the `Running with docker` section below :)

When you're ready to submit, commit your code, push to your fork, and make a Pull Request against this repository. (If you don't know what that means, see https://help.github.com/articles/about-pull-requests/ ). Your code will be automatically tested, and you can see if it passes the tests! If it does, you can comment in the weekly `/r/fpga` thread and, like, brag or whatever.

Note that we will never actually *merge* your PR, because this repository is supposed to only have project templates. You can leave it open, though, and reuse it next week.

To update the code when a new challenge releases, run `git remote add upstream https://github.com/kazimuth/r-fpga-challenge && git pull upstream master`. 

## Running with docker
If for some reason you're having trouble running things locally, or you want to make sure that your code works the same as when you submit, you can run with docker. Docker lets you run a virtual machine that has all of the tools you'll need to build the project. Note that the docker image will be somewhat large (around a gigabyte), because it has a lot of build tools installed.

First, [Install Docker](https://docs.docker.com/install/), which supports windows 10, mac, and linux. (If you're on an earlier Windows version, or Windows 10 Home, you can try installing Docker Machine from [Here](https://docs.docker.com/toolbox/overview/).)

Once you've got docker working, go into the folder for this week, and run in a terminal:

`docker run -v $(pwd):/project -it kazimuth2/r-fpga-challenge`

This will download some things and then spit you out into a terminal. You can now run `make test`, and things should Just Work. If they don't, post in the reddit thread and ask for help.

## FAQ
### Can I use [XYZ professional tool]?
Yeah, sure

### Can I use an IP from [XYZ professional tool]?
Your code probably won't pass the tests if it can't build with our Makefiles, and you definitely shouldn't be committing licensed IPs to git. Anyway, the point is to code things yourself ;)

### Can I license the code I submit?
This folder has an MIT license in it, so your code will too, unless you swap out the license in your fork.

### Isn't this all kinda jank?
is anything about FPGA development not jank
