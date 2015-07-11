class Hability < ActiveRecord::Base
   validates :name, presence: true, length: { minimum: 4, maximum: 16 }
   has_many :valorations, dependent: :destroy
end
