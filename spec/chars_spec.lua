require 'busted.runner'()
require 'src/chars'

describe("Chars", function()
  it("Should return char at given position in a string", function()
  	local str = "Some string, other string."
  	assert.are.same(string.at(str, 3), 'm')
  end)

  it("Should check does given string returns with other", function()
  	local str = "Some string"
  	local substr = "Some"
  	assert.True(string.beginsWith(str, substr))
  end)

  it("Should return false if a string doesn't start with another", function()
  	local str = "Some string"
  	local substr = "Other"
  	assert.False(string.beginsWith(str, substr))
  end)

  it("Should return false if length of given string is less than len of another", function()
  	local str = "Some string"
  	local other = "Some string, but longer one."
  	assert.False(string.beginsWith(str, other))
  end)

  it("Should check is given string contains another string between two indecies", function()
	local str = "Some string"
	local substr = "me str"
	assert.True(string.between(str, substr, 1))
  end)

  it("Should convert a string to array with bytes", function()
  	local str = "Some string"
  	local expected = {83, 111, 109, 101, 32, 115, 116, 114, 105, 110, 103}
  	assert.are.same(string.bytes(str), expected)
  end)

  it("Should capitalize a string", function()
  	local str = "some string"
  	local expected = "Some string"
  	assert.are.same(string.capitalize(str), expected)
  end)

  it("Should center a string", function()
  	local str = "string"
  	local expected = "     string     "
  	assert.are.same(string.center(str, 10), expected)
  end)

  it("Should leave a string, if len is 0", function()
  	local str = "Some string"
  	assert.are.same(string.center(str, 0), str)
  end)

  it("Should return true if given string contains a substr", function()
  	local str = "Some string"
  	local substr = "ome s"
  	assert.True(string.contains(str, substr))
  end)

  it("Should counts occurence of given substring in a string", function()
  	local str = "Some string"
  	local substr = "string"
  	assert.are.equal(string.count(str, substr), 1)
  end)

  it("Should returns true if given string ends with other", function()
  	local str = "Some string"
  	local substr = "string"
  	assert.True(string.endsWith(str, substr))
  end)

  it("Should convert array with bytes to a string", function()
  	local bytes = {83, 111, 109, 101, 32, 115, 116, 114, 105, 110, 103}
  	local expected = "Some string"
  	assert.are.same(string.fromBytes(bytes), expected)
  end)

  it("Should return index of first occurence of a substring in given string", function()
  	local str = "Some string, other string"
  	assert.are.equal(string.indexOf(str, "string"), 6)
  end)

  it("Should check does given string contain only lower case characters", function()
  	local str = "some string"
  	assert.True(string.isLower(str))
  end)

  it("Should check does given string contain only numbers", function()
  	local str = "123.45"
  	assert.True(string.isNumber(str))
  end)

  it("Should check does given string contain only spaces", function()
  	local str = "           "
  	assert.True(string.isSpace(str))
  end)

  it("Should check is a char a space", function()
  	local ch = " "
  	assert.True(string.isSpace(ch))
  end)

  it("Should check is an empty string a space", function()
  	assert.False(string.isSpace(""))
  end)

  it("Should check does given string contain only lower case characters", function()
  	local str = "some string"
  	assert.True(string.isLower(str))
  end)

  it("Should return last occurence of a substring", function()
  	local str = "Some string, other string"
  	assert.are.equal(string.lastIndexOf(str, "string"), 20)
  end)

  it("Should return string with spaces on its right side", function()
  	local str = "abcd"
  	assert.are.same(string.ljust(str, 5), "abcd     ")
  end)

  it("Should shuffle a string", function()
  	local str = "some string"

  	assert.are_not.equals(string.permutation(str), str)
  end)

  it("Should return a random string", function()
  	local result = string.random(10)
  	assert.are.equal(#result, 10)
  end)

  it("Should replace first occurence of a substring", function()
  	local str = "Some string, other string, third string"
  	local result = string.replace(str, "string", "some")
  	assert.are.same(result, "Some some, other string, third string")
  end)

  it("Should replace a string at the beginning of a string", function()
  	local str = "Some string, other string, third string"
  	local result = string.replace(str, "Some", "First")
  	assert.are.same(result, "First string, other string, third string")
  end)

  it("Should replace all occurences of a string", function()
	local str = "Some string, other string, third string"
	local result = string.replaceAll(str, "string", "#")
	assert.are.same(result, "Some #, other #, third #")
  end)

  it("Should add spaces on the left side of given string", function()
  	local str = "string"
  	assert.are.same(string.rjust(str, 5), "     string")
  end)

  it("Should remove spaces from right side of a string", function()
  	local str = "string                   "
  	assert.are.same(string.rstrip(str), "string")
  end)

  it("Should return string between two indecies", function()
  	local str = "Some string, other"
  	assert.are.same(string.slice(str, 1, 5), "Some")
  end)

  it("Should split a string by given pattern", function()
  	local str = "one two three"
  	assert.are.same(string.split(str, "%w+"), {"one", "two", "three"})
  end)

  it("Should split a string by given delimeter", function()
  	local str = "one two three"
  	assert.are.same(string.split(str, " "), {"one", "two", "three"})
  end)

  it("Should remove all spaces from both sides of a string", function()
  	local str = "    one two three     "
  	assert.are.same(string.strip(str), "one two three")
  end)

  it("Should swap cases of chars in a string", function()
  	local str = "Some string, 1235742212"
  	assert.are.same(string.swapCase(str), "sOME STRING, 1235742212")
  end)

  it("Should check if given string is a title", function()
  	local str = "Not a title"
  	assert.False(string.title(str))
  end)

  it("Should return true if given string is a title", function()
  	local str = "String#Title"
  	assert.True(string.title(str))
  end)

  it("Should convert a string to title", function()
  	local str = "str#ingO#ther"
  	assert.are.same(string.toTitle(str), "Str#Ingo#Ther")
  end)

  it("Should return uniq chars of a string", function()
  	local str = "String, repeat string"
  	assert.are.same(string.uniq(str), "String, epas")
  end)

  it("Should join a string with given delimeter", function()
  	local str = {"Sring", "other", "string"}
  	assert.are.same(string.join(str, "#"), "Sring#other#string")
  end)

  it("Should reverse a string between given two positions", function()
  	local str = "Some string"
  	assert.are.same(string.reverseBetween(str, 3, 7), "Sots emring")
  end)

  it("Should split a string by lines", function()
  	local str = "1.Line\n2.Line\n3.Line\n4.Line"
  	assert.are.same(string.splitLines(str), {"1.Line", "2.Line", "3.Line", "4.Line"})
  end)

  it("Should return false if given substring has greater length than given string", function()
  	local str = "string"
  	assert.False(string.beginsWith(str, "string, other"))
  end)
end)