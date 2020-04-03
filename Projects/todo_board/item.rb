class Item
    attr_reader :deadline, :done
    attr_accessor :title, :description

    def self.valid_date?(date_str)
        date = date_str.split("-")
        if date[0].length == 4 && date [0].to_i.between?(1900, 2100) &&
            date[1].length == 2 && date[1].to_i.between?(1, 12) &&
            date[2].length == 2 && date[2].to_i.between?(1, 31)
            return true 
        else
            false
        end
    end

    def initialize(title, deadline, description)
        if Item.valid_date?(deadline)
            @title = title
            @deadline = deadline
            @description = description
            @done = false
         else
             raise 'Invalid deadline'
         end
    end

    def deadline=(new_date)
        if Item.valid_date?(new_date)
            @deadline = new_date 
        else
            raise 'Invalid deadline'
        end
    end

    def toggle
        if @done
            @done = false
        else
            @done = true
        end
    end

end