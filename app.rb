require 'sinatra/base'
require_relative 'lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Welcome to Bokkmarkz'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  run! if app_file == $0
end
