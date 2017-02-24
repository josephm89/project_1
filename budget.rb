require'sinatra'
require'sinatra/contrib/all'
require_relative'models/wallet'
require_relative'controllers/transactions_controller'
require_relative'controllers/tags_controller'

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
