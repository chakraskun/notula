# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :letternum
      t.text :agenda
      t.datetime :datetim
      t.text :minutes
      t.text :addnote

      t.timestamps
    end
  end
end
