class Blog < ApplicationRecord

  validates :title, :author_name, presence: true
end
