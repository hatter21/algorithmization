class Partition
@@group = ["Igor","Serega","Andrey","Vitaliy"]
@@array = []
@@group_first = []
@@group_second = []
	def all_possible_variant
		@@one_version = []
		@@persons = @@group.size
		@@last_number = 2**@@persons - 1 
		for i in 0..@@last_number
			converter = i.to_s(2)
			converter.to_s
			converter.each_char {|char| @@one_version << char}
			difference_sizes = @@persons - @@one_version.size
			after_converter = "0"*difference_sizes + @@one_version.to_s
			@@array << after_converter
			@@one_version = []
		end
	end

	def partition_group
		@@one_version_g_f = []
		@@one_version_g_s = []
		@@binary_number = []	
		for i in 0..@@last_number
			converter = @@array[i]
			converter.each_char {|char| @@binary_number << char}
			for j in 0..@@persons - 1
				comparison = @@binary_number[j]
				if comparison.to_i == 1
					@@one_version_g_f << @@group[j]
				else
					@@one_version_g_s << @@group[j]
				end
			end
			@@group_first[i] = @@one_version_g_f
			@@group_second[i] = @@one_version_g_s
			@@one_version_g_f = []
			@@one_version_g_s = []
			@@binary_number = []
		end
	end

	def puts_group
		puts "All sorts of options split into first and second groups, respectively:"+ "\n" + "Versions of the first group:"
		p @@group_first
		puts "Versions of the second group:"
		p @@group_second	
	end

end
f = Partition.new
f.all_possible_variant
f.partition_group
f.puts_group

