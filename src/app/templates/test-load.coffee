assert = require 'assert'

describe '<%= generatorName %> generator', ->
  it 'can be imported without blowing up', ->
    app = require '../app'
    assert(app?)
