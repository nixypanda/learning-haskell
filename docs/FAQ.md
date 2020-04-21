# FAQ Guide

## Demystifying stack installation with cURL

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

With the available header information, We can now see the actual location of our script.


## Leaving GHCi

To leave GHCI, we can use a vim-style strategy:
```shell script
> :quit
Leaving GHCi.
```
 Or, even better:
 ```shell script
 > :q
 Leaving GHCi.
 ```