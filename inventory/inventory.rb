## Inventory homework

def print_out_items items
	puts "Current items:"

	# items.each do | key, value |
	items.each_with_index do | item, current_index |
		#puts "CURRENT ITEM: #{item}"
		#puts "CURRENT INDEX: #{current_index}"
		puts "#{current_index + 1} #{item[0]} - #{item[1]}"
	end
end

## Inventory system should track the inventory count of four items
## Need to track 4 item names and their counts
## 2 dimensions of data, name and the quantity
## hash with keys as inventory name, enforce uniqueness
items = {
  'Shoes' => 4,
  'Socks' => 2,
  'Belt' => 1,
  'Hat' => 5
}
item_names = ['Shoes','Socks','Belt','Hat']

## the program should output the list of items and their current
## item counts to the screen

while true

	print_out_items(items)

	## and than prompt the user to enter which
	## item should be edited.
	puts "What item would you like to edit?"
	item_to_edit = gets.chomp.to_i
	item_to_edit -= 1

	item_name = item_names[ item_to_edit ]
	puts "You chose #{item_names[item_to_edit]}"

	## users should be
	## allowed to enter the new inventory count for the item.
	puts "How many #{item_name} are there?"
	new_inventory_count = gets.chomp.to_i

	# updating my hash, setting the item (by name) to have the new
	# count the user entered
	items[item_name] = new_inventory_count

end