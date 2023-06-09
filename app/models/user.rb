class User < ApplicationRecord
  # Include default devise modules. Others available are:
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :jwt_authenticatable, jwt_revocation_strategy: self


  validates :first_name, :last_name, :email, presence: true 
  validates :password, presence: true, on: :create
  validates :first_name, :last_name, length: {minimum: 3, maximum: 55}
  validates :password, length: {minimum:6, maximum:100}, allow_blank: true

  def clean_up_passwords 
  end

end
