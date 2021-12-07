require_relative 'candy.rb'
require_relative 'shelf.rb'

class Shop
    attr_reader :shelf_list
    
    def initialize
        @unshelved_candy_list = Array.new 
        @shelf_list = Array.new
    end  

    def new_candy(candy_name)
        candy = Candy.new(candy_name)
        @unshelved_candy_list.push(candy)
    end

    def shelf_candy(candy_name, shelf_number)        
        if @unshelved_candy_list.include?(candy_name)
            if(!@shelf_list.empty?)

                @shelf_list[shelf_number].add_candy_to_shelf(candy_name)
                @unshelved_candy_list.delete_at(retrieve_candy_index(@unshelved_candy_list, candy_name))
            else
                puts "No available shelves. Please create a shelf."
            end
        else
            puts "Candy could not be found."
        end
    end

    def unshelf_candy(candy_name)
        candy_found = false

        @shelf_list.each do |candy_list|
            if candy_list.shelf_candy_list.include?(candy_name)
                shelf_candy_index = retrieve_candy_index(candy_list.shelf_candy_list, candy_name)
        
                @unshelved_candy_list.push(candy_list.shelf_candy_list[shelf_candy_index])
                @unshelved_candy_list.last.shelved = false
    
                candy_list.shelf_candy_list.delete_at(shelf_candy_index)
                candy_found = true
            end
        end

        if candy_found == false
            puts "Could not find candy to unshelf."        
        end
    end

    def list_shelved_candies
        puts "Shelved Candies: "
        @shelf_list.each {|candy_list| candy_list.list_candies_on_shelf}
    end

    def list_unshelved_candies
        puts "Unshelved Candies: "
        @unshelved_candy_list.each {|candy| puts candy.candy_name}
    end

    def add_shelf
        newShelf = Shelf.new
        @shelf_list.push(newShelf)
    end

    def remove_shelf(shelf_number)
        if(@shelf_list[shelf_number] != nil)
            @shelf_list.delete_at(shelf_number)
        else
            puts "Shelf does not exist."
        end
    end

    def retrieve_candy_index(candyArr, candy_name)
        if candyArr.include?(candy_name)
            candyArr.index(candy_name)
        end
    end
end