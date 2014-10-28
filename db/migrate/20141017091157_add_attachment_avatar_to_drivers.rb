class AddAttachmentAvatarToDrivers < ActiveRecord::Migration
  def self.up
    change_table :drivers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :drivers, :avatar
  end
end
