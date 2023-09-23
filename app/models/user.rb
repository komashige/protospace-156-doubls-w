class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :password, presence: true, length: { minimum: 6 }
  # validates :password_confirmation, presence: true
  # validate :passwords_match
  # validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true
  validates :profile, presence: true
  validates :group, presence: true
  validates :position, presence: true
      
  private

    def passwords_match
      if password.present? && password_confirmation.present? && password != password_confirmation
        errors.add(:password_confirmation, "とパスワードが一致しません")
      end
    end
end
