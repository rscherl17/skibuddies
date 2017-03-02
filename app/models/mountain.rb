class Mountain < ApplicationRecord
  # Direct associations

  has_many   :trails,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
