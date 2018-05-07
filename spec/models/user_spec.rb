require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validando User" do
    it "Cadastro de usuário" do
      visit '/users/new'
      within("#new_user") do
        fill_in 'Name', :with => 'First Last'
        fill_in 'Email', :with => 'email@example.com'
        fill_in 'Password' ,:with => 'password'
      end
      click_button 'Create user'
      expect(user.valid?).to be_truthy
    end
  end
end
