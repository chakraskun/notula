class AddAttendanceToNoteteamlists < ActiveRecord::Migration[6.1]
  def change
    add_reference :noteteamlists, :member, index: true, foreign_key: true
    add_column :noteteamlists, :attendance, :boolean
  end
end
