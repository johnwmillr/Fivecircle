class AddAttachmentImageToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :media, :image
  end
end
