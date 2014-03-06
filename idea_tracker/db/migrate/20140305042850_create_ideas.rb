class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.text :description
      t.integer :provider_partner_id
      t.integer :receiver_partner_id
      t.date :submission_date
      t.date :last_modified
      t.date :status_date_change

      t.timestamps
    end
  end
end
