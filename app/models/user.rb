class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, presence: true
  validates :group, presence: true
  validates :position, presence: true

  has_many :protospaces
  has_many :comments

      
  private

    def passwords_match
      if password.present? && password_confirmation.present? && password != password_confirmation
        errors.add(:password_confirmation, "とパスワードが一致しません")
      end
    end
end
