class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # Monetizar o campo através da gem 'money-rails' -> Transforma o campo em apenas price, retirando o sufixo '_cents'
  monetize :price_cents
end
