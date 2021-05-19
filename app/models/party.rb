class Party < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations

  def time_format(time)
  end
end
