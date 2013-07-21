class Project < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :tickets, :dependent => :destroy
  has_many :tickets, :dependent => :delete_all
  has_many :tickets, :dependent => :nullify

  scope :admins, where(:admin => true)

  validates :name, :presence => true, :uniqueness => true

  has_many :permissions, :as => :thing

  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  end

  def self.for(user)
    user.admin? ? Project : Project.viewable_by(user)
  end
end
