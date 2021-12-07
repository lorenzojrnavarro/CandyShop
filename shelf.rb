require_relative 'candy.rb'

class Shelf
    attr_accessor :shelf_candy_list

    def initialize()
        @shelf_candy_list = Array.new
    end

    def add_candy_to_shelf(candy_name)
        candy = Candy.new(candy_name)
        @shelf_candy_list.push(candy)
        @shelf_candy_list.last.shelved = true
    end

    def list_candies_on_shelf
        i = 0
        while i < @shelf_candy_list.length()
            puts @shelf_candy_list[i].candy_name
            i += 1
        end

        @shelf_candy_list.each{}
    end

end
