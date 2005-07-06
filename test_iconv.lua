
assert(loadlib("./libluaiconv.so", "luaopen_iconv"))()

cd = iconv.new("utf-8", "iso-8859-1")
--cd = iconv.new("us-ascii//IGNORE", "iso-8859-1")
--cd = iconv.new("us-ascii//TRANSLIT", "iso-8859-1")

assert(cd, "Invalid conversion")

-- ret, err = cd:iconv("Isso � um teste com acentua��o")
ret, err = cd:iconv("����������")

if err == iconv.ERROR_INCOMPLETE then
  print("Error: Incomplete input.")
elseif err == iconv.ERROR_INVALID then
  print("Error: Invalid input.")
end

print("Result: ", ret)

