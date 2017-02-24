require'sinatra'
require'sinatra/contrib/all'
require_relative'../models/tag'
require_relative'../models/transaction'
require_relative'../models/wallet'

############See All transactions########
get '/transactions' do
  @wallet = Wallet.show
  @transactions = Transaction.all
  @tags = Tag.all
  erb(:"transactions/index")
end

############Submit new transaction######
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  spend = params[:value].to_i
  @new_wallet = Wallet.find
  @new_wallet.budget -= spend
  @new_wallet.update
  redirect '/transactions'
end

##########Delete transaction##################
post '/transactions/:id/delete' do
  deleted = Transaction.find(params[:id])
  amount = deleted.value
  @new_wallet = Wallet.find
  @new_wallet.budget += amount
  @new_wallet.update
  Transaction.delete(params[:id])
  redirect '/transactions'
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








