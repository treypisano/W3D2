class Card
  #attr_reader :face_value, :position_value

  def initialize(face_value, position_value)
    @face_up = false
    @face_value = face_value
    @hidden_value = face_value
    @position_value = position_value
  end

  def face_value
    @face_value
  end

  def face_up
    @face_up
  end
  # def hide
  #   if @face_value != ""
  #     @face_value = " "
  #   end
  # end

  # def reveal
  #   if @face_value == " "
  #   end
      
  # end

  # def change_face
  #   if @face_up == true
  #     @face_up = false
  #   else 
  #     @face_up = true
  #   end
  # end

end

# a = Card.new("J",[0,1])
# p a
# a.hide
# p a