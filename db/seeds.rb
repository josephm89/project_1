require'pry'
require_relative'../models/tag'
require_relative'../models/wallet'
require_relative'../models/transaction'

tag1 = Tag.new({
  'name' => 'food'
  })

tag2 = Tag.new({
  'name' => 'rent'
  })

tag3 = Tag.new({
  'name' => 'electricity'
  })

tag4 = Tag.new({
  'name' => 'gas'
  })

tag1.save
tag2.save
tag3.save
tag4.save



transaction1 = Transaction.new({
  'description' => 'Corner shop',
  'value' => '20',
  'tag_id' => tag1.id
  })

wallet = Wallet.new({
  'budget' => '0',
  'id' => '1'
  })
wallet.save
transaction1.save



binding.pry
nil