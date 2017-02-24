require'sinatra'
require'sinatra/contrib/all'
require'./models/tag'
require'./models/transaction'

get '/' do
  erb(:index)
end

get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

get '/transactions/new' do
  @transactions = Transaction.all
  erb(:"transactions/new")
end