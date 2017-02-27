class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.belongs_to :user, index: true
  		t.string :score
  		t.timestamps 
  	end
  end
end
