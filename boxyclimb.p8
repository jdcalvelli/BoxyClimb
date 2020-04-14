pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--boxyclimb
--by jd calvelli

function _init()
 fcount = 0
 
 ramdnum = 0
 
 side = (6*8)
 flipx = false
 
 boxyspr = 49
 
--for coconut falling
 y = 2
 z = 2
 flipc = 0
 
 score = 0
 lives = 3
 
--for leaf animation
  leaf1 = 8
  leaf2 = 56
 
--tree position array 
 x = {72,104,88,104,72,88}
end

function _draw()
 cls()
 
 map(0,0)
 
 spr(boxyspr,side,(11*8),1,1,flipx)
 
 --leaf movement left side
 sspr(leaf1,0,16,16,(2*8),(0*8))
 sspr(leaf1,0,16,16,(4*8),(0*8))
 sspr(leaf1,0,16,16,(6*8),(0*8))
 --leaf movement right side
 sspr(leaf2,0,16,16,(8*8),(0*8))
 sspr(leaf2,0,16,16,(10*8),(0*8))
 sspr(leaf2,0,16,16,(12*8),(0*8))
 --leaf bottom
 sspr(leaf2,0,16,16,(1*8),(2*8))
 sspr(leaf1,0,16,16,(13*8),(2*8))
 
 --tree movement
 sspr(x[1],16,16,16,(7*8),(2*8)) -- have to count out pixels in sprite sheet
 sspr(x[2],16,16,16,(7*8),(4*8))
 sspr(x[3],16,16,16,(7*8),(6*8))
 sspr(x[4],16,16,16,(7*8),(8*8))
 sspr(x[5],16,16,16,(7*8),(10*8))
 sspr(x[6],16,16,16,(7*8),(12*8))

 --coconuts that fall
 spr(35,(6*8),(y*8),1,1,flipc)
 spr(35,(9*8),(z*8),1,1,flipc)

	print(score, 12*8, 6*8)
	print(lives, 12*8, 7*8)
end

function _update()
 
 fcount = fcount + 1
 
 if btnp(❎) then
  if side == (6*8) then
  	flipx = true
  	side = (9*8)
  elseif side == (9*8) then
   flipx = false
   side = (6*8)
  end
 end
 
--animations
 if fcount%15 == 0 then
  boxyspr = boxyspr + 1
  if boxyspr > 52 then
   boxyspr = 49
  end
  if flipc == false then
   flipc = true
  else
   flipc = false
  end
  if leaf1 == 8 and leaf2 == 56 then
   leaf1 = 24
   leaf2 = 40
  elseif leaf1 == 24 and leaf2 == 40 then
   leaf1 = 8
   leaf2 = 56
  end
 end

--for tree movement
 if fcount%15 == 0 then
  x[6] = x[5]
  x[5] = x[4]
  x[4] = x[3]
  x[3] = x[2]
  x[2] = x[1]
  x[1] = x[4]
 end

--for coconut falling 1 and 2
 if fcount%15 == 0 then
  y=y+1
 end
--for coconut falling 2
 if fcount%30 == 0 then
  z=z+1
 end

--scoring and losing lives
 if y == 11 and side == (6*8) then
  score = score + 1
  y=2
 elseif y == 14 then
  y=2
  lives = lives - 1
 end
  
 if z == 11 and side == (9*8) then
  z = 2
  score = score + 1
 elseif z == 14 then
  z = 2
  lives = lives - 1
 end

end
-->8
--randomizer, off for testing movement downward, see page 1
-- randnum = flr(rnd(3))
-- if randnum == 0 then
--  x[1] = 72
-- elseif randnum == 1 then
--  x[1] = 88
-- elseif randnum == 2 then
--  x[1] = 104
-- end
__gfx__
00000000077777777777777707777777777777777777777777777770777777777777777007777777777777777777777777777770000000000000000000000000
00000000700000000000000070000000000000000000000000000007000000000000000770000000000000000000000000000007000000000000000000000000
00700700700000066000660070000066000660600606600066000007006600066000000770000000000000000000000000000007000000000000000000000000
00077000700000060000600070000060000600066000600006000007000600006000000770000000000000000000000000000007000000000000000000000000
00077000700000660006600070000660006600000000660006600007000660006600000770000000000000000000000000000007000000000000000000000000
00700700700066000660006670066000660006600660006600066007660006600066000770000000000000000000000000000007000000000000000000000000
00000000700060000600006070060000600006000060000600006007060000600006000770000000000000000000000000000007000000000000000000000000
00000000700660006600066070660006600066000066000660006607066000660006600770000000000000000000000000000007000000000000000000000000
00000000700000660006600070000660006600066000660006600007000660006600000770000000000000000000000000000007000000000000000000000000
00000000700000600006000070000600006000066000060000600007000060000600000770000000000000000000000000000007000000000000000000000000
00000000700006600066000070006600066000000000066000660007000066000660000770000000000000000000000000000007000000000000000000000000
00000000700660006600066070660006600066000066000660006607066000660006600770000000000000000000000000000007000000000000000000000000
00000000700600006000060070600006000060066006000060000607006000060000600770000000000000000000000000000007000000000000000000000000
00000000706600066000660076600066000660600606600066000667006600066000660770000000000000000000000000000007000000000000000000000000
00000000700000000000000070000000000000000000000000000007000000000000000770000000000000000000000000000007000000000000000000000000
00000000077777777777777707777777777777777777777777777770777777777777777007777777777777777777777777777770000000000000000000000000
00000000066666600666666007777770000000000000000000000000000000000000000007777777777777700777777777777770077777777777777000000000
00000000600000066000000670000007000000000000000000000000000000000000000070000000000000077000000000000007700000000000000700000000
00000000600606066000000670000007000000000000000000000000000000000000000070000000000000077000000000000007700000000600000700000000
00000000600060066000000670707007000000000000000000000000000000000000000070000000006000077060000060000007700000000600000700000000
00000000600000066000600670070007000000000000000000000000000000000000000070006000000000077000000060000007700000000600000700000000
00000000600000066006060670000007000000000000000000000000000000000000000070006000000000077000000060000007700600000000000700000000
00000000600000066000000670000007000000000000000000000000000000000000000070006000000000077000060000000007700000000000600700000000
00000000066666600666666007777770000000000000000000000000000000000000000070000060000000077000060000000007700000000000600700000000
00000000077777700777777007777770077777700000000000000000000000000000000070000060000000077000060000000007700000000000600700000000
00000000700080077000000770000007700000070000000000000000000000000000000070000060000000077000000000000007700000000000000700000000
00000000700800077000080770770007700707070000000000000000000000000000000070000000060000077006000000000007700000000600000700000000
00000000700007077000008770000007780007070000000000000000000000000000000070000000060000077006000000006007700000000600000700000000
00000000700000077070700770700007708000070000000000000000000000000000000070060000060000077006000000000007700000000600060700000000
00000000700077077070000770008007700000070000000000000000000000000000000070000000000000077000000000000007700000000000000700000000
00000000700000077000000770080007700000070000000000000000000000000000000070000000000000077000000000000007700000000000000700000000
00000000077777700777777007777770077777700000000000000000000000000000000007777777777777700777777777777770077777777777777000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000021220000000022210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000090a0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000191a1b1c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
