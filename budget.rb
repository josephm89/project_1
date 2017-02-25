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
  @wallet_current = Wallet.show_current_money
  @wallet_full = Wallet.show_full_money
  erb(:"wallet/index")
end

############Set budget######
post '/wallet' do
  @wallet = Wallet.new(params)
  @wallet.update_current
  @wallet_full = Wallet.new(params)
  @wallet_full.update_full
 redirect '/wallet'
end
