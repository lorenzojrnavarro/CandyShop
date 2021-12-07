class Candy
    attr_accessor :candy_name, :shelved
    

    def initialize(candy_name = nil)
        @candy_name = candy_name
        @shelved = false
    end

    def ==(candy)
        @candy_name == candy        
    end
end
