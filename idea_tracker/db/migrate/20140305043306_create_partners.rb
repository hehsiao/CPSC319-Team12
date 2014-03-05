class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :partner_name
      t.string :contact_name
      t.string :email
      t.integer :phone_num

      t.timestamps
    end
  end
end
