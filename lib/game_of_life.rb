class GameOfLife

  ALIVE = 'x'
  DEAD  = '.'

  def initialize(data)
    @new_generation = data
  end

  def next_generation

    #Make a copy for next generation
    @next_generation = Marshal.load(Marshal.dump(@new_generation))

    #More rigorous checks should be added
    @max_row = @new_generation.length-1
    @max_col = @new_generation.first.length-1

    #At the moment, we don't care if the inspected cells are dead, alive or valid
    #Cell validation to be added
    @new_generation.each_with_index do |row, y|
      row.each_with_index do |col, x|
        live_neighbours = 0
        live_neighbours = countNeighbours(y,x)

        #Live cell with fewer than two live neighbours dies
        #Live cell with two or three live neighbours lives
        #Live cell with more than three live neighbours dies
        if live_neighbours < 2 || live_neighbours > 3
          @next_generation[y][x] = DEAD
        end

        #Dead or live cell with exactly three live neighbours becomes/is alive
        if live_neighbours == 3
          @next_generation[y][x] = ALIVE
        end

       end #Each col
      end #Each row

    @new_generation = @next_generation
  end #End def

  def get_next_generation
    @next_generation
  end

  #Helper for diplaying the worlds nicely
  def displayLife
    @next_generation.each_with_index do |row, y|
        puts row.map { |i| "" + i.to_s + "" }.join()
    end
  end

  def countNeighbours(y,x)

    neighbours = 0
    #Checking the neighbour above
    if checkBordersOK(y-1, x) && @new_generation[y-1][x] == ALIVE
      neighbours += 1
    end

    #Below, same column
    if checkBordersOK(y+1, x) && @new_generation[y+1][x] == ALIVE
      neighbours += 1
    end

    #Left, same row
    if checkBordersOK(y, x-1) && @new_generation[y][x-1] == ALIVE
        neighbours += 1
    end

    #Right, same row
    if checkBordersOK(y, x+1) && @new_generation[y][x+1] == ALIVE
      neighbours += 1
    end

    #Top left
    if checkBordersOK(y-1, x-1) && @new_generation[y-1][x-1] == ALIVE
      neighbours += 1
    end

    #Top right
    if checkBordersOK(y-1, x+1) && @new_generation[y-1][x+1] == ALIVE
      neighbours += 1
    end

    #Bottom left
    if checkBordersOK(y+1, x-1) && @new_generation[y+1][x-1] == ALIVE
      neighbours += 1
    end

    #Bottom right
    if checkBordersOK(y+1, x+1) && @new_generation[y+1][x+1] == ALIVE
      neighbours += 1
    end

    neighbours
  end

  #Check the edge cases, make sure we are not checking nonexistent neighbours
  def checkBordersOK(y, x)
    !(y < 0) && !(x < 0) && !(y > @max_row) && !(x > @max_col)
  end

end
