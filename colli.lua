
function check(b, p, blts, i)
	--direita
	if b.x < p.x then
		--precisa ir para direita
		local tempx = b.x + b.s
		
		--var que vai acumular o resultado
		local right = false
		
		--checar colisao com todos
		for j = 1, #blts do
			if j ~= i then
				right = right or colli(tempx, b.y, b.radius, blts[j])
			end
		end

		--movimentar
		if not right then
			b.x = tempx
		end

	elseif b.x > p.x then
		--precisa ir para esquerda
		local tempx = b.x - b.s
		
		--var que vai acumular o resultado
		local left = false
		
		--checar colisao com todos
		for j = 1, #blts do
			if j ~= i then
				left = left or colli(tempx, b.y, b.radius, blts[j])
			end 
		end

		--movimentar
		if not left then
			b.x = tempx
		end
	end


	--baixo
	if b.y < p.y then
		--precisa ir para baixo
		local tempy = b.y + b.s
		
		--var que vai acumular o resultado
		local down = false
		
		--checar colisao com todos
		for j = 1, #blts do
			if j ~= i then
				down = down or colli(b.x, tempy, b.radius, blts[j])
			end 
		end

		--movimentar
		if not down then
			b.y = tempy
		end

	elseif b.y > p.y then
		--precisa ir para cima
		local tempy = b.y - b.s
		
		--var que vai acumular o resultado
		local up = false
		
		--checar colisao com todos
		for j = 1, #blts do
			if j ~= i then
				up = up or colli(b.x, tempy, b.radius, blts[j])
			end 
		end

		--movimentar
		if not up then
			b.y = tempy
		end

	end

end

function colli(x, y, r, e)
	local d = math.sqrt((x - e.x)^2 + (y - e.y)^2)
	return r + e.radius > d
end