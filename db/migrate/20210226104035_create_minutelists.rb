# frozen_string_literal: true

class CreateMinutelists < ActiveRecord::Migration[6.1]
  def change
    create_table :minutelists do |t|
      t.text :minute, null: false
      t.string :member, null: false
      t.references :note, foreign_key: true, null: false

      t.timestamps
    end
  end
end
