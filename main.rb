
# example code using models

require_relative 'models'

items = Item.all
items.each do |item|
  puts item.name
end

