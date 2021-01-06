function Map()
  local dict = {}
  local list = {}
  local self = {}

  self.items = {}
  self.size = 0

  self.set = function(key, value)
    if dict[key] then
      self.delete(key)
    end

    table.insert(list, key)
    local size = #list
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
      self.items[key] = nil
      list[index] = nil
      dict[key] = nil

      return true
    end

    return false
  end

  self.each = function(callback)
    for i=1, #list do
      local key = list[i]
      local value = self.get(key)

      callback(key, value)
    end
  end

  return self
end

return Map
