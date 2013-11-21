#global describe, beforeEach, it
"use strict"
path = require("path")
helpers = require("yeoman-generator").test
describe "Generator generator", ->
  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, "temp"), (err) ->
      return done(err)  if err
      @app = helpers.createGenerator("generator:app", ["../../app"])
      @app.options["skip-install"] = true
      done()
    .bind(this)

  it "creates expected files", (done) ->
    expected = [["package.json", /"name": "generator-temp"/], ".gitignore", ".gitattributes", ".jshintrc", ".travis.yml", "app/index.js", "app/templates/_package.json", "app/templates/_bower.json"]
    
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
  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, "temp"), (err) ->
      return done(err)  if err
      @app = helpers.createGenerator("generator:subgenerator", ["../../subgenerator"], ["foo"])
      done()
    .bind(this)

  it "creates expected files", (done) ->
    expected = ["foo/index.js", "foo/templates/somefile.js"]
    @app.run {}, ->
      helpers.assertFiles expected
      done()



