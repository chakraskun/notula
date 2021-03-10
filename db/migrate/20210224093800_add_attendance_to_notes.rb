# frozen_string_literal: true

class AddAttendanceToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :attendance, :string
  end
end
