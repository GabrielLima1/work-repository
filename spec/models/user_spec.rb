# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validando User" do
    it "Cadastro de usuário" do
      User.create(name: "User Test", email: 'email@teste.com', password: '123456')

  		visit "/lists/new"

  		fill_in	'Email', with: 'email@teste.com'
  		fill_in 'Password', with: '123456'
  		click_on 'Log in'

      fill_in 'Lista', with: 'Coisas para fazer em casa'

  		fill_in 'list[works_attributes][0][name]', with: 'Lavar a Louça'



  		click_on 'Criar'

  		expect(page).to have_content('Lista Criada!')

  		# click_on 'Show'
      #
  		# expect(page).to have_content('Cook dinner')
  		# expect(page).to have_content('Make Tabule folowing the recipe')
    end
  end
end
