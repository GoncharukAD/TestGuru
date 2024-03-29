# frozen_string_literal: true

class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question, foreign_key: { to_table: :questions }
      t.integer :correct_questions, default: 0
      t.boolean :sucessfully_passed, default: false
      t.string :remaining_time, null: true
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
