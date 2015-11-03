class CreateContactMessageRelationship < ActiveRecord::Migration
  def change
    add_column :messages, :contact_id, :integer
    add_column :messages, :user_id, :integer
  end
end
