class Card
    attr_accessor :face_up
    attr_reader :face_value

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def ==(other_card)
        other_card.is_a?(self.class) && other_card.face_value == @face_value
    end

end