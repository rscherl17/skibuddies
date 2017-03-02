class Trail < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :mountain,
             :counter_cache => true

  # Indirect associations

  # Validations

end
