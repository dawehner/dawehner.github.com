---
layout: post
title:  "Quickstarting Drupal 8"
date:   2018-05-03 00:00:00
comments: true
categories: drupal
---

Before and around Drupalcon Nashville there [was](https://www.drupal.org/project/ideas/issues/2956879) [a](https://dri.es/three-ways-we-can-improve-drupal-evaluator-experience) [lot](http://matthewgrasmick.com/compare-php-frameworks) of discussion around improving the first time experience.
Things we achieved for example is a new Drupal.org homepage with a clear focus on 3 different userstories.

One small work [we](https://www.drupal.org/project/drupal/issues/2911319) have been doing can be seen in the following video:


<iframe src="https://player.vimeo.com/video/267910793" width="640" height="386" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/267910793">Drupal quickstart</a> from <a href="https://vimeo.com/user7658757">daniel wehner</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

To summarize this video: It should be possible to start Drupal as quickly as possible:

* Download Drupal
* Execute a single command: <code>php core/scripts/drupal quick-start</code>
* Have a working Drupal opened upon a web browser automatically.

Having such a command is a big step forward.

For me there is a lot of new possibilities opened up:

* The technical evaluator experience is potentially easier now
* Installation profiles could have an easier time
* We maybe adapt this command to make the first time contribution sprints orders of magnitude easier

To try it out you need to execute the following steps:

{% highlight bash %}
- curl -sS https://ftp.drupal.org/files/projects/drupal-x.y.z.zip --output drupal-x.y.z.zip
- unzip drupal-x.y.z.zip
- cd /path/to/drupal-x.y.z
- php core/scripts/drupal quick-start
{% endhighlight %}

Please leave us feedback on Drupal.org  / twitter / Slack.


PS:
This was truely a team effort:

Chelsee
Chi
Mile23
Mixologic
alexpott 
andypost
borisson_
cashwilliams
danquah
dawehner
droffats
dsnopek
geerlingguy
gerzenstl
heddn
jonathanshaw
kim.pepper
larowlan
maxstarkenburg
mglaman
mradcliffe 
pbirk
phenaproxima
quietone
ressa
scotty
vaplas
yoroy

