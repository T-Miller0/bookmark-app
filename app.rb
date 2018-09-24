require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello World!'
  end

  get '/bookmarks' do
    'List of bookmarks'
  end
end
