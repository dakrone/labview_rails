class Machine < ActiveRecord::Base
  validates_presence_of :name

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ? or ip LIKE ? or user LIKE ? or project LIKE ? or os LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"], :order => "name")
    else
      find(:all, :order => "name")
    end
    
  end
end
