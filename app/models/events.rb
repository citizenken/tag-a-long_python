class Events < ActiveRecord::Base
  belongs_to :user
  acts_as_mappable
  
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :location, :presence => true
  validates :time, :presence => true
  validates :count_members, :presence => true
  validates :max_members, :presence => true

end
