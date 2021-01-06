-- Map works like a hashtable but preserving the key insertion order
-- @returns {table}
function Map()
  local dict = {}
  local self = {}

  -- List of inserted keys
  -- type {table}
  self.keys = {}

  -- List of inserted values
  -- type {table}
  self.values = {}

  -- Object holds key-values pairs
  -- type {table}
  self.items = {}

  -- Current Map size
  -- type {number}
  self.size = 0

  -- Sets a key to a value
  -- @param key {any}
  -- @param value {any}
  -- @returns {void}
  self.set = function(key, value)
    if dict[key] ~= nil then
      self.delete(key)
    end

    table.insert(self.keys, key)
    table.insert(self.values, value)
    local size = #self.keys
    dict[key] = size
    self.items[key] = value
    self.size = size
  end

  -- Returns the value associated to the key
  -- @param key {any}
  -- @returns {any}
  self.get = function(key)
    return self.items[key]
  end

  -- Returns true whether a value has been associated to the key
  -- @param key {any}
  -- @returns {boolean}
  self.has = function(key)
    return self.items[key] ~= nil
  end

  -- Removes item by key and returns true in case of success and false if the item doesn't exist in the Map
  -- @param key {any}
  -- @returns {boolean}
  self.delete = function(key)
    local index = dict[key]

    if index ~= nil then
      self.size = self.size - 1
      self.items[key] = nil
      self.keys[index] = nil
      self.values[index] = nil
      dict[key] = nil

      return true
    end

    return false
  end

  -- Call function once for each item present in the Map object preserving insertion order
  -- @param callback {function}
  -- @returns {void}
  self.each = function(callback)
    for i=1, #self.keys do
      local key = self.keys[i]
      local value = self.get(key)

      callback(key, value)
    end
  end

  return self
end

return Map
