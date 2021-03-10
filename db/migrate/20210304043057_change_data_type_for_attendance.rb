# frozen_string_literal: true

class ChangeDataTypeForAttendance < ActiveRecord::Migration[6.1]
  def self.up
    change_table :notes do |t|
      t.string :attend, array: true, default: []
    end
  end
end
