class CreatePages < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :user, foreign_key: true

    create_table :pages do |t|
      t.string :name
      t.text :description
      t.text :contact
      t.references :user, null: false, foreign_key: true
      t.references :page_type, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
