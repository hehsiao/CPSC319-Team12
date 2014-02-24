class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :c_name
    	t.string :c_email
    	t.integer :c_phone_num
    	t.string :taker
      t.timestamps
    end
  end
end
