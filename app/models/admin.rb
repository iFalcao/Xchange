class Admin < ApplicationRecord
  enum role: [:full_access, :restricted_access]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def tipo_de_acesso
      if self.restricted_access?
        'Acesso Restrito'
      else
        'Acesso Completo'
      end
  end
end
