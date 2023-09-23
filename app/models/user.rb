class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  class User < ApplicationRecord
    validates :email, presence: { message: "" }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: { message: "" }, length: { minimum: 6 }
    validates :password_confirmation, presence: { message: "" }
    validates :name, presence: { message: "" }
  end# 他の属性に対するバリデーションを追加することもできます
end
