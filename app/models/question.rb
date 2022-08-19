class Question < ApplicationRecord
  has_one :answer, dependent: :destroy
  
end
