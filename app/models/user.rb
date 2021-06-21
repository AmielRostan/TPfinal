class User < ApplicationRecord
  has_one :person
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def full_name
    if self.person.nil?
      "anonimo"
    else
      self.person.full_name
    end
  end
end
