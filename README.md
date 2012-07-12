Graph Object
============

Facebook Graph API Mapper

**Currently, Browser use only.**


## Status

Unstable


## Overview

    var me = new $GraphObject.User("/me", {locale: "ja_JP"});
    var me_name = me.get('name');
    var me_friends = [];
    me.request('/friends').done(function(friends) {
      me_friends = friends;
    });


## Requirements

* Facebook JavaScript SDK
* jQuery (ajax, deferred)


## Developers

If you want to build, you have to install grunt npm package.

    $ npm -g install grunt
    $ npm install
    # Build
    $ grunt --config ./grunt.coffee


## License

MIT License


## TODO

* node module
* more more tests
* remove dependency on jQuery


----

* Author: Keisuke SATO <sato@crocos.co.jp>

By Crocos Inc.

