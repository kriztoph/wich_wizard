class Sandwich < ActiveRecord::Base
  attr_accessible :sandwich_type

  validates_presence_of :sandwich_type
end
