class AddColumnGoalsNotesMeetingUrl < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :notes, :text
    add_column :goals, :meetingURL, :text
  end
end
