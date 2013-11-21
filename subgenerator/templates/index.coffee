yeoman = require 'yeoman-generator'

module.exports = class <%= _.classify(generatorName) %>Generator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->

    # By calling `NamedBase` here, we get the argument to the subgenerator call
    # as `this.name`.
    yeoman.generators.NamedBase.apply this, arguments
    console.log "You called the <%= generatorName %> subgenerator with the argument #{@name}."

  files: ->
    @copy 'somefile.coffee', 'somefile.coffee'
