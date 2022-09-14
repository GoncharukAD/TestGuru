class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 30, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
