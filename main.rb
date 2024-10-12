# Name Mangler

@name = "Johanna Jackson"

# REVERSE NAME FROM [FIRST, LAST] TO [LAST, FIRST]
# OUTPUTS STR OF JOINED ARRAY
def reverse_name(name)
  split_name = name.split
  reversed_name_components = split_name.reverse
  reversed_name = reversed_name_components.join(' ')
  reversed_name
end

# ADDS "Borg" TO THE END OF reversed_name
def borgify(name)
  reversed_name = reverse_name(name)
  borgified_name = reversed_name + "Borg"
  borgified_name
end


puts "New name: #{reverse_name(@name)}"
puts "New borg name: #{borgify(@name)}"
