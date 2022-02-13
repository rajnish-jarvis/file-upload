class CreateAttachements < ActiveRecord::Migration[6.1]
  def change
    create_table :attachements do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.string :url
      t.string :tiny_url
      t.timestamps
    end
  end
end
