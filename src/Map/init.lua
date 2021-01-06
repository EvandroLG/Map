function Map()
  local dict = {}
  local self = {}

  self.keys = {}
  self.values = {}
  self.items = {}
  self.size = 0

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

  self.get = function(key)
    return self.items[key]
  end

  self.has = function(key)
    return self.items[key] ~= nil
  end

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
