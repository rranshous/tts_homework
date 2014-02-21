## Inventory homework

def print_out_items items
	puts "Current items:"
	items.each_with_index do | (item_name, quantity), current_index |
		puts "#{current_index + 1} #{item_name} - #{quantity}"
	end
end

def get_action(actions)
	puts "Choose an action to take"
	actions.each_with_index do | action_name, index |
	  puts "#{index + 1} #{action_name}"
	end
	return gets.chomp.to_i - 1
end

def edit_quantities items
	# Edit quantity
	## users should be
	## allowed to enter the new inventory count for the item.
	## figure out what item they are trying to edit
	puts "What item would you like to edit the quantity of?"
	item_to_edit = gets.chomp.to_i
	item_to_edit -= 1
	current_name = items.keys[ item_to_edit ]
	
	edit_quantity_of(current_name, items)
end

def edit_quantity_of item_name, items

	puts "Would you like to enter an offset? (y/n)"
	do_offset = gets.chomp.downcase

	if do_offset == 'y'
		puts "How many more #{item_name} are there?"
		offset_count = gets.chomp.to_i
		if items[item_name].nil?
			items[item_name] = offset_count
		else
			items[item_name] += offset_count
		end
	else
   		puts "How many #{item_name} are there?"
   		new_inventory_count = gets.chomp.to_i
   		# updating my hash, setting the item (by name) to have the new
		# count the user entered
		items[item_name] = new_inventory_count
	end
end

def edit_name(items)
	# edit name
	## and than prompt the user to enter which
	## item should be edited.
	puts "What item would you like to edit?"
	item_to_edit = gets.chomp.to_i
	item_to_edit -= 1

	## edit items new name
	puts "Enter the item's new name"
    new_name = gets.chomp

    ## figure out what item they are trying to edit
	current_name = items.keys[ item_to_edit ]

	# get items quantity
	current_quantity = items[current_name]

	# delete the entry for current item
	items.delete(current_name)

	# add a new entry under the new name, using same quantity
	items[new_name] = current_quantity
end

def add_item items
	# add item
	puts "What is the new item's name"
	new_name = gets.chomp
	edit_quantity_of(new_name, items)
end

def remove_item items
	# remove item
	## add items and remove items
	puts "What item would you like to remove?"
	item_to_edit = gets.chomp.to_i
	item_to_edit -= 1
	current_name = items.keys[ item_to_edit ]

	# delete the entry for current item
	items.delete(current_name)
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

## Creating a hash with a default value
# items = Hash.new(0)
# items['Shoes'] = 4
# items['Socks'] = 2
# items['Belt'] = 1
# items['Hat'] = 5

## updating a hash "in place" so that it includes
## the K/V pairs from the other hash.
# items.update({
#   'Shoes' => 4,
#   'Socks' => 2,
#   'Belt' => 1,
#   'Hat' => 5
# })


## the program should output the list of items and their current
## item counts to the screen
actions = ['Add item', 'Remove item', 'Edit name', 'Edit Quantity']

ADD_ITEM = 0
REMOVE_ITEM = 1
EDIT_NAME = 2
EDIT_QUANTITY = 3

while true

	do_user_action(items)

	action_to_take_index = get_action(actions)

	print_out_items(items)

	if action_to_take_index == ADD_ITEM
		add_item(items)

	elsif action_to_take_index == REMOVE_ITEM
		remove_item(items)

	elsif action_to_take_index == EDIT_NAME
		edit_name(items)

	elsif action_to_take_index == EDIT_QUANTITY
		edit_quantities(items)
	end

	print_out_items(items)
end