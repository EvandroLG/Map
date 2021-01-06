local test = require('simple_test')
local Map = require('Map')

local object = Map()
object.set('name', 'Evandro')
object.set('age', 34)

test('set', function(_assert)
  _assert.deep_equal(
    object.items,
    { ['name'] = 'Evandro', ['age'] = 34 }
  )
end)

test('get', function(_assert)
  _assert.equal(object.get('name'), 'Evandro')
  _assert.equal(object.get('age'), 34)
end)

test('has', function(_assert)
  _assert.ok(object.has('name'))
  _assert.ok(object.has('age'))
  _assert.not_ok(object.has('profession'))
end)
