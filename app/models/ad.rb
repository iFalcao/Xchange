class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # Paperclip
  has_attached_file :picture, styles: { medium: "320x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Monetizar o campo através da gem 'money-rails' -> Transforma o campo em apenas price, retirando o sufixo '_cents'
  monetize :price_cents
end
