class Asset < ActiveRecord::Base
  belongs_to :admins
  extend Dragonfly::Model
  dragonfly_accessor :video
  validates_property :ext, of: :video, as: 'mp4'
end
