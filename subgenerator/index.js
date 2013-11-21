(function() {
  var SubGeneratorGenerator, yeoman,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  yeoman = require('yeoman-generator');

  module.exports = SubGeneratorGenerator = (function(_super) {
    __extends(SubGeneratorGenerator, _super);

    function SubGeneratorGenerator() {
      yeoman.generators.NamedBase.apply(this, arguments);
      if (!this.name) {
        this.log.error('You have to provide a name for the subgenerator.');
        process.exit(1);
      }
      this.generatorName = this.name;
      this.dirname = this._.dasherize(this.name);
    }

    SubGeneratorGenerator.prototype.template = function() {
      this.mkdir(this.dirname);
      this.mkdir("" + this.dirname + "/templates");
      this.copy('index.js', "" + this.dirname + "/index.js");
      this.copy('index.coffee', "" + this.dirname + "/index.coffee");
      return this.copy('templates/somefile.coffee', "" + this.dirname + "/templates/somefile.coffee");
    };

    return SubGeneratorGenerator;

  })(yeoman.generators.NamedBase);

}).call(this);
