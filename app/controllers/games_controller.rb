get '/scoree' do
 	@rounds=Game.all
  	@users = User.all
  erb :record
end



get '/score' do
 	@rounds=Game.all
  erb :round
end

post '/games' do
  win = params[:score]
  Game.create(user_id: current_user.id, score: win)
	
end

post '/new_game' do
 redirect to ("/secret/#{current_user.id}") 
end
