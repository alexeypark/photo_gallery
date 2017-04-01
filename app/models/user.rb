class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos

  validates :name, presence: true, length: {minimum: 2, maximum: 20}

  def role?(r)
    role.include? r.to_s
  end
end
