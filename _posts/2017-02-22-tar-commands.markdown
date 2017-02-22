# Tar modern usage

---
layout: post
title:  "How to use the tar command"
date:   2017-02-22 09:08:31
comments : true
categories: shell, unix
---

Tar (originally coming from Tape ARchive) is a common tool in the belt of both system adminstrators
and users of unix like systems. It allows you to create archives of files and extract them later.

Traditionally people learn it by copying examples, as we will see, remebering stuff is not that easy:

```
# Create / extract tar file
tar cf example.tar file folder file2
tar xf example.tar file
# Create / extract tar.gz file
tar zcf example.tar.gz file folder file2
tar zxf example.tar.gz
# Create / extract tar.bz2 file
tar jcf example.tar.bz2 file folder file2
tar jxf example.tar.bz2
# Create / extract tar.xz file
tar Jxf example.tar.xf file folder file2
tar Jcf example.tar.xf
```

As you might see, the parameters contain of three bits:

* f (you want to deal with a file instead of something from stdin/stdout)
* x (extract) or create/compress (c)
* z/j/J (deal with different file types). This one is certainly the hardest one to remember.

It turns out, you don't actually have to bother with it. Modern version of tar (both the BSD and GNU version)
extract the filetype out of the file extension you specify.
So all you need for the examples above is:

```
# Create / extract tar file
tar cf example.tar file folder file2
tar xf example.tar file
# Create / extract tar.gz file
tar cf example.tar.gz file folder file2
tar xf example.tar.gz
# Create / extract tar.bz2 file
tar cf example.tar.bz2 file folder file2
tar xf example.tar.bz2
# Create / extract tar.xz file
tar xf example.tar.xf file folder file2
tar cf example.tar.xf
``` 


TL;DR; Forget about jJz on tar, it is not needed.

Final tip: If you want to see which files got extracted, put "v" on it as well.
