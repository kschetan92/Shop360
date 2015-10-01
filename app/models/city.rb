class City < ActiveRecord::Base
  has_many :customers
end
