class TodoList < ActiveRecord::Base
  attr_accessible :title

  has_many :todo_items
  belongs_to :project
end
