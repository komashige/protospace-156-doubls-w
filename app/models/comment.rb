class Comment < ApplicationRecord
  belongs_to :protospace
  belongs_to :user 
  belongs_to :protospace

  validates :text, presence: true
end
