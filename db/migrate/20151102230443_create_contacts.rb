class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer 'user_id'
      t.string 'number'
      t.string 'first_name'
      t.string 'last_name'
    end
  end
end
