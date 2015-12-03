class Item < ActiveRecord::Base
  belongs_to :user
  validates :completed, inclusion: { in: [true, false] }
end
