require_relative 'item'

class List
    attr_accessor :label
    
    def initialize(label)
        @label = label
        @items = []        
    end

    def add_item(title, deadline, description='')
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        end
        false
    end

    def size
        @items.length        
    end

    def valid_index?(index)
        return true if index.between?(0, @items.length-1)
        false
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
        false
    end

    def [](index)
        return nil if !self.valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts '----------------------------------------------------------------'
        puts @label.capitalize.rjust(30)
        puts '----------------------------------------------------------------'
        puts "Index  |   #{'Title'.ljust(25)}|   Deadline    |   Done"
        puts '----------------------------------------------------------------'
        @items.each.with_index do |item, i|
            if item.done 
                done_display = '[✓]'
            else
                done_display = '[ ]'
            end
            puts "#{i}      |   #{item.title.ljust(25)}|   #{item.deadline}  |   #{done_display}"
        end
        puts '----------------------------------------------------------------'
    end

    def print_full_item(index)
        item = @items[index]
        if item.done 
            done_display = '[✓]'
        else
            done_display = '[ ]'
        end
        puts '-------------------------------------------------'
        puts "#{'Title'.ljust(25)}|   Deadline    |   Done"
        puts '-------------------------------------------------'
        puts "#{item.title.ljust(25)}| #{item.deadline}    |   #{done_display}"
        puts 
        puts "#{item.description}"
        puts '-------------------------------------------------'
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index) || amount < 1
        if index == 0 
            puts 'item already on top of the list'
            return
        else
            amount.times do 
                self.swap(index, index - 1)
                index -= 1
            end
        end
        true
    end

      def down(index, amount=1)
        return false if !self.valid_index?(index) || amount < 1
        if index == @items.size - 1 
            puts 'item already at bottom of the list'
            return
        else
            amount.times do 
                self.swap(index, index + 1)
                index += 1
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
        true
    end

    def toggle_item(index)
        return false if !self.valid_index?(index)
        @items[index].toggle
        true
    end

    def remove_item(index)
        return false if !self.valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items.each.with_index do |item, i|
            if item.done
                @items.delete_at(i)
                return true
            end
        end
        false
    end

end