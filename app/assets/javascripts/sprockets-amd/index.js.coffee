window.require_package = (pack, deps, callback) ->
  require [pack], ->
    define pack, ->
    require deps, callback