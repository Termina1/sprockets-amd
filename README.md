sprockets-amd
============

Simple preprocessor for JavaScript files for adding AMD style definitions

There are three easy steps to start using it:

### 1. Configure prefix

Sometimes you want to add namespace for your coffee class names:

```ruby
SprocketsAmd.configure do |config|
  config[:prefixes] = ["App"]
end
```

Now you can use ```AMD.require.App.Testclass``` and ```AMD.module.App.Testclass```

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
class AMD.module.Test
  someAction: ->
```
Second, prefix your dependencies:

``` coffee-script
class Test
  someAction: ->
    new machina.Fsm
```
should become
``` coffee-script
class Test
  someAction: ->
    new AMD.require.machina.Fsm
```

## You're good to go!
Now we will do the rest to make the file AMD-compatible.
