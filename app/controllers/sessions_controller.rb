# GETS ============================================

get '/signin' do
	erb :signin
end

get '/logout' do
 	session.clear
  erb :index	
end

# POSTS ============================================

post '/signin' do
	user = User.authenticate(params[:user_mail], params[:user_password])      
	if user != nil
    session[:user_id] = user.id
    redirect to ("/secret/#{user.id}")
 	else
  	@errors = true
  	erb :signin
  end

end

