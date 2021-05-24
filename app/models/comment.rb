class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  
  validates :comment, presence: true, length: { minimum: 6, maximum: 300 }
end
