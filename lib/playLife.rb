#Simulator for Conway's game of life
#Feel free to write your own world e.g. test.world, glidergun.world
#Please have a look at demo.sh on how to run the simulations

require "./game_of_life.rb"

class PlayLife
  @@world = []
  @@generations = 10
  @@delay = 0.5

  def self.load_world(file_name)
    @@world = []
    File.open(file_name).each_line{ |s|
      @@world << s.split("")
    }
  end

  def self.runLife(delay = nil, generations = nil)
    delay ||= @@delay
    generations ||= @@generations

    gameOfLife = GameOfLife.new(@@world)
    generations.times do
      gameOfLife.next_generation()

      system("clear")
      gameOfLife.displayLife
      puts "Press Ctrl C to quit"
      sleep(delay)
    end
  end

  def self.delay=(delay)
    @@delay = delay
  end

end
