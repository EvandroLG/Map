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
    dict[key] = #list
    self.items[key] = value
  end

  self.get = function(key)
    return self.items[key]
  end

  self.has = function(key)
    return self.items[key] ~= nil
  end

  self.delete = function(key)
    local index = dict[key]

    if index >= 0 then
      self.items[key] = nil
      list[index] = nil
      dict[key] = nil

      return true
    end

    return false
  end

  return self
end

return Map
