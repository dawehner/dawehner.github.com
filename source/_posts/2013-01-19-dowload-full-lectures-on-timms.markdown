---
layout: post
title: "Dowload full lectures on timms"
date: 2013-01-19 10:31
comments: true
categories: [Physics, Tuebingen, Python]
---
The university of tuebingen allows you to watch a limited amount of lectures
on a multimedia server called "timms", see http://timms.uni-tuebingen.de

As every topic is splitted into lectures it's quite annoying to download/look all
of them, so let's write a script that downloads them all.

This small blog entry describes the process of how to solve such a problem.

## First steps

The first steps has been to look at the actual urls, here are the ones from the first two.

{% codeblock %}
http://timms.uni-tuebingen.de/Player/AccessASF.aspx?ref=mms%3a%2f%2fu-003-stimms03.uni-tuebingen.de%2fUT_2006%2f10%2f18%2fUT_20061018_001_exphys7_0001.wmv500.wmv&starttime=0.0&title=Vorlesung+Experimentalphysik+VII%2c+1.+Stunde&copyright=%c2%a92006+Universit%c3%a4t+T%c3%bcbingen%2c+duplication+and+capturing+prohibited
{% endcodeblock %}

As you see pretty much nothing is important beside the string after ?ref=,
so let's unescape it:

{% codeblock lang:python %}
import urllib

urllib.unquote("mms%3a%2f%2fu-003-stimms03.uni-tuebingen.de%2fUT_2006%2f10%2f18%2fUT_20061018_001_exphys7_0001.wmv500.wmv")

> mms://u-003-stimms03.uni-tuebingen.de/UT_2006/10/18/UT_20061018_001_exphys7_0001.wmv500.wmv
> mms://u-003-stimms03.uni-tuebingen.de/UT_2006/10/18/UT_20061018_002_exphys7_0001.wmv500.wmv
> mms://u-003-stimms03.uni-tuebingen.de/UT_2006/10/19/UT_20061019_001_exphys7_0001.wmv500.wmv

{% endcodeblock %}

The schema so of the urls are pretty clear: servername/some semester/month/day/bla_$piece$_name.wmv500.wmv.

## Find all the download urls

In order to find all this different links, let's go to the [overview page](http://timms.uni-tuebingen.de/List/List01.aspx?rpattern=UT_200[67]_____00[12]_exphys7_000_)
and start to parse it with pyquery.

{% codeblock lang:python %}
from pyquery import PyQuery as pq

# Download the timms overview page.
py = pq(url="http://timms.uni-tuebingen.de/List/List01.aspx?rpattern=UT_200[67]_____00[12]_exphys7_000_")
{% endcodeblock %}

As you will see there are images with the following schema on the page:
"jtimms/images/UT_2006/10/18/UT_20061018_001_..." with the needed urls, pretty useful.

Now the only thing left is to get all the links and run an mplayer dump command on it,
and 

{% codeblock lang:python %}

urls = []
# The goal is to find all urls needed to download, but they are part of the images.
for image in py.find("table#content").find("img"):
    src = image.attrib['src']
    if src.find("jtimms") != -1:
        url_part = src.replace("/jtimms/images/", "").replace(".prev.jpg", "")
        url = "mms://u-003-stimms03.uni-tuebingen.de/{}.wmv500.wmv".format(url_part)
        urls.append(url)

{% endcodeblock %}

## Catch them all

The final step is to dump them all into video files, this example uses mplayer
for that.

{% codeblock lang:python %}
import os
import subprocess

# We scanned the site from top to the bottom.
urls.reverse()

counter = 0
for url in urls:
    counter = counter + 1
    subprocess.Popen(['mplayer', '-dumpstream', '-dumpfile', "video-{}.wmv".format(counter), url])
{% endcodeblock %}


The final notebook can be found under [a gist](https://gist.github.com/4571983)

