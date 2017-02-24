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
  @tags = Tag.all
  erb(:"transactions/index")
end

############Submit new transaction######
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect '/transactions'
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