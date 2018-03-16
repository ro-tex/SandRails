class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :models do |t|

      t.timestamps null: false
    end
  end
end
