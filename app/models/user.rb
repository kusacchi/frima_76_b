class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
        VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
        VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
        
  has_many :exhibitions, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one :purchase, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  validates :birthday, presence: true
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  

end
