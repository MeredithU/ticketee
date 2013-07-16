class Project < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :tickets, :dependent => :destroy
  has_many :tickets, :dependent => :delete_all
  has_many :tickets, :dependent => :nullify

  validates :name, :presence => true
end
