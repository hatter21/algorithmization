class Sort
@@size_array = 10000
@@interval = 1000
@@time_insertion_sort = 0
@@time_sorting_with_known_interval = 0	

	def create_array
	@@array = []
		for i in 0..@@size_array -1 
			@@array[i] = rand(@@interval)
		end 
	end

	def puts_array
		puts "Random array is:"
		p @@array 
	end

	def insertion_sort
		start = Time.now
		@@array_i_s = []
		@@array_i_s.concat(@@array)
		for i in 1..@@array_i_s.size - 1
			value = @@array_i_s[i]
			j = i - 1
			while j >= 0 and @@array_i_s[j] > value 
				@@array_i_s[j + 1] = @@array_i_s[j]
				j = j - 1 
				@@array_i_s[j + 1] = value
			end
		end
		finish = Time.now
		@@time_insertion_sort = finish - start
	end

	def puts_insertion_sort
		puts "Array resulting by sorting insert:"
		p @@array_i_s
	end 

	def sorting_with_known_interval
		start = Time.now
		@@array_s_w_k_i = []
		help_array = Array.new(@@size_array)
		for i in 0..@@size_array - 1 
			index = @@array[i]
			number_of_repetitions = help_array[index].to_i + 1
			help_array[index] = number_of_repetitions
		end

		for j in 0..@@interval
			if help_array[j].nil? == false 
				repetitions = help_array[j].to_i
				for k in 1..repetitions
					@@array_s_w_k_i << j
				end			
			end
		end
		finish = Time.now
		@@time_sorting_with_known_interval = finish - start
	end

	def puts_sorting_with_known_interval
		puts "Array resulting by sorting with a known interval:"
		p @@array_s_w_k_i
	end

	def time_sorting
		puts "Time spent on sorting insert: " + @@time_insertion_sort.to_s
		puts "Time spent on sorting with known line: " + @@time_sorting_with_known_interval.to_s
	end
end
f = Sort.new
f.create_array
f.puts_array
f.insertion_sort
f.puts_insertion_sort
f.sorting_with_known_interval
f.puts_sorting_with_known_interval
f.time_sorting
