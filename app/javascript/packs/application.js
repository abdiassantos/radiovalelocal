require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


let cache = {}

// import "jquery-ujs";

import "../src"

const importAll = r => {
  r.keys().forEach(key => (cache[key] = r(key)))
}
