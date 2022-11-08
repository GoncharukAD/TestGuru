# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, default: false
      t.references :question, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end
