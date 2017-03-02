class Mountain < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  has_many   :trails,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
