
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.column :name, :string
      t.column :url, :string
      t.column :status, :integer, default: 0

      t.timestamps null: false
    end
  end
end

