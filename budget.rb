require'sinatra'
require'sinatra/contrib/all'
require'./models/tag'
require'./models/transaction'
require'./models/wallet'



get '/' do
  erb(:index)
end

###########Budget page#########
get '/wallet' do
  @wallet = Wallet.show
  erb(:"wallet/index")
end

############Set budget######
post '/wallet' do
  @wallet2 = Wallet.new(params)
  @wallet2.update
 redirect '/wallet'
end



#######################################
############TRANSACTIONS#####################
######################################

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





get '/transactions/tags/:name/:tag_id' do
  @transaction = Tag.new({'name' => params[:name],
    'id' => params[:tag_id].to_i
    }).transactions
  erb(:"transactions/tags")
end
##########tag select
post '/transactions/tags/:name/:tag_id' do
  @transaction = Tag.new({'name' => params[:name],
    'id' => params[:tag_id].to_i
    }).transactions

  erb(:"transactions/tags")
end








#######################################
############TAGS#####################
######################################

###########Show all tags############
get '/tags' do
  @tags = Tag.all
  erb(:"tags/index")
end
##########Create new tag##############
post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  redirect '/tags'
end

##########Delete tag##################
post '/tags/:id/delete' do
  Tag.delete(params[:id])
  redirect '/tags'
end