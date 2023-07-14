class ModifyRepliesTable < ActiveRecord::Migration[7.0]
    def up
      remove_index :replies, name: "index_replies_on_user_id"
      change_table :replies do |t|
        t.remove :user_id
      end
      change_table :replies do |t|
        t.references :author, polymorphic: true, null: false
        t.index [:author_id, :author_type], name: "index_replies_on_author"
      end
    end
  
    def down
      remove_index :replies, name: "index_replies_on_author"
      change_table :replies do |t|
        t.remove_references :author, polymorphic: true
        t.bigint :user_id, null: false
      end
      add_index :replies, :user_id, name: "index_replies_on_user_id"
    end
  
end
