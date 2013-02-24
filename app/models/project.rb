class Project < ActiveRecord::Base
  attr_accessible :desc, :title

  has_many :todo_lists
end
