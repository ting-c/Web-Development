require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        else
            false
        end
    end

    def >(startup)
        if self.funding > startup.funding
            return true
        else
            false
        end        
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise "Invalid title!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding > salaries[employee.title]
            employee.pay(salaries[employee.title])
            @funding -= salaries[employee.title]
        else
            raise "Not enough funding"
        end
    end

    def payday
        employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
            @salaries[title] = salary if !@salaries.has_key?(title)
        end
        startup.employees.each {|employee| @employees << employee}
        startup.close
    end
end
