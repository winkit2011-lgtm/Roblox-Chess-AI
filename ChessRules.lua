-- ChessRules.lua
-- Roblox Chess Rules Module

local ChessRules = {}


local Directions = {

	Rook = {
		{1,0},
		{-1,0},
		{0,1},
		{0,-1}
	},

	Bishop = {
		{1,1},
		{1,-1},
		{-1,1},
		{-1,-1}
	},

	Queen = {
		{1,0},
		{-1,0},
		{0,1},
		{0,-1},
		{1,1},
		{1,-1},
		{-1,1},
		{-1,-1}
	}

}



local function Inside(x,y)

	return x>=1 
	and x<=8
	and y>=1
	and y<=8

end



function ChessRules.GetMoves(board,color)

	local moves={}


	for x=1,8 do

		for y=1,8 do


			local piece=board[x][y]


			if piece 
			and piece.Color==color then


				local type=piece.Type



				-- 兵

				if type=="P" then


					local dir

					if color=="White" then
						dir=1
					else
						dir=-1
					end


					local nx=x
					local ny=y+dir


					if Inside(nx,ny)
					and board[nx][ny]==nil then


						table.insert(
							moves,
							{
								from={x,y},
								to={nx,ny}
							}
						)

					end



				-- 马

				elseif type=="N" then


					local jumps={

						{1,2},
						{2,1},
						{-1,2},
						{-2,1},
						{1,-2},
						{2,-1},
						{-1,-2},
						{-2,-1}

					}


					for _,j in pairs(jumps) do


						local nx=x+j[1]
						local ny=y+j[2]


						if Inside(nx,ny) then


							table.insert(
								moves,
								{
									from={x,y},
									to={nx,ny}
								}
							)

						end

					end



				-- 车 象 后

				elseif Directions[type] then


					for _,d in pairs(Directions[type]) do


						local nx=x+d[1]
						local ny=y+d[2]


						while Inside(nx,ny) do


							table.insert(
								moves,
								{
									from={x,y},
									to={nx,ny}
								}
							)


							nx += d[1]
							ny += d[2]

						end

					end



				-- 王

				elseif type=="K" then


					for dx=-1,1 do

						for dy=-1,1 do


							if dx~=0 or dy~=0 then


								local nx=x+dx
								local ny=y+dy


								if Inside(nx,ny) then


									table.insert(
										moves,
										{
											from={x,y},
											to={nx,ny}
										}
									)

								end

							end

						end

					end


				end


			end

		end

	end


	return moves

end



return ChessRules
