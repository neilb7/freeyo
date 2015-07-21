class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.references :admins, index: true

      t.timestamps
    end
  end
end
