faye-metrics
============

A bit 'o' insight at just what your Faye server is up to.

NOTE: Makes use of the `ps` & `grep` commands on *nix operating systems (ie. Windows untested / unsupported)

ANOTHER NOTE: Developed against Ruby 2.0.0

Installation
============

This has been built against thin, and currently relies on a handful of gems:

    gem install pry thin faye sinatra rack

Start with:

    rackup -E production -s thin config.ru -p 9292

or

    thin start -R config.ru -p 9292

Credits
============

Thanks to [@kalv](http://twitter.com/kalv) ~~WIP: and Shopify for their Dashing framework~~.

Started by Charles Bergeron [@CharlesEllery](http://twitter.com/CharlesEllery) & Kalvir Sandhu. Inspired by [Medeo](https://medeo.ca).



# WIP:

## Send your Faye process data to NewRelic

### faye-metrics-newrelic-plugin install

1. Download or clone the latest version from `https://github.com/chuckbergeron/faye-metrics-newrelic-plugin/tags`
2. Extract to the location you want to run the agent from
3. Copy `config/template_newrelic_plugin.yml` to `config/newrelic_plugin.yml`
4. Edit `config/newrelic_plugin.yml` and replace "YOUR_LICENSE_KEY_HERE" with your New Relic license key
<!-- 5. Create a plugin in New Relic -->
5. run `./newrelic_example_agent`


# Warning:

                                            ..
                                         ,o""""o
                                      ,o$"     o
                                   ,o$$$                                 
                                 ,o$$$'
                               ,o$"o$'
                             ,o$$"$"'   
                          ,o$"$o"$"'    
                       ,oo$"$"$"$"$$`                      ,oooo$$$$$$$$oooooo.  
                    ,o$$$"$"$"$"$"$"o$`..             ,$o$"$$"$"'            `oo.o
                 ,oo$$$o"$"$"$"$  $"$$$"$`o        ,o$$"o$$$o$'                 `o
              ,o$"$"$o$"$"$"$  $"$$o$$o $$o`o   ,$$$$$o$"$$o'                    $
            ,o"$$"'  `$"$o$" o$o$o"  $$$o$o$oo"$$$o$"$$"$o"'                     $
         ,o$"'        `"$ "$$o$$" $"$o$o$$"$o$$o$o$o"$"$"`""o                   ' 
       ,o$'          o$ `"$"$o "$o$$o$$$"$$$o"$o$$o"$$$    `$$  
      ,o'           (     `" o$"$o"$o$$$"$o$"$"$o$"$$"$ooo|  `` 
     $"$             `    (   `"o$$"$o$o$$ "o$o"   $o$o"$"$    )
    (  `                   `    `o$"$$o$" "o$$     "o /|"$o"
     `                           `$o$$$$"" o$      "o$\|"$o'
                                  `$o"$"$ $ "       `"$"$o$
                                   "$$"$$ "oo         ,$""$ 
                                   $"$o$$""o"          ,o$"$
                                   $$"$$"$ "o           `,",
                         ,oo$oo$$$$$$"$o$$$ ""o           
                      ,o$$"o"o$o$$o$$$"$o$$oo"oo
                    ,$"oo"$$$$o$$$$"$$$o"o$o"o"$o o
                   ,$$$""$$o$,      `$$$$"$$$o""$o $o               
                   $o$o$"$,          `$o$"$o$o"$$o$ $$o             
                  $$$o"o$$           ,$$$$o$$o"$"$$ $o$$oo      ,   
                  "$o$$$ $`.        ,"$$o$"o$""$$$$ `"$o$$oo    `o
                  `$o$o$"$o$o`.  ,.$$"$o$$"$$"o$$$$   `$o$$ooo    $$ooooooo
                    `$o$"$o"$"$$"$$"$"$$o$$o"$$o"        `"$o$o            `"o
                       `$$"$"$o$$o$"$$"$ $$$  $ "           `$"$o            `o
                          `$$"o$o"$o"$o$ "  o $$$o            `$$"o          ,$
                             (" ""$"""     o"" "o$o             `$$ooo     ,o$$
                                  $$"""o   (   "$o$$$"o            `$o$$$o$"$'
                                    ) ) )           )  ) )            ` "'

This was a work in progress / proof of concept that never hit a true release, and I've since moved on to other projects. Enjoy as you will!

