class Category < ApplicationRecord
    paginates_per 5
    validates_presence_of :description
end
