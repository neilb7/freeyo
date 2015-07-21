class Program < ActiveRecord::Base
  belongs_to :admins
  has_many :days
end
