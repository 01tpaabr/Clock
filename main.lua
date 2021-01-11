function love.load()
  
  love.window.setMode (600 ,600, { msaa=16})
  love.window.setTitle ("Relogio Analogico")
  love.graphics.setBackgroundColor (1 ,1 ,1)
  
  math.randomseed(os.time())
  
  --Start RGB
  r = math.random()
  g = math.random()
  b = math.random()
  --Direcao da variacao
  dir = 0
  --Limites da variacao
  --R
  tetoR = math.random()
  chaoR = math.random()
  -- verificar se os limites estao aceitaveis
  while tetoR < chaoR do
    tetoR = math.random()
    chaoR = math.random()
  end
  while tetoR - chaoR < 0.5 do
    tetoR = math.random()
    chaoR = math.random()
  end
  -- G
  tetoG = math.random()
  chaoG = math.random()
  -- verificar se os limites estao aceitaveis
  while tetoG < chaoG do
    tetoG = math.random()
    chaoG = math.random()
  end
  while tetoG - chaoG < 0.5 do
    tetoG = math.random()
    chaoG = math.random()
  end
  --B
  tetoB = math.random()
  chaoB = math.random()
  -- verificar se os limites estao aceitaveis
  while tetoB < chaoB do
    tetoB = math.random()
    chaoB = math.random()
  end
  while tetoB - chaoB < 0.5 do
    tetoB = math.random()
    chaoB = math.random()
  end
  
  function cara()
    local i = 0
    local k = 0
    
    love.graphics.setLineWidth(5)
    --Mudar a cor do fundo do relogio
    love.graphics.setColor(r, g, b)
    
    love.graphics.circle("fill", 300, 300, 228)
    love.graphics.setColor(0,0,0)
    love.graphics.circle("line", 300, 300, 230)
    love.graphics.setLineWidth(1)
    --Dia e Mes
    love.graphics.setColor(0.5,0.5,0.5)
    love.graphics.rectangle("fill", 250, 400, 100, 15)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Dia ".. dia.. " de ".. mes[tempo.month], 255, 400  )
    -- RGB Utilizado
    love.graphics.setColor(0,0,0)
    love.graphics.print("RGB: ".. r.. " | ".. g.. " | ".. b  , 0, 20  )
    --Borda
    love.graphics.push()
      love.graphics.setLineWidth(5)
      love.graphics.setColor(0,0,0)
      love.graphics.translate(300,300)
      --Aumentar o contraste da borda
      if r + g + b > 2.3 then
        love.graphics.setColor(0,0,0)
      else 
        love.graphics.setColor(1,1,1)
      end
      --Tracos de hora
      while i < 12 do
        love.graphics.push()
          love.graphics.rotate(2 * math.pi/12 * i)
          if i == 0 then
            love.graphics.print("12", -5, -170)
          else
            love.graphics.print(i, -5, -170)
          end
          love.graphics.line(0, -180, 0, -210 )
        love.graphics.pop()
        i = i + 1
      end
      --Tracos de min
      while k < 60 do
        love.graphics.push()
          love.graphics.rotate(2 * math.pi/60 * k)
          love.graphics.line(0, -180, 0, -190 )
        love.graphics.pop()
        k = k + 1
      end
      love.graphics.line(0, -180, 0, -210 )
      love.graphics.setLineWidth(1)
    love.graphics.pop()
    -- Inclinacoes
    love.graphics.setColor(0,0,0)
    local inclinacaoMin = (2 * math.pi /(60 * 60) * seg) + 2 * math.pi/60 * min
    love.graphics.print("Inclinacao min : " .. inclinacaoMin, 0, 40)
    local inclinacaoHora= (2 * math.pi/(12 * 60) * min) + 2*math.pi/12 * hour
    love.graphics.print("Hora: ".. inclinacaoHora, 300, 40)
    
  end
  
  function segundo()
    -- Tentativa de aumentar o contraste dos ponteiros
    love.graphics.push()
      if r + g + b > 2.3 then
        love.graphics.setColor(0,0,0)
      else 
        love.graphics.setColor(1,1,1)
      end
      --Ponteiro
      love.graphics.translate(300, 300)
      love.graphics.rotate(2 * math.pi/60 * seg)
      love.graphics.line(0, 0, 0, -130)
      love.graphics.polygon("fill", -10,-130, 10,-130, 0,-160)
      love.graphics.polygon("fill", -10,-150, 10,-150, 0,-130)
      love.graphics.polygon("fill", -10,-130, 10,-130, 0,-100)

      
    love.graphics.pop()
      
  end
  
  function minuto()
    love.graphics.push()
    
    -- Tentativa de aumentar o contraste dos ponteiros
      if r + g + b > 2.3 then
        love.graphics.setColor(0,0,0)
      else 
        love.graphics.setColor(1,1,1)
      end
      -- Ponteiro
      love.graphics.translate(300, 300)
      love.graphics.rotate((2 * math.pi /(60 * 60) * seg) + 2 * math.pi/60 * min)
      
      love.graphics.line(0, 0, 0, -90)
      
      love.graphics.polygon("fill", -10,-90, 10,-90, 0,-120)
      love.graphics.polygon("fill", -10,-110, 10,-110, 0,-90)
      love.graphics.polygon("fill", -10,-90, 10,-90, 0,-60)
      
    love.graphics.pop()
  end
  
  function hora()
    love.graphics.push()
    
    -- Tentativa de aumentar o contraste dos ponteiros
      if r + g + b > 2.3 then
        love.graphics.setColor(0,0,0)
      else 
        love.graphics.setColor(1,1,1)
      end
      --Ponteiro
      love.graphics.translate(300, 300)
      love.graphics.rotate((2 * math.pi/(12 * 60) * min) + 2*math.pi/12 * hour)
      love.graphics.line(0, 0, 0, -40)
      love.graphics.polygon("fill", -10,-40, 10,-40, 0,-70)
      love.graphics.polygon("fill", -10,-60, 10,-60, 0,-40)
      love.graphics.polygon("fill", -10,-40, 10,-40, 0,-10)
      
    love.graphics.pop()
  end
end
function love.draw()
  cara()
  segundo()
  minuto()
  hora()
end
function love.update()
  tempo = os.date("*t")
  seg = tempo.sec
  min = tempo.min
  hour = tempo.hour
  dia = tempo.day
  mes = {"Janeiro", "Fevereiro", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
  
  --RGB
  if dir == 0 then
    if r > chaoR then
      r = r - 0.001
    elseif r < chaoR and g > chaoG then
      g = g - 0.001
    elseif g < chaoG and b > chaoB then
      b = b - 0.001
    end
    if g < chaoG and r < chaoR and b < chaoB then
      dir = 1
    end
  elseif dir == 1 then
    if b < tetoB then
      b = b + 0.001
    elseif b > tetoB and g < tetoG then
      g = g + 0.001
    elseif g > tetoG and r < tetoR then
      r = r + 0.001
    end
    if r > tetoR and g > tetoG and b > tetoB then
      dir = 0
    end
  end
end