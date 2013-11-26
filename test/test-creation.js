(function() {
  var helpers, path;

  path = require('path');

  helpers = require('yeoman-generator').test;

  describe('Generator generator', function() {
    var _this = this;
    beforeEach(function(done) {
      return helpers.testDirectory(path.join(__dirname, 'temp'), function(err) {
        if (err) {
          return done(err);
        }
        _this.app = helpers.createGenerator('generator:app', ['../../app']);
        _this.app.options['skip-install'] = true;
        return done();
      });
    });
    return it('creates expected files', function(done) {
      var expected;
      expected = [["package.json", /"name": "generator-temp"/], ".gitignore", ".gitattributes", ".jshintrc", ".travis.yml", "Gruntfile.coffee", "src/app/index.coffee", "src/app/templates/_package.json", "src/app/templates/_bower.json"];
      _this.app.userInfo = function() {
        this.realname = "Tyrion Lannister";
        this.email = "imp@casterlyrock.com";
        return this.githubUrl = "https://github.com/imp";
      };
      helpers.mockPrompt(_this.app, {
        githubUser: "imp",
        generatorName: "temp"
      });
      return _this.app.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

  describe("Subgenerator subgenerator", function() {
    var _this = this;
    beforeEach(function(done) {
      return helpers.testDirectory(path.join(__dirname, "temp"), function(err) {
        if (err) {
          return done(err);
        }
        _this.app = helpers.createGenerator("generator:subgenerator", ["../../subgenerator"], ["foo"]);
        return done();
      });
    });
    return it("creates expected files", function(done) {
      var expected;
      expected = ["foo/index.coffee", "foo/templates/somefile.coffee"];
      return _this.app.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

}).call(this);
