FactoryBot.define do
  factory :blog do
    sequence(title) { |n| "Title - #{n}" }
    description { 'Metafic Description' }
    author_name { 'Metafic author' }
    is_active { true }
  end
end