class Comment < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :trail,
             :counter_cache => true

  # Indirect associations

  # Validations

end
