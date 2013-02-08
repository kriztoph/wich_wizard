class CreateSandwichOrders < ActiveRecord::Migration
  def change
    create_table :sandwich_orders do |t|
      t.string :orderer_name

      t.timestamps
    end
  end
end
