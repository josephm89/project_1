require'sinatra'
require'sinatra/contrib/all'
require_relative'../models/tag'
require_relative'../models/transaction'
require_relative'../models/wallet'

############See All transactions########
# get '/transactions' do
#   @wallet_full = Wallet.show_full_money
#   @wallet_current = Wallet.show_current_money

#   @transactions = Transaction.all
#   @tags = Tag.all
#   erb(:"transactions/index")
# end

############Submit new transaction######
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  spend = params[:value].to_i
  @new_wallet = Wallet.find_current
  @new_wallet.budget -= spend
  @new_wallet.update_current
  redirect '/'
end

##########Delete transaction##################
post '/transactions/:id/delete' do
  deleted = Transaction.find(params[:id])
  amount = deleted.value
  @new_wallet = Wallet.find_current
  @new_wallet.budget += amount
  @new_wallet.update_current
  Transaction.delete(params[:id])
  redirect '/'
end

##############Search by tag#############
get '/transactions/tags/:name/:tag_id' do
  erb(:"transactions/tags")
end

post '/transactions/tags/:name/:tag_id' do
  @transaction = Tag.new({'name' => params[:name],
    'id' => params[:tag_id].to_i
    }).transactions
  erb(:"transactions/tags")
end








