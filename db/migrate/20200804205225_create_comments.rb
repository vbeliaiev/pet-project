class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body

      t.references :user, foreign_key: true, dependent: :delete
      t.references :post, foreign_key: true, dependent: :delete
      t.timestamps
    end
  end
end
