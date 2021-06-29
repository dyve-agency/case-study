class CreateMeals < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE meal_types_enum AS ENUM ('breakfast', 'brunch', 'lunch', 'dinner');
    SQL

    create_table :meals do |t|
      t.column  :meal_type, :meal_types_enum, null: false
      t.decimal :fats,          precision: 8, scale: 2, null: false, default: 0.0
      t.decimal :calories,      precision: 8, scale: 2, null: false, default: 0.0
      t.decimal :proteins,      precision: 8, scale: 2, null: false, default: 0.0
      t.decimal :carbohydrates, precision: 8, scale: 2, null: false, default: 0.0


      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end

  def down
    drop_table :meals

    execute <<-SQL
      DROP TYPE meal_types_enum;
    SQL
  end
end
