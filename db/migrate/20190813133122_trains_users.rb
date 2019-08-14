class TrainsUsers < ActiveRecord::Migration[5.2]
  def change
  	create_table :trains_users do |t|
  		t.integer :user_id
  		t.integer :train_id
  	end
  end
end
