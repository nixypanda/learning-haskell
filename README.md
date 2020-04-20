# Learning Haskell at [Shuttl](http://shuttl.com/)

###### A Lecture Series by [Sherub Thakur](https://github.com/sherubthakur), a Haskell Lover! 


## Prerequisite Setup
To work with _Haskell_, we'll first need to set it up. Further, there're multiple ways to go about doing it. 
Let's start with a simple one, which is friendly for beginner programmers:

### stack Installation
We can use a tool called _stack_ to work on our _Haskell_ projects. So, of course, we need to install it before we can go any further.

One easy way to install _stack_ involves executing a _.sh_ script:
```shell script
$ curl -sSL https://get.haskellstack.org/ | sh
```
###### To learn more about this, refer to the [FAQ guide.](docs/FAQ.md)

## Glasgow Haskell Compiler and stack

Let's start by running ghci, the [GHC](https://www.haskell.org/ghc/) executable:
```shell script
$ stack ghci
```
Diving deep into this is a bit out of scope for this README. But, it's all very interesting. Go and read it!

### Hello, World! using REPL  

Now, let's do a simple ["Hello, World!"](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program) thing using REPL, so as to ensure that things are running ok:

```shell script
> print("Hello, World!")
"Hello, World!"
```

## Project Setup
We can start with the usual [forking and cloning](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)  of this repository. After that, we should be able to build and test our project using _stack_:

```shell script
$ cd learning-haskell
$ stack test
```

## Are We Ready?

Hey!<br> 
Say Aye, <br>or Yay!


## References
[Official Documentation: stack Installation ](https://docs.haskellstack.org/en/stable/README/#how-to-install) 

