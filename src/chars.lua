-- Documentation: https://github.com/monzita/chars/wiki
chars = string


function chars.at(str, position)
  local result = string.split(str)
  return result[position]
end


function chars.beginsWith(str, substr)
  return chars.sub(str, 1, #substr) == substr
end


function chars.between(str, substr, b, e)
  if b == nil
    then b = 1
  end

  if e == nil
    then e = #str
  end

  if b > e or #substr > e
    then return false
  end

  for i = b, e
    do
    if chars.sub(str, i, #substr + i - 1) == substr
      then
      return true
    end

  end

  return false
end


function chars.bytes(str)
  local result = {}
  for i = 1, #str
    do
    local ch = chars.sub(str, i, i)
    table.insert(result, chars.byte(ch))
  end

  return result
end


function chars.capitalize(str)
  local firstLetterByte = chars.byte(chars.sub(str, 1, 1))
  local capitalLetter = firstLetterByte

  if firstLetterByte > 96 and firstLetterByte < 123
    then
    capitalLetter = firstLetterByte - 32
  end

  return chars.char(capitalLetter)..chars.sub(str, 2)
end


function chars.center(str, len)
  local emptyString = chars.rep(" ", math.floor(len / 2))
  return emptyString..str..emptyString
end


function chars.contains(str, substr)
  if #str < #substr
    then return false
  end

  for i = 1, #str
    do
    if chars.sub(str, i, #substr + i -1) == substr
      then return true
    end
  end

  return false
end


function chars.count(str, substr)
  local count = 0

  for token in chars.gmatch(str, substr)
    do
    count = count + 1
  end

  return count
end


function chars.endsWith(str, substr)
  return chars.sub(str, #str - #substr + 1) == substr
end


function chars.fromBytes(bytes)
  local str = ""

  for i = 1, #bytes
    do
    str = str..chars.char(bytes[i])
  end

  return str
end


function chars.indexOf(str, substr)
  local result = string.split(str)

  for i = 1, #str
    do
    if chars.sub(str, i, #substr + i - 1) == substr
      then
      return i
    end
  end

  return -1
end


function chars.isLower(str)
  local bytes = chars.bytes(str)

  for i = 1, #bytes
    do

    if bytes[i] < 91 and bytes[i] > 64
      then
      return false
    end
  end

  return true
end


function chars.isNumber(str)
  return tonumber(str) ~= nil
end


function chars.isSpace(str)
  local bytes = chars.bytes(str)
  for i = 1, #bytes
    do
    if bytes[i] ~= 32
      then return false
    end
  end

  return #str > 0
end


function chars.isUpper(str)
  local bytes = chars.bytes(str)
  local result = #str > 0
  for i = 1, #bytes
    do
    if bytes[i] > 64 and bytes[i] < 91
      then
      result = true
    end

    if bytes[i] < 123 and bytes[i] > 96
      then
      return false
    end
  end

  return result
end


function chars.join(chs, delim)
  local result = ""
  for i = 1, #chs
    do
    result = result..chs[i]

    if delim ~= nil and i < #chs
      then
      result = result..delim
    end
  end

  return result
end


function chars.lastIndexOf(str, substr)
  for i = #str, #substr, -1
    do
    if chars.sub(str, i - #substr + 1, i) == substr
      then
      return i - #substr + 1
    end
  end

  return -1
end


function chars.ljust(str, len)
  return str..chars.rep(" ", len)
end

function chars.lstrip(str)
  return str:gsub("^%s*", "")
end

function chars.permutation(str)
  local chs = chars.split(str)
  local mid = math.floor(#str / 2)

  math.randomseed(os.time())
  for i = 1, mid
    do
    local j = math.random(i + mid)

    chs[i], chs[j] = chs[j], chs[i]
  end

  return chars.join(chs)
end


function chars.random(len)
  math.randomseed(os.time())
  local chs = chars.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVQXYZ1234567890.!?-+\\^$#@=_")
  local result = ""
  for i = 1, len
    do
    local j = math.random(#chs)
    result = result..chs[j]
  end

  return result
end


function chars.replace(str, substr, newsubtr)
  local result = str
  for i = 1, #str
    do
    if chars.sub(str, i, #substr + i - 1) == substr
      then
      result = chars.sub(str, 1, i - 1)..newsubtr..chars.sub(str, #substr + i)
      return result
    end
  end

  return result
end


function chars.replaceAll(str, substr, newsubstr)
  local result = str

  for i = 1, #str
    do
    if chars.sub(result, i, #substr + i - 1) == substr
      then
      result = chars.sub(result, 1, i - 1)..newsubstr..chars.sub(result, #substr + i)
    end
  end

  return result
end


function chars.reverseBetween(str, b, e)
  if b == nil
    then
    return chars.reverse(str)
  end

  if e == nil
    then
    e = #str
  end

  return chars.slice(str, 1, b)..chars.reverse(chars.slice(str, b, e + 1))..chars.slice(str, e + 1)

end


function chars.rjust(str, len)
  return chars.rep(" ", len)..str
end


function chars.rstrip(str)
  return str:gsub("%s*$", "")
end


function chars.slice(str, b, e)
  if e == nil or e > #str
    then
    e = #str + 1
  end

  local result = ""
  local splitted = string.split(str)

  for i = b, e - 1
    do
    result = result..splitted[i]
  end

  return result
end


function chars.split(str, delim)
  local result = {}
  local index = 1
  local str = str
  local delim = delim

  if delim == nil or delim == ""
    then
    delim = "."
  elseif chars.match(delim, "%w") -- add more
    then
    delim = delim
  else
    delim = "([^"..delim.."]+)"
  end

  for token in chars.gmatch(str, delim)
    do
      result[index] = token
      index = index + 1
  end

  return result
end


function chars.splitLines(str)
  return chars.split(str, "\n")
end


function chars.strip(str)
  local result = str:gsub("^%s*", "")
  result = result:gsub("%s*$", "")
  return result
end


function chars.swapCase(str)
  local bytes = chars.bytes(str)
  local result = ""

  for i = 1, #bytes
    do

    if bytes[i] > 96 and bytes[i] < 123
      then
      result = result..chars.char(bytes[i] - 32)
    elseif bytes[i] > 64 and bytes[i] < 91
      then
      result = result..chars.char(bytes[i] + 32)
    else
      result = result..chars.char(bytes[i])
    end
  end

  return result
end


function chars.title(str)
  local result = ""
  local prev = ""

  for word in string.gmatch(str, "%w+")
    do
    local byte = chars.byte(chars.at(word, 1))
    if byte > 96 and byte < 123
      then
      return false
    end
  end
  return true
end


function chars.toTitle(str)
  local str = chars.lower(str)
  local result = ""
  local prev = ""

  for i = 1, #str
    do

    if chars.match(chars.at(str, i), "[.%$#@-_+*<>=]")
      then
      prev = chars.at(str, i)
      result = result..prev
    elseif chars.match(prev, "[.%$#@-_+*<>=]") ~= nil
      then
      result = result..chars.upper(chars.at(str, i))
      prev = ""
    else

      if i == 1 and chars.match(chars.at(str, 1), "[a-z]")
        then
        result = result..chars.upper(chars.at(str, 1))
      else
        result = result..chars.at(str, i)
      end
    end
  end

  return result
end


function chars.uniq(str)
  local chs = chars.split(str)
  local result = ""

  for i = 1, #chs
    do
    if not chars.contains(result, chs[i])
      then
      result = result..chs[i]
    end
  end

  return result
end
