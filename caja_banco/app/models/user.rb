class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :persona
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {maximum: 50}
  validates :persona_id, presence: true
  validates :email, presence: true
  validates :password, presence: true

end

