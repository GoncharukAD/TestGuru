class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, limit: 100, null: false
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
