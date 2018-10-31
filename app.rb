require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative 'lib/bookmarks'

class BookmarkManager < Sinatra::Base
  use Rack::Session::Pool
  register Sinatra::Flash
  enable :method_override

  get '/' do
    'Welcome to Bokkmarkz'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.new
    session[:bookmarks] = @bookmarks
    @bookmark_list = @bookmarks.get_all_bookmarks
    erb(:bookmarks)
  end

  get '/bookmarks/new' do
    erb(:new_bookmark)
  end

  post '/bookmarks' do
    @bookmarks = session[:bookmarks]
    if @bookmarks.valid_url?(params[:new_bookmark]) && params[:title] != ''
      @bookmarks.add_bookmark(params[:new_bookmark], params[:title])
    elsif params[:title] != ''
      flash[:hello] = 'Bookmark invalid'
    else
      flash[:hello] = 'Title invalid'
    end
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :bookmark_update
  end

  patch '/bookmarks/:id' do
    @bookmarks = session[:bookmarks]
    @bookmarks.update_id(params[:id], params[:new_bookmark], params[:new_title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    @bookmarks = session[:bookmarks]
    @bookmarks.delete_id(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/comment' do
    erb :comment
  end

  post '/bookmarks/comment' do
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
