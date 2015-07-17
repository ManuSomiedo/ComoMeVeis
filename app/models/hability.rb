class Hability < ActiveRecord::Base
   validates :name, presence: true, length: { minimum: 4, maximum: 25 }
   has_many :valorations, dependent: :destroy
end
