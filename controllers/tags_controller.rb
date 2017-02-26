require'sinatra'
require'sinatra/contrib/all'
require_relative'../models/tag'
require_relative'../models/transaction'
require_relative'../models/wallet'

#######################################
############TAGS#####################
######################################

##########Create new tag##############
post '/tag' do
  @tag = Tag.new(params)
  @tag.save
  redirect '/'
end

##########Delete tag##################
post '/tag/:id/delete' do
  Tag.delete(params[:id])
  redirect '/'
end