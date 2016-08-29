class ModelAddField < ActiveRecord::Migration
  def change
    add_column :models, :field, :string, null: true
  end
end
