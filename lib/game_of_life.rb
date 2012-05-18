class GameOfLife

  def initialize(data)
    @new_generation = data
  end

  def next_generation

    #make a copy for next generation
    @next_generation = Marshal.load(Marshal.dump(@new_generation))

    #More rigorous checks should be added
    @max_row = @new_generation.length-1
    @max_col = @new_generation.first.length-1

    @new_generation.each_with_index do |row, y|
      row.each_with_index do |col, x|
        live_count = 0

        #checking the neighbour above
        if checkBordersOK(y-1, x)
          if @new_generation[y-1][x] == 'x'
            live_count += 1
          end
        end

        #below, same column
        if checkBordersOK(y+1, x)
          if @new_generation[y+1][x] == 'x'
            live_count += 1
          end
        end

        #left, same row
        if checkBordersOK(y, x-1)
          if @new_generation[y][x-1] == 'x'
              live_count += 1
          end
        end

        #right, same row
        if checkBordersOK(y, x+1)
          if @new_generation[y][x+1] == 'x'
            live_count += 1
          end
        end

        #top left
        if checkBordersOK(y-1, x-1)
          if @new_generation[y-1][x-1] == 'x'
            live_count += 1
          end
        end

        #top right
        if checkBordersOK(y-1, x+1)
          if @new_generation[y-1][x+1] == 'x'
            live_count += 1
          end
        end

        #bottom left
        if checkBordersOK(y+1, x-1)
          if @new_generation[y+1][x-1] == 'x'
            live_count += 1
          end
        end

        #bottom right
        if checkBordersOK(y+1, x+1)
          if @new_generation[y+1][x+1] == 'x'
            live_count += 1
          end
        end

        #Any live cell with fewer than two live neighbours dies
        #Any live cell with two or three live neighbours lives
        #Any live cell with more than three live neighbours dies
        if live_count < 2 || live_count > 3
          @next_generation[y][x] = '.'
        end

        #Any dead or live cell with exactly three live neighbours is a live cell
        if live_count == 3
          @next_generation[y][x] = 'x'
        end
       end # end for col
      end #end for row

    @new_generation = @next_generation
  end #end def

  def get_next_generation
    @next_generation
  end

  #helper for diplaying the worlds nicely
  def displayLife
    @next_generation.each_with_index do |row, y|
        puts row.map { |i| "" + i.to_s + "" }.join()
    end
  end

  #Check the edge cases, make sure we are not checking nonexistent neighbours
  def checkBordersOK(y, x)
    !(y < 0) && !(x < 0) && !(y > @max_row) && !(x > @max_col)
  end

end
