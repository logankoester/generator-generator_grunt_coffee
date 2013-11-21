#global describe, it
"use strict"
assert = require("assert")
describe "Generator generator", ->
  it "can be imported without blowing up", ->
    app = require("../app")
    assert app isnt `undefined`


