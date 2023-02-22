class Blog < ApplicationRecord

  # Validations
  validates :title, :author_name, presence: true
end
