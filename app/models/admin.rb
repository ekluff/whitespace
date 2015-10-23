class Admin < ActiveRecord::Base
  devise :confirmable, :database_authenticatable, :lockable, :timeoutable, :trackable
end
