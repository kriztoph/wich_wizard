class CreateSandwiches < ActiveRecord::Migration
  def change
    create_table :sandwiches do |t|
      t.string :sandwich_type

      t.timestamps
    end
  end
end
