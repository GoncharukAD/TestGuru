class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :level, column: :level, foreign_key: { to_table: :tests } #Попытка сделать связь с уровнем теста
      t.boolean :start, default: false
      t.boolean :finish, default: false

      t.timestamps
    end
  end
end
