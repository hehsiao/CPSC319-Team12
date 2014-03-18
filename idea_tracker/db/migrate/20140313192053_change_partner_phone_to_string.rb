class ChangePartnerPhoneToString < ActiveRecord::Migration
   def up
     change_column :partners, :phone_num, :string
   end

   def down
     change_column :partners, :phone_num, :integer
   end
end
