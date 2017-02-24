require'pry'
require_relative'../models/tag'
require_relative'../models/transactions'

tag1 = Tag.new({
  'name' => 'food'
  })




transaction1 = Transaction.new({
  'description' => 'Corner shop',
  'value' => '20',
  'tag_id' => 'tag1.id'
  })