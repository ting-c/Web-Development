require_relative 'list'
require_relative 'item'

class TodoBoard
    
    def initialize
        @board = {} 
        
    end

    def get_command
        puts "Enter a command with a space between the command and each args :"
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
           if args.length != 1
                puts 'must have 1 arg' 
                return true
           end
            @board[*args] = List.new(*args)

        when 'ls'
            puts 'Labels'
            @board.each_key {|label| puts label}

        when 'showall'
            puts 'All lists'
            @board.each { |label, list| puts "#{label} : #{list}" }

        when 'mktodo'
            if args.length < 3
                puts 'must have at least 3 args ' 
                return true
            elsif !Item.valid_date?(args[2])
                puts 'Invalid date (YYYY-MM-DD)'
                return true
            end
            list_label = args[0]
            title = args[1]
            deadline = args[2]
            description = args[3..-1].join(" ")

            @board[list_label].add_item(title, deadline, description)
        

        when 'up'
            if !args.length.between?(2,3)
                puts '2 or 3 args <list_label> <item_index> <optional_amount>' 
                return true
            elsif args[1..-1].any? { |ele| ele.to_i.to_s != ele }
                puts 'args must be integers'
                return true
            end
            other_args = args[1..-1].map(&:to_i)     
            @board[args[0]].up(*other_args)

        when 'down'
            if !args.length.between?(2,3)
                puts '2 or 3 args <list_label> <item_index> <optional_amount>' 
                return true
            elsif args[1..-1].any? { |ele| ele.to_i.to_s != ele }
                puts 'args must be integers'
                return true
            end
            other_args = args[1..-1].map(&:to_i)     
            @board[args[0]].down(*other_args)

        when 'swap'
            if args.length != 3
                puts 'must have 3 args' 
                return true
            elsif args[1..-1].any? { |ele| ele.to_i.to_s != ele }
                puts 'indices must be integers'
                return true
            end
            indices = args[1..-1].map(&:to_i)     
            @board[args[0]].swap(*indices)

        when 'sort'
            if args.length != 1
                puts 'must have 1 arg' 
                return true
            end
            @board[*args].sort_by_date!

        when 'priority'
            if args.length != 1
                puts 'must have 1 arg' 
                return true
            end
            
            @board[*args].print_priority

        when 'print'
            if args.empty?
                puts 'must have list_label'
                return true
            elsif args.length == 1
                @board[*args].print
            elsif args.length == 2
                if args[-1].to_i.to_s != args[-1]
                    puts 'index must be an integer'
                    return true
                end
                @board[args[0]].print_full_item(args[1].to_i)
            end
                         
        when 'toggle'
            if args.length != 2
                puts 'must have 2 args' 
                return true
            elsif args[1].to_i.to_s != args[1] 
                puts 'index must be an integer'
                return true
            end
            @board[args[0]].toggle_item(args[1].to_i)

        when 'rm'
            if args.length != 2
                puts 'must have 2 args' 
                return true
            elsif args[1].to_i.to_s != args[1] 
                puts 'index must be an integer'
                return true
            end
            @board[args[0]].remove_item(args[1].to_i)

        when 'purge'
            if args.length != 1
                puts 'must have 1 arg' 
                return true
            end
            @board[args[0]].purge
            
        when 'quit'
            return false
        else
            puts 'Unrecognized command'
        end

        true

    end

    def run
        while self.get_command
            next
        end
    end

end

TodoBoard.new().run