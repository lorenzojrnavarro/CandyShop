require_relative 'candy.rb'

class Shelf
    attr_accessor :shelf_candy_list

    def initialize()
        @shelf_candy_list = Array.new
    end

    def add_candy_to_shelf(candy_name)
        candy = Candy.new(candy_name)
        @shelf_candy_list << candy
        @shelf_candy_list.last.shelved = true
    end

    def list_candies_on_shelf
        @shelf_candy_list.each do |candy| 
            puts candy.candy_name
        end
    end

end

