# set-lua &middot; [![Build Status](https://travis-ci.org/EvandroLG/Map.svg?branch=master)](https://travis-ci.org/EvandroLG/Map) [![license](https://badgen.now.sh/badge/license/MIT)](./LICENSE)
Map works like a hashtable but preserving the key insertion order.

## Installation
To install `Map`, run:

```sh
$ luarocks install map
```

## Usage
```lua
local Map = require('Map')
local bill = Map()

bill.set('name', 'Bill Gates')
bill.set('age', 65)

bill.has('name') -- true
bill.has('company') -- false

bill.get('name') -- 'Bill Gates'
bill.get('age') -- 65
bill.get('company') -- nil

bill.each(function(key, value)
  print(key .. ' = ' .. value)
end)
-- name = Bill Gates
-- age = 65

```

## API
### Properties
* Map.<code>items:table</code><br />
Table holds key-values pairs.

* Map.<code>keys:table</code><br />
List of inserted keys.

* Map.<code>values:table</code><br />
List of inserted values.

* Map.<code>size:number</code><br />
Current Map length.

### Methods
* Map.<code>set(key:any, value:any):void</code><br />
Sets a key to a value.

* Map.<code>get(key:any):any</code><br />
Returns the value associated to the key.

* Map.<code>has(key:any):boolean</code><br />
Returns the value associated to the key.

* Map.<code>delete(key:any):boolean</code><br />
Removes item by key and returns true in case of success and false if the item doesn't exist in the Map.

* Map.<code>each(callback:function):void</code><br />
Calls function once for each item present in the Map object preserving insertion order.

## License
[MIT](./LICENSE)
