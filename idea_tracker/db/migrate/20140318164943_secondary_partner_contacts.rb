class SecondaryPartnerContacts < ActiveRecord::Migration
  def self.up
    add_column :partners, :secondary_contact_name, :string
    add_column :partners, :secondary_email, :string
    add_column :partners, :secondary_phone_num, :string
  end

  def self.down
    remove_column :partners, :secondary_contact_name
    remove_column :partners, :secondary_email
    remove_column :partners, :secondary_phone_num
  end
end
