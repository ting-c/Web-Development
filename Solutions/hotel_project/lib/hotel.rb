require_relative "room"

class Hotel
  def initialize(name, hash)
      @name = name
      @rooms = {}
      hash.each { |key, val| @rooms[key] = Room.new(val) }
  end

  def name
    capitalize = @name.split(" ").map(&:capitalize)
    capitalize.join(" ")
  end

  def rooms
      @rooms
  end

  def room_exists?(room)
      if @rooms.has_key?(room)
        return true
      else
        false
      end
  end

  def check_in(person, room)
    if self.room_exists?(room)
        if @rooms[room].add_occupant(person)
            p 'check in successful'
        else
            p 'sorry, room is full'
        end
    else
        p 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| room.available_space >= 1 }
  end

  def list_rooms
      @rooms.each do |name, room|
        puts "#{name} #{room.available_space}"
      end

  end

end
