class Comment < ApplicationRecord
  belongs_to :protospace
  belongs_to :user 

  validates :text, presence: true
end
