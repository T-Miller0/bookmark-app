require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Welcome to Bokkmarkz'
  end
  
  get '/bookmarks' do
    @bookmark_list = ['www.bbc.co.uk', 'www.google.co.uk', 'www.youtube.com']
    erb(:bookmarks)
  end

  run! if app_file == $0
end
