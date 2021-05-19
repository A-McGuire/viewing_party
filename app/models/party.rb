class Party < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations

  def hosted_parties(host_id)
    Party.where("host_id = ?", current_user.id) #TODO: Refactor to model
  end
end
