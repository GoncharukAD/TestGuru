class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title, limit: 50, null: false
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
