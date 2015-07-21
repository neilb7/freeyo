class AddInfoToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :name, :string
    add_column :programs, :description, :text
  end
end
