require 'rails_helper'

RSpec.describe Party do 
  describe 'relationships' do 
    it {should have_many :invitations}
    it {should have_many(:users).through(:invitations)}
  end 

  describe 'instance methods' do
    describe 'hosted_parties(host_id)' do
      it 'returns all parties created by the user' do
        @user = User.create!(email: "123@test.com", password: "1111")
        
      end
    end
  end
end 