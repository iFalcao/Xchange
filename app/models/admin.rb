class Admin < ApplicationRecord
  enum role: { :full_access => 0, :restricted_access => 1 }
  scope :with_full_access, -> { where(role: 'full_access')}

  paginates_per 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
end
