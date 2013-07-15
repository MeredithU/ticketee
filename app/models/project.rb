class Project < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :tickets

  validates :name, :presence => true
end
