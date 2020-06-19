class GameLive

  def initialize()
    @longitud = 10
    @matrix = Array.new(10) { Array.new(10) { 0 } }
  end

  def llenarGameRandom()
    for i in 0...10
      for j in 0...10
        @matrix[i][j] = rand(2)
      end
    end
  end

  def juegoDibujar()
    @matrix.each do |column|
      column.each do |card|
        print card
        print ' ' # print no imprime un salto de linea al final del output
      end
      puts ' ' # salto de linea
    end
  end

  def llenadoManual(x,y)
    @matrix[x][y] = 1
  end

  def jugandoGame()
    temMatrix = Array.new(10) { Array.new(10) { 0 } }
    for i in 0...10
      for j in 0...10
        if @matrix[i][j] == 0
          temMatrix[i][j] = juegoReglas(i,j,false)
        else
          temMatrix[i][j] = juegoReglas(i,j,true)
        end
      end
    end
    @matrix = temMatrix
    return @matrix
  end

  def juegoReglas(x,y,esViva)
    celulasVivas = 0
    #1
    x > 0 && y > 0 ? (@matrix[x-1][y-1] == 1 ? celulasVivas += 1 : "") : ""

    #2
    y > 0 ? (@matrix[x][y-1] == 1 ? celulasVivas += 1 : "") : ""

    #3
    x < @longitud - 1 && y > 0 ? (@matrix[x + 1][y - 1] == 1 ? celulasVivas += 1 : "") : ""

    #4
    x > 0 ? (@matrix[x - 1][y] == 1 ? celulasVivas += 1 : "") : ""

    #5
    x < @longitud - 1 ? (@matrix[x + 1][y] == 1 ? celulasVivas += 1 : "") : ""

    #6
    x > 0 && y < @longitud - 1 ? (@matrix[x - 1][y + 1] == 1 ? celulasVivas += 1 : "") : ""

    #7
    y < @longitud - 1 ? (@matrix[x][y + 1] == 1 ? celulasVivas += 1 : "") : ""

    #8
    x < @longitud - 1 && y < @longitud - 1 ? (@matrix[x + 1][y + 1] == 1 ? celulasVivas += 1 : "") : ""

    #Retorno
    esViva ? (return (celulasVivas == 2 || celulasVivas == 3) ? 1 : 0) : (return celulasVivas == 3 ? 1 : 0)
  end
end

x = GameLive.new()

x.llenadoManual(3,1)
x.llenadoManual(3,2)
x.llenadoManual(3,3)
x.juegoDibujar()
for i in 0..1
  x.jugandoGame()
  puts
  x.juegoDibujar()
end
