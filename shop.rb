require_relative 'candy.rb'
require_relative 'shelf.rb'

class Shop
    attr_accessor :unshelved_candy_list, :shelf_list
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
        i = 0
        candy_found = false
        while i < @shelf_list.length()
            if @shelf_list[i].shelf_candy_list.include?(candy_name)
                shelf_candy_index = retrieve_candy_index(@shelf_list[i].shelf_candy_list, candy_name)

                @unshelved_candy_list.push(@shelf_list[i].shelf_candy_list[shelf_candy_index])
                @unshelved_candy_list.last.shelved = false

                @shelf_list[i].shelf_candy_list.delete_at(shelf_candy_index)
                candy_found = true
            end
            i += 1
        end

        if candy_found == false
            puts "Could not find candy to unshelf."        
        end
    end

    def list_shelved_candies
        i = 0
        puts "Shelved Candies: "
        while i < @shelf_list.length()
            @shelf_list[i].list_candies_on_shelf()
            i += 1
        end
    end

    def list_unshelved_candies
        i = 0
        puts "Unshelved Candies: "
        while i < @unshelved_candy_list.length()
            puts @unshelved_candy_list[i].candy_name
            i += 1
        end
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