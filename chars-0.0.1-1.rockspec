-- This file was automatically generated for the LuaDist project.

package = "chars"
version = "0.0.1-1"
-- LuaDist source
source = {
  tag = "0.0.1-1",
  url = "git://github.com/LuaDist-testing/chars.git"
}
-- Original source
-- source = {
--    url = "git://github.com/monzita/chars.git"
-- }
description = {
   summary = "`Chars` is a Lua package, which contains some useful string methods.",
   detailed = "`Extends current string module, adding some useful methods.",
   homepage = "https://github.com/monzita/chars",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
      chars = "src/chars.lua"
   }
}