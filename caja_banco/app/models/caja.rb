class Caja < ActiveRecord::Base
  belongs_to :estado
  belongs_to :persona
end
