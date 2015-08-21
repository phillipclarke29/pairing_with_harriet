# def random_pair1 array
# length = array.length
# array.shuffle!
# if length.odd?
# 	p"You need to have an even number of people to pair"
# 	p 
# 	p"So I have removed somebody randomly"
# 	p
# 	p "The unlucky person is"
# 	loner = array.pop
# 	p loner.to_s
# end
# 	puts "Here are the random pairings"
	
# 	array.each_slice(2) do |b|
#     p b[0] + ' is paired with ' + b[1]
# end
# end




# def new_pairing(names_array,*paired_names)
# 	original_people_array = names_array
# 	original_paired_names = paired_names


# 	new_pair = random_pair(names_array)
# 	new_pair.each do |pair| 
# 		pair.sort!
# 	end
# 	#p new_pair
# 	existing_pairs = paired_names.each do |pair| 
# 		pair.sort!
# 	end
# 	#p existing_pairs

# 	p names_array

# 	for i in 0...new_pair.length do
# 		for j in 0...existing_pairs.length do
# 			if existing_pairs[j] == new_pair[i]
# 				return new_pairing(original_people_array,original_paired_names)
# 			end
# 		end
# 	end



# 	return new_pair

# end


def random_pair array
	array.shuffle!
	result = []
	if array.length.odd?
		array.pop
	end 
	array.each_slice(2) do |b|
		array1 = []
	    array1 << b[0]
	    array1 << b[1]
	    result << array1
	end
	return result
end




def new_pairing(names_array, paired_names)
	original_people_array = []
	names_array.each do |name|
			original_people_array << name
	end
	original_paired_names = []
	paired_names.each do |pairs|
		original_paired_names << pairs
	end

	new_pair = random_pair(names_array)
	new_pair.each do |pair| 
		pair.sort!
	end
	#p new_pair
	existing_pairs = paired_names.each do |pair| 
		pair.sort!
	end
	#p existing_pairs

	#p names_array

	for i in 0...new_pair.length do
		for j in 0...existing_pairs.length do
			if existing_pairs[j] == new_pair[i]
				puts "Recursion is going on.."
				return new_pairing(original_people_array,original_paired_names)
			end
		end
	end



	return new_pair
	#*paired_names (splat) will be arrays of paired names of the pairing that already taken
	#place.  There may be more than one say:  [["Harry","James"],["Amy","David"]],
	#[["Harry","David"],["Yang","Bradley"],["Lisa","Olivia"]].
	#the function needs to return a random pairing array which no pairing is a repeat 
	#from pairing that has already taken place.
	#for best practice: try to make the script efficient (fast) as possible.
end

#p new_pairing(people, pairing1)


####################################

def random_pairing_new_with_comments(names, pairs)
	p names
	results = []
	existing_pairs = {}
	pairs.each do |pairs|
		if existing_pairs.has_key?(pairs[0])
			existing_pairs[pairs[0]] << pairs[1]
		else
			existing_pairs[pairs[0]] = []
			existing_pairs[pairs[0]] << pairs[1]
		end
		if existing_pairs.has_key?(pairs[1])
			existing_pairs[pairs[1]] << pairs[0]
		else
			existing_pairs[pairs[1]] = []
			existing_pairs[pairs[1]] << pairs[0]
		end
		
	end
	p existing_pairs
	p 'iteration starts'
	
	while names.length >= 2
		name = names[0]
		pair_array = []
		pair_array << name
		hat = names - existing_pairs[name]
		hat.delete(name)
		index = rand(0..hat.length-1)
		pair_array << hat[index]
		names.delete(hat[index])
		names.delete(names[0])	
		results << pair_array
		existing_pairs[pair_array[0]] << pair_array[1]
		existing_pairs[pair_array[1]] << pair_array[0]
		puts ''
		p 'start this iteration results'
		p existing_pairs
		p names
		p pair_array
		p results
		p 'end this iteration results'
		puts ''
	end
	
	return results 
end


#p random_pairing_new_with_comments(people, pairing1)





people = ['Yana','Harriet','Lucy','Joe','Tim','Sarah','Usman','Matt','Adrian']
pairing1 = [["Yana", "Joe"],["Joe","Usman"], ["Usman", "Matt"], ["Adrian", "Sarah"], 
	["Lucy", "Tim"]]
pairing2 = [["Sarah", "Yana"], ["Lucy", "Matt"], ["Tim", "Usman"], 
	["Adrian", "Harriet"]]

def random_pairing_new(names, *paired_list)
	pairs = paired_list.flatten(1)
	results = []; existing_pairs = {}
	pairs.each do |pairs|
		if existing_pairs.has_key?(pairs[0])
			existing_pairs[pairs[0]] << pairs[1]
		else
			existing_pairs[pairs[0]] = []
			existing_pairs[pairs[0]] << pairs[1]
		end
		if existing_pairs.has_key?(pairs[1])
			existing_pairs[pairs[1]] << pairs[0]
		else
			existing_pairs[pairs[1]] = []
			existing_pairs[pairs[1]] << pairs[0]
		end
	end
	#p existing_pairs   #uncomment to see the existing pair hash, 
	
	while names.length >= 2
		name = names[0]
		pair_array = []
		pair_array << name
		hat = names - existing_pairs[name]
		hat.delete(name)
		index = rand(0..hat.length-1)
		pair_array << hat[index]
		names.delete(hat[index])
		names.delete(names[0])	
		results << pair_array
		existing_pairs[pair_array[0]] << pair_array[1]
		existing_pairs[pair_array[1]] << pair_array[0]
	end
	
	return results 
end
p random_pairing_new(people, pairing1,pairing2)
