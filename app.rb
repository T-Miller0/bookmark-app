require 'sinatra/base'
require_relative 'lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Welcome to Bokkmarkz'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.create
    @bookmarks.get_bookmarks
    erb(:bookmarks)
  end

  run! if app_file == $0
end
