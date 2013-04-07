sprockets-amd
============

Simple preprocessor for JavaScript files for adding AMD style definitions

There are three easy steps to start using it:

### 1. Configure prefix

TODO

### 2. Rename your file

Just add ```.amd``` extension to your js file. For example, ```test.js.coffee``` should become ```test.js.amd.coffee```.

### 3. Add some code

First, choose the module name:

``` coffee-script
class Test
  someAction: ->
```
should become

``` coffee-script
class AMD.require.Test
  someAction: ->
```
Second, prefix your dependencies:

``` coffee-script
class Test
  someAction: ->
    new machina.Fsm
```
shoul become
``` coffee-script
class Test
  someAction: ->
    new AMD.require.machina.Fsm
```

## You're good to go!
Now we will do the rest to make the file AMD-compatible.
