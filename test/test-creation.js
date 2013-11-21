(function() {
  "use strict";
  var helpers, path;

  path = require("path");

  helpers = require("yeoman-generator").test;

  describe("Generator generator", function() {
    beforeEach(function(done) {
      return helpers.testDirectory(path.join(__dirname, "temp"), function(err) {
        if (err) {
          return done(err);
        }
        this.app = helpers.createGenerator("generator:app", ["../../app"]);
        this.app.options["skip-install"] = true;
        return done();
      }).bind(this);
    });
    return it("creates expected files", function(done) {
      var expected;
      expected = [["package.json", /"name": "generator-temp"/], ".gitignore", ".gitattributes", ".jshintrc", ".travis.yml", "app/index.js", "app/templates/_package.json", "app/templates/_bower.json"];
      this.app.userInfo = function() {
        this.realname = "Tyrion Lannister";
        this.email = "imp@casterlyrock.com";
        return this.githubUrl = "https://github.com/imp";
      };
      helpers.mockPrompt(this.app, {
        githubUser: "imp",
        generatorName: "temp"
      });
      return this.app.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

  describe("Subgenerator subgenerator", function() {
    beforeEach(function(done) {
      return helpers.testDirectory(path.join(__dirname, "temp"), function(err) {
        if (err) {
          return done(err);
        }
        this.app = helpers.createGenerator("generator:subgenerator", ["../../subgenerator"], ["foo"]);
        return done();
      }).bind(this);
    });
    return it("creates expected files", function(done) {
      var expected;
      expected = ["foo/index.js", "foo/templates/somefile.js"];
      return this.app.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

}).call(this);
