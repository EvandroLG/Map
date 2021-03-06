local test = require('simple_test')
local Map = require('Map')

local object = Map()
object.set('name', 'Evandro')
object.set('age', 34)

test('keys', function(_assert)
  _assert.deep_equal(
    object.keys,
    { 'name', 'age' }
  )

  object.set('profession', 'Programmer')
  _assert.deep_equal(
    object.keys,
    { 'name', 'age', 'profession' }
  )

  object.delete('profession')
end)

test('values', function(_assert)
  _assert.deep_equal(
    object.values,
    { 'Evandro', 34 }
  )

  object.set('profession', 'Programmer')
  _assert.deep_equal(
    object.values,
    { 'Evandro', 34, 'Programmer' }
  )

  object.delete('profession')
end)

test('set', function(_assert)
  _assert.deep_equal(
    object.items,
    { ['name'] = 'Evandro', ['age'] = 34 }
  )

  _assert.equal(object.size, 2)
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

test('delete', function(_assert)
  object.set('profession', 'Programmer')

  _assert.deep_equal(
    object.items,
    {
      ['name'] = 'Evandro',
      ['age'] = 34,
      ['profession'] = 'Programmer'
    }
  )

  _assert.equal(object.size, 3)
  _assert.not_ok(object.delete('friends'))
  _assert.ok(object.delete('profession'))
  _assert.not_ok(object.has('profession'))
  _assert.deep_equal(
    object.items,
    {
      ['name'] = 'Evandro',
      ['age'] = 34,
    }
  )

  object.set('profession', 'Software Engineer')

  _assert.ok(object.has('profession'))
  _assert.equal(object.get('profession'), 'Software Engineer')
  _assert.deep_equal(
    object.items,
    {
      ['name'] = 'Evandro',
      ['age'] = 34,
      ['profession'] = 'Software Engineer'
    }
  )
end)

test('each', function(_assert)
  local keys = {}
  local values = {}

  object.each(function(key, value)
    table.insert(keys, key)
    table.insert(values, value)
  end)

  _assert.deep_equal(
    keys,
    { 'name', 'age', 'profession' }
  )

  _assert.deep_equal(
    values,
    { 'Evandro', 34, 'Software Engineer' }
  )
end)
