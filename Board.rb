require_relative "Card"
#need board.clear
#need board[] method

# Reveal Method
# Check every position
# if face_up then print face_value
# else print " "
class Board

  def initialize()
    @grid = Array.new(4) {Array.new(4)}
    self.populate
  end

  # [[J,K,L,I]
  # [D,L,I,P]
  # [J,K,L,I]
  # [A,D,D,D]]

  def populate
    alpha = ("A".."Z").to_a
    positions = self.random_positions
    values = alpha.sample(8)
    face_values = []

    2.times do
        face_values << values
    end

    face_values.flatten.each_with_index do |letter, idx1|
        positions.each_with_index do |position, idx2|
            if idx1 == idx2
                @grid[position[0]][position[1]] = Card.new(letter, position)
            end
        end
    end
    
  end

  def random_positions
    positions = []

    while positions.length < @grid.length**2
        
        first_number = rand(0...@grid.length)
        second_number = rand(0...@grid.length)

        new_position = [first_number,second_number]

        if !positions.include?(new_position)
            positions << new_position
        end

    end
    positions
  end

  def print_grid
    top_line = " "
    (0..@grid.length).each do |i|
      if i == 0 
        top_line << " "
      else
        top_line << (i - 1).to_s + " "
      end
    end

    puts top_line
    @grid.each_with_index do |row,i|
      new_str = (i).to_s + " "
      row.each do |ele|
        if !ele.nil?
            if ele.face_up 
                new_str << ele.face_value + " "
            else
                new_str << " " + " "
            end
        end
      end
      puts new_str
    end

  end

  def reveal(position)

  end

#   def [](position)
#     @grid[position[0]][position[1]]
#   end

  def get_card(position)
    @grid[position[0]][position[1]]
  end
  

  def board_full?
    @grid.flatten.all? {|ele| ele.face_up }
  end

end

a = Board.new()
a.populate
a.print_grid
