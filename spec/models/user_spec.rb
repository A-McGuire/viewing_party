require 'rails_helper'

RSpec.describe User do 
  describe 'validations' do 
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password_digest}
  end 
  describe 'relationships' do 
    it {should have_many :friendships}
    it {should have_many(:friends).through(:friendships)}
  end 
end 