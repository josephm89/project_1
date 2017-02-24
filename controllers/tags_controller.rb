require'sinatra'
require'sinatra/contrib/all'
require_relative'../models/tag'
require_relative'../models/transaction'
require_relative'../models/wallet'


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