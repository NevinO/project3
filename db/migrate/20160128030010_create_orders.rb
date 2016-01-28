class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :order_status
      t.decimal :subtotal
      t.decimal :total
    end
  end
end
