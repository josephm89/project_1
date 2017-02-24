require'sinatra'
require'sinatra/contrib/all'
require'./models/tag'
require'./models/transaction'

get '/' do
  erb(:index)
end
############See All transactions########
get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end
######Bring up create new transaction####
get '/transactions/new' do
  @transactions = Transaction.all
  @tags = Tag.all
  erb(:"transactions/new")
end
############Submit new transaction######
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect '/transactions'
end
###########Show all tags############
get '/tags' do
  @tags = Tag.all
  erb(:"tags/index")
end
##########Create new tag##############

#########Submit new tag##############

##########Delete tag##################