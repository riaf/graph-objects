##
# base.coffee
#
# @author Keisuke SATO <sato@crocos.co.jp>
#

class GraphObject
  props: {}
  _changed_keys: []
  options: {}

  constructor: (@path, @options) ->
    @sync @path

  get: (name, default_value) ->
    if name of @props
      default_value = @props[name]

    default_value

  set: (name, value) ->
    if @get(name) != value
      @_changed_keys[@_changed_keys.length] = name

    @props[name] = value

  save: ->
    throw "save methods are not supported yet."

  sync: (path, options) ->
    dfd = new jQuery.Deferred
    path ?= @path
    options ?= @options

    FB.api path, options, (response) =>
      if @is_error_response response
        dfd.reject @, response
      else
        if "data" of response
          @props = response.data
        else
          @props = response

        if @validate()
          dfd.resolve @
        else
          dfd.reject @

    dfd.promise()

  request: (path, options) ->
    dfd = new jQuery.Deferred
    path = "#{ @path }#{ path }"
    options ?= @options

    FB.api path, options, (response) =>
      if @is_error_response response
        dfd.reject @, response
      else
        if "data" of response
          ret = response.data
        else
          ret = response

        dfd.resolve ret

    dfd.promise()

  validate: ->
    false

  is_error_response: (response) ->
    "error" of response


@$GraphObject = {}
@$GraphObject.Base = GraphObject

