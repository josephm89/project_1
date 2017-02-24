require'sinatra'
require'sinatra/contrib/all'

get '/' do
  erb(:index)
end

get '/transactions' do
  erb(:"transactions/index")
end