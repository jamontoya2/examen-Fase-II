before '/secret/:id' do 
  unless session[:user_id]
    redirect to '/signin'
  end
  @user = User.find(params[:id])
end
	

get '/' do
  erb :index
end


get '/secret/:id' do
  erb :secret
end


