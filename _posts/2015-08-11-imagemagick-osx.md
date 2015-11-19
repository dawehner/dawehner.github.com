
---
title: Imagemagick broken on OSX
tags:
    - OSX
    - PHP
categories:
    - tech
---

When I tried to update some packages via homebrew I ran into the problem that imagemagick
did not worked anymore, so what was the problem?

<code>
User error: ImageMagick error 5: dyld: Library not loaded: /usr/local/lib/liblzma.5.dylib Referenced from: /usr/local/bin/convert Reason: Incompatible library version: convert requires version 8.0.0 or later, but liblzma.5.dylib provides version 6.0.0
</code>
