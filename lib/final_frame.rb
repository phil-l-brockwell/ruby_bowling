require 'frame'
# class declaration for frame
class FinalFrame < Frame

    def complete?
      first_shot.taken && second_shot.taken || strike?
    end
end
