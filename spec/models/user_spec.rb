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
