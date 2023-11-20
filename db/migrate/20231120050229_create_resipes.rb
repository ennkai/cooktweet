class CreateResipes < ActiveRecord::Migration[7.0]
  def change
    create_table :resipes do |t|
      t.string :title,      null: false
      t.text :explanation,  null: false
      t.text :procedure,    null: false
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end


