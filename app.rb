require 'sinatra/base'
require_relative 'lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Welcome to Bokkmarkz'
  end

  get '/bookmarks' do
    default_list = ['www.bbc.co.uk', 'www.google.co.uk', 'www.youtube.com']
    @bookmarks = Bookmarks.create(default_list)
    erb(:bookmarks)
  end

  run! if app_file == $0
end
