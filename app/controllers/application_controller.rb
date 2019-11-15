require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    #binding.pry
    #puts params
    @username = params["username"]
    @password = params["password"]
    @user = User.find_by(username: params[:username])
    if @user != nil && @user.password == params[:password] 
      # set our sesssion hash and redirect accordingly
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end
    
  end

  get '/account' do
    #binding.pry
    #@user = User.find_by(id: params[:id])
    #if @user != @user.current_user(sessio)
      #erb :error
    #end

    if @user.is_logged_in?(session)
      erb :account
    else 
      erb :error
    end 
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

