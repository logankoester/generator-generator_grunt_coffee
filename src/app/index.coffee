path = require 'path'
util = require 'util'
yeoman = require 'yeoman-generator'
GitHubApi = require 'github'
github = new GitHubApi version: '3.0.0'

extractGeneratorName = (_, appname) ->
  slugged = _.slugify appname
  match = slugged.match /^generator-(.+)/
  if match and match.length is 2
    match[1].toLowerCase()
  else
    slugged

githubUserInfo = (name, cb) ->
  github.user.getFrom
    user: name
  , (err, res) ->
    throw err if err
    cb JSON.parse JSON.stringify res

module.exports = class GeneratorGeneratorcs extends yeoman.generators.Base
  constructor: (args, options) ->
    yeoman.generators.Base.apply this, arguments
    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'
    @currentYear = (new Date()).getFullYear()
    @on 'end', ->
      @npmInstall() unless options['skip-install']

  askFor: ->
    done = @async()
    generatorName = extractGeneratorName @_, @appname

    # have Yeoman greet the user.
    console.log @yeoman
    prompts = [
      name: 'githubUser'
      message: 'Would you mind telling me your username on Github?'
      default: 'someuser'
    ,
      name: 'generatorName'
      message: 'What\'s the base name of your generator?'
      default: generatorName
    ]

    @prompt prompts, (props) =>
      @githubUser = props.githubUser
      @generatorName = props.generatorName
      @appname = "generator-#{@generatorName}"
      done()

  userInfo: ->
    done = @async()

    #jshint camelcase:false
    githubUserInfo @githubUser, (res) ->
      @realname = res.name
      @email = res.email
      @githubUrl = res.html_url
      done()

  projectfiles: ->
    @template '_package.json', 'package.json'
    @template 'editorconfig', '.editorconfig'
    @template 'jshintrc', '.jshintrc'
    @template 'travis.yml', '.travis.yml'
    @template 'README.md'
    @template 'LICENSE'

  gitfiles: ->
    @copy 'gitattributes', '.gitattributes'
    @copy 'gitignore', '.gitignore'

  app: ->
    @mkdir 'app'
    @mkdir 'app/templates'
    @template 'app/index.js'
    @template 'app/index.coffee'

  copyTemplates: ->
    @copy 'editorconfig', 'app/templates/editorconfig'
    @copy 'jshintrc', 'app/templates/jshintrc'
    @copy 'travis.yml', 'app/templates/travis.yml'
    @copy 'app/templates/_package.json', 'app/templates/_package.json'
    @copy 'app/templates/_bower.json', 'app/templates/_bower.json'

  tests: ->
    @mkdir 'test'
    @template 'test-load.coffee', 'test/test-load.coffee'
    @template 'test-creation.coffee', 'test/test-creation.coffee'
