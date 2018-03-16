class ModelAddField < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :field, :string, null: true
  end
end
