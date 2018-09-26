require 'sinatra/base'
require_relative 'lib/bookmarks'

class BookmarkManager < Sinatra::Base
  use Rack::Session::Pool

  get '/' do
    'Welcome to Bokkmarkz'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.new('bookmarks')
    @bookmark_list = @bookmarks.get_all_bookmarks
    session[:bookmarks] = @bookmarks
    erb(:bookmarks)
  end

  get '/bookmarks/new' do
    erb(:new_bookmark)
  end

  post '/bookmarks/new' do
    session[:bookmarks].add_bookmark(params[:new_bookmark])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
