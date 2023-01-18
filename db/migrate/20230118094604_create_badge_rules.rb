class CreateBadgeRules < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_rules do |t|
      t.string :name, null: false
      t.integer :rule_type, null: false
      t.integer :value, null: false
      t.timestamps
    end
  end
end
