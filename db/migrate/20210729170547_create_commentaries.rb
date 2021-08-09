class CreateCommentaries < ActiveRecord::Migration[6.1]
  def change
    create_table :commentaries do |t|
      t.belongs_to :user
      t.belongs_to :new
      t.text :body

      t.timestamps
    end
  end
end