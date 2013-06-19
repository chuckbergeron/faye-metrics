faye-metrics
============

A bit 'o' insight at just what your Faye server is up to.

Installation
============

This has been built against thin, and currently relies on a handful of gems:

    gem install pry thin faye sinatra rack

Start with:

    rackup -E production -s thin config.ru -p 9292

or

    thin start -R examples/ruby/config.ru -p 9292

Credits
============

Thanks to [@kalv](http://twitter.com/kalv) ~~WIP: and Shopify for their Dashing framework~~.

Started by Charles Bergeron [@CharlesEllery](http://twitter.com/CharlesEllery) & Kalvir Sandhu. Inspired by [Medeo](https://medeo.ca).