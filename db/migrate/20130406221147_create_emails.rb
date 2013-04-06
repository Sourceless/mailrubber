class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.string :get_token
      t.string :delete_token

      t.timestamps
    end
  end
end
