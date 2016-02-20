class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |tabele|
      tabele.integer 	:price
      tabele.string 	:name

      tabele.timestamps null: false
    end
  end
end
