#global describe, beforeEach, it

path = require 'path'
helpers = require('yeoman-generator').test

describe 'Generator generator', ->

  beforeEach (done) =>
    helpers.testDirectory path.join(__dirname, 'temp'), (err) =>
      return done(err)  if err
      @app = helpers.createGenerator('generator:app', ['../../app'])
      @app.options['skip-install'] = true
      done()

  it 'creates expected files', (done) =>

    expected = [
      [
        "package.json",
        /"name": "generator-temp"/
      ],
      ".gitignore",
      ".gitattributes",
      ".travis.yml",
      "Gruntfile.coffee",
      "src/app/index.coffee",
      "src/app/templates/_package.json",
      "src/app/templates/_bower.json"
    ]
    
    # Patch the user info to not run into rate limits on travis
    @app.userInfo = ->
      @realname = "Tyrion Lannister"
      @email = "imp@casterlyrock.com"
      @githubUrl = "https://github.com/imp"

    helpers.mockPrompt @app,
      githubUser: "imp"
      generatorName: "temp"

    @app.run {}, ->
      helpers.assertFiles expected
      done()

describe "Subgenerator subgenerator", ->
  beforeEach (done) =>
    helpers.testDirectory path.join(__dirname, "temp"), (err) =>
      return done(err)  if err
      @app = helpers.createGenerator("generator:subgenerator", ["../../subgenerator"], ["foo"])
      done()

  it "creates expected files", (done) =>
    expected = [
      "foo/index.coffee",
      "foo/templates/somefile.coffee"
    ]

    @app.run {}, ->
      helpers.assertFiles expected
      done()
