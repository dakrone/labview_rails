class CreateMachines < ActiveRecord::Migration
  def self.up
    create_table :machines do |t|
      t.string :name
      t.string :ip
      t.string :user
      t.string :project
      t.string :os
      t.string :password
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :machines
  end
end
