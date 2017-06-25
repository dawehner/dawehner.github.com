---
layout: post
title:  "Playing around with graphql"
date:   2017-06-25 00:00:00
categories: graphql decoupled contentacms
---
As part of my work on [Contentacms](http://contentacms.io) I played a bit around with [graphql for Drupal](https://github.com/fubhy/graphql-drupal).

Here is a short experience report of the first steps.

## Installation

The module was easy to install:

{% highlight bash %}
composer require drupal/graphql
{% endhighlight %}

Once this was done, <code>modules/graphql</code> and especially <code>modules/graphql/modules</code> was filled.

## Usage

Reading the [readme](https://github.com/fubhy/graphql-drupal/blob/8.x-3.x/README.md), which points to [another readme](https://github.com/fubhy/graphql-drupal/blob/8.x-3.x/modules/README.md), it was clear which modules are needed:

* graphql_core
* graphql_content
* graphql_entity_reference
* graphql_file
* graphql_image

## Experiments

Disclaimer: I would have known how to use graphql, but I try to play the ignorant person here ...

I heard the module comes with an explorer on <code>/graphql/explorer</code>, so here is a first impression.

I wrote <code>{}</code> and pressed tab in the middle:

![Graphql autocompletion][graphql_explorer_1]

Its hard to deny, this is a REALLY nice experience.

As next step my goal was to select a single node. The former
autocompletion has <code>nodeById</code>, so let's type that and see again. It asked me to provide an id and a language and wow, here is the data:

![Graphql autocompletion nodeById][graphql_explorer_2]

As last step for this blogpost I try to get more fields from recipes ...

Clicking throught the repo I found
<code>https://github.com/fubhy/graphql-drupal/blob/8.x-3.x/modules/graphql_content/tests/queries/rendered_fields.gql</code> and the syntax <code> ... on NodeTest {</code>, so let's use that:

![Graphql autocompletion ... on NodeRecipe][graphql_explorer_3]

## Summary

Is Graphql in Drupal ready to be used? I can't say that, but it is in a better state than it ever was. Fubhy and others have made good progress!

I'm looking forward to write more blog posts about my experiments. 

[graphql_explorer_1]: {{ "/assets/images/graphql_1.jpg" | prepend: site.baseurl }} "Graphql1"
[graphql_explorer_2]: {{ "/assets/images/graphql_2.jpg" | prepend: site.baseurl }} "Graphql2"
[graphql_explorer_3]: {{ "/assets/images/graphql_3.jpg" | prepend: site.baseurl }} "Graphql3"

