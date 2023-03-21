class Board

  def initialize()
    @grid = Array.new(4) {Array.new(4)}
  end

  def populate
    alpha = ("A".."Z").to_a
    positions = self.random_positions
    values = alpha.sample(8)
    face_values = []

    2.times do
        face_values << values
    end

    face_values.each_with_index do |letter, idx1|
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
end