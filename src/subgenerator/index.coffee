yeoman = require 'yeoman-generator'

module.exports = class SubGeneratorGenerator extends yeoman.generators.NamedBase
  constructor: ->
    yeoman.generators.NamedBase.apply this, arguments
    unless @name
      @log.error 'You have to provide a name for the subgenerator.'
      process.exit 1
    @generatorName = @name
    @dirname = @_.dasherize @name

  template: ->
    @mkdir @dirname
    @mkdir "#{@dirname}/templates"
    @copy 'index.js', "#{@dirname}/index.js"
    @copy 'index.coffee', "#{@dirname}/index.coffee"
    @copy 'templates/somefile.coffee', "#{@dirname}/templates/somefile.coffee"
