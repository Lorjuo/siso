class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :scope

      t.timestamps
    end
  end
end
