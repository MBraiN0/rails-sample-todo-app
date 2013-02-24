class Post < ActiveRecord::Base
  has_many :comments
  attr_accessible :content, :name, :title

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
