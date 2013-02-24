class TodoItem < ActiveRecord::Base
  attr_accessible :desc, :status, :title

  belongs_to :todo_list
end
