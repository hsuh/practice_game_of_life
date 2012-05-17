class GameOfLife

  def next_step(new_table, generations = 1)

    #make a copy for next generation
    next_generation_table = new_table

    #More rigorous checks to be added
    @max_row = new_table.length-1
    @max_col = new_table[0].length-1

    if generations == 1
      for row in 0..new_table.length-1
        for col in 0..new_table[row].length-1
          dead_count = 0
          live_count = 0
          #item for inspection
          cell_initial_state = new_table[row][col]

          #To refactor check neighbours
          #row-1, col
          if checkBordersOK(row-1, col)
            if new_table[row-1][col] == '.'
              dead_count += 1
            else
              live_count += 1
            end
          end

          #row+1, col
          if checkBordersOK(row+1, col)
            if new_table[row+1][col] == '.'
              dead_count += 1
            else
               live_count += 1
            end
          end

          #row, col-1
          if checkBordersOK(row, col-1)
            if new_table[row][col-1] == '.'
              dead_count += 1
            else
               live_count += 1
            end
          end

          #row, col+1
          if checkBordersOK(row, col+1)
            if new_table[row][col+1] == '.'
              dead_count += 1
            else
               live_count += 1
            end
          end

          #row-1, col-1
          if checkBordersOK(row-1, col-1)
            if new_table[row-1][col-1] == '.'
              dead_count += 1
            else
               live_count += 1
            end
          end

          #row-1, col+1
          if checkBordersOK(row-1, col+1)
            if new_table[row-1][col+1] == '.'
              dead_count += 1
            else
               live_count += 1
            end
          end

          #row+1, col-1
          if checkBordersOK(row+1, col-1)
            if new_table[row+1][col-1] == '.'
              dead_count += 1
            else
               live_count += 1
            end
          end

          #row+1, col+1
          if checkBordersOK(row+1, col+1)
            if new_table[row+1][col+1] == '.'
              dead_count += 1
            else
               live_count += 1
            end
          end

          #Any live cell with fewer than two live neighbours dies
          #Any live cell with two or three live neighbours lives
          #Any live cell with more than three live neighbours dies

          #Any dead cell with exactly three live neighbours becomes a live cell
          if live_count == 3
            #if the cell is live initially it will still live
            next_generation_table[row][col] = 'x'
          end
       end # end for col
      end #end for row
    end #end if generations


    for row in 0..new_table.length-1
      for col in 0..new_table[row].length-1
        puts next_generation_table[row][col]
      end
        puts "####"
    end

    return next_generation_table
  end #end def


  def checkBordersOK(row, col)
    !(row < 0) && !(col<0) && !(row> @max_row) && !(col>@max_col)
  end

end
