class Permutations
@@array = []
@@number_permutations = 0

	def generation_array
		puts "Set the number of permutations!"
		@@number = gets.to_i
		for i in 1..@@number
			@@array[i-1] = i
		end
	end

	def generate_permutations(level = 0)
		if level == @@number - 1
			for i in 0..@@number - 1 
        			print("#{@@array[i]} ")
        		end
        		@@number_permutations += 1; print("\n")
    		else
    			for i in level..@@number - 1 
        			conversion = @@array[level]; @@array[level] = @@array[i]; @@array[i] = conversion;
        			generate_permutations(level + 1)
        			conversion = @@array[level]; @@array[level] = @@array[i]; @@array[i] = conversion;
    		    	end
    		end
	end

	def puts_number_permutations
		puts "Getting the number of permutations of the same: " + @@number_permutations.to_s
	end
end
f = Permutations.new
f.generation_array
f.generate_permutations
f.puts_number_permutations
