class GameOfLife

  attr_reader :new_generation

  def initialize(data)
    @new_generation = data
  end

  def next_generation()

    #make a copy for next generation
    @next_generation = Marshal.load(Marshal.dump(@new_generation))

    #More rigorous checks to be added
    @max_row = @new_generation.length-1
    @max_col = @new_generation[0].length-1


    for row in 0..@new_generation.length-1
      for col in 0..@new_generation[row].length-1
        live_count = 0

        #To refactor check neighbours
        #row-1, col
        if checkBordersOK(row-1, col)
          if @new_generation[row-1][col] == 'x'
            live_count += 1
          end
        end

        #row+1, col
        if checkBordersOK(row+1, col)
          if @new_generation[row+1][col] == 'x'
            live_count += 1
          end
        end

        #row, col-1
        if checkBordersOK(row, col-1)
          if @new_generation[row][col-1] == 'x'
              live_count += 1
          end
        end

        #row, col+1
        if checkBordersOK(row, col+1)
          if @new_generation[row][col+1] == 'x'
            live_count += 1
          end
        end

        #row-1, col-1
        if checkBordersOK(row-1, col-1)
          if @new_generation[row-1][col-1] == 'x'
            live_count += 1
          end
        end

        #row-1, col+1
        if checkBordersOK(row-1, col+1)
          if @new_generation[row-1][col+1] == 'x'
            live_count += 1
          end
        end

        #row+1, col-1
        if checkBordersOK(row+1, col-1)
          if @new_generation[row+1][col-1] == 'x'
            live_count += 1
          end
        end

        #row+1, col+1
        if checkBordersOK(row+1, col+1)
          if @new_generation[row+1][col+1] == 'x'
            live_count += 1
          end
        end

        #Any live cell with fewer than two live neighbours dies
        #Any live cell with two or three live neighbours lives
        #Any live cell with more than three live neighbours dies
        if live_count < 2 || live_count > 3
          @next_generation[row][col] = '.'
        end

        #Any dead or live cell with exactly three live neighbours is a live cell
        if live_count == 3
          @next_generation[row][col] = 'x'
        end
       end # end for col
      end #end for row

#    for row in 0..@next_generation.length-1
#      for col in 0..@next_generation[row].length-1
#        puts @next_generation[row][col]
#      end
#      puts "........."
#    end

    @new_generation = @next_generation
  end #end def

  def get_next_generation
    @next_generation
  end

  def checkBordersOK(row, col)
    !(row < 0) && !(col<0) && !(row> @max_row) && !(col>@max_col)
  end

end
