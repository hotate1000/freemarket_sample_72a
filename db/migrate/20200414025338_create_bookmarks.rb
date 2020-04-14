class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
      t.index [:user_id, :item_id], unique: true
      # ペアの重複を防ぐ。同じ投稿を何度もお気に入り出来ない
    end
  end
end
