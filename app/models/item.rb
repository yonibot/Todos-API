class Item < ActiveRecord::Base
  belongs_to :user
  validates :completed, inclusion: { in: [true, false] }
  validates :content, presence: true
  default_scope { order('created_at DESC') }

end
