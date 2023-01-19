class CreateBadgeRules < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_rules do |t|
      t.string :name, null: false, index: true, unique: true
      t.string :rule_type, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
