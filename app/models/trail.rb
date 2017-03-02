class Trail < ApplicationRecord
  # Direct associations

  belongs_to :mountain,
             :counter_cache => true

  # Indirect associations

  # Validations

end
