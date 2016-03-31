--[[   --]]
ardb.call("del", "myset")
local s = ardb.call("sadd", "myset", "s0", "s0", "s1", "s2")
ardb.assert2(s == 3, s)
s = ardb.call("sadd2", "myset", "s1", "s2", "s3")
ardb.assert2(s["ok"] == "OK", s)
s = ardb.call("scard", "myset")
ardb.assert2(s == 4, s)
ardb.call("del", "myset")
s = ardb.call("sadd2", "myset", "s1", "s2", "s3")
ardb.assert2(s["ok"] == "OK", s)
s = ardb.call("sadd", "myset", "s0", "s0", "s1", "s2")
ardb.assert2(s == 1, s)
local vs = ardb.call("smembers", "myset")
ardb.assert2(vs[1] == "s0", vs)
ardb.assert2(vs[2] == "s1", vs)
ardb.assert2(vs[3] == "s2", vs)
ardb.assert2(vs[4] == "s3", vs)
s = ardb.call("sismember", "myset", "sx")
ardb.assert2(s == 0, s)
s = ardb.call("sismember", "myset", "s0")
ardb.assert2(s == 1, s)
