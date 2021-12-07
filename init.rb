require_relative 'shop.rb'

shop = Shop.new
continue = -1

until continue == 8
    puts "========================="   
    puts "Available options:"
    puts "1: Create new shelf."
    puts "2: Delete existing shelf."
    puts "3: Create new candy."
    puts "4: Shelf candy."
    puts "5: Unshelf candy."
    puts "6: List shelved candies."
    puts "7: List unshelved candies."
    puts "8: Exit.\n"

    print("Enter an option: ")
    continue = gets.chomp.to_i

    case continue
    when 1
        shop.add_shelf        

    when 2
        if(!shop.shelf_list.empty?)
            print("Select the index of the shelf you wish to delete. (Available indexes: 0 - ", shop.shelf_list.length() - 1, "): ")
            remove_index = gets.chomp.to_i

            shop.remove_shelf(remove_index)
        else
            puts "No shelves to remove."
        end

    when 3
        print("Enter candy name: ")
        candy_name = gets.chomp

        shop.new_candy(candy_name)

    when 4
        print("Enter name of candy you wish to shelf: ")
        candy_name = gets.chomp

        if(!shop.shelf_list.empty?)
            print("Enter the index of the shelf you wish to place the candy. (Available indexes: 0 - ", shop.shelf_list.length() - 1, "): ") 
            shelf_number = gets.chomp.to_i

            shop.shelf_candy(candy_name, shelf_number)
        else
            puts "No shelves exist."
        end
        
    when 5
        print("Enter name of candy you wish to unshelf: ")
        candy_name = gets.chomp

        shop.unshelf_candy(candy_name)

    when 6
        shop.list_shelved_candies

    when 7
        shop.list_unshelved_candies
        
    when 8
        "Exiting program."

    else
        puts "Invalid input. Please try again."
        
    end

    print("\n\n")
end