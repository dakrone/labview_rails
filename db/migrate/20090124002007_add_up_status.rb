class AddUpStatus < ActiveRecord::Migration
  def self.up
    change_table :machines do |t|
      t.boolean :up_status, :default => false
    end
  end

  def self.down
    change_table :machines do |t|
      t.remove :up_status
    end
  end
end
