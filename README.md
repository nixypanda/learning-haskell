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

Well, there's a good reason for using the _-L_ flag with our [cURL](http://www.mit.edu/afs.new/sipb/user/ssen/src/curl-7.11.1/docs/curl.html) here. That's because the URL used here responds with a 302 (redirection) HTTP status code, and we need to follow through the redirection.

To dive deeper into this concept, we can look at the header information by using the -D flag:

```shell script
$ curl -is -o /dev/null -D - https://get.haskellstack.org/

HTTP/2 302
server: nginx/1.17.8
date: Mon, 20 Apr 2020 15:55:07 GMT
content-type: text/html
content-length: 145
location: https://raw.githubusercontent.com/commercialhaskell/stack/stable/etc/scripts/get-stack.sh
```

With the header information available to us, We can now see the actual location of our script.

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

At any minute, if we want, we can do a vim-style exit:
```shell script
> :quit
Leaving GHCi.
```


## Project Setup
We can start with the usual [forking and cloning](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)  of this repository. After that, we should be able to build and test our project using _stack_:

```shell script
$ cd learning-haskell
$ stack build --test
```

## Are We Ready?

Hey!<br> 
Say Aye, <br>or Yay!


## References
[Official Documentation: stack Installation ](https://docs.haskellstack.org/en/stable/README/#how-to-install) 

