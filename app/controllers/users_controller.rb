# GETS ============================================
get '/signup' do
	erb :signup
end


# POSTS ============================================

post '/signup' do
	@user = User.create(name: params[:user_name], email: params[:user_email], password: params[:user_password])
  if @user.save 
  	@errors = false
  	session[:user_id] = @user.id 
    redirect to ("/secret/#{@user.id}")
  else
     @errors = true
     erb :signup
  end
end