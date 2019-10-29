require('pry-byebug')
require_relative('./models/property.rb')

# Property.delete_all()

property1 = Property.new({
    'address' => '56 Castle Terrace',
    'value' => 450_000,
    'square_footage' => 800,
    'buy_let_status' => 'buy'
})

property2 = Property.new({
    'address' => '1 Edinburgh Castle',
    'value' => 30_000_000,
    'square_footage' => 20000,
    'buy_let_status' => 'let'
})

property1.save()
property2.save()

# properties = Property.all()

binding.pry

nil
