class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user
      if user.password == params[:password]
      session[:user_id] = user.id
      redirect :'/account'
      end
    end
    erb :error
  end

  get '/account' do
    #@user = User.find(session[:id])
    if session[:user_id]
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear

    redirect :'/'
  end


end
