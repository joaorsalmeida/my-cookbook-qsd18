require 'rails_helper'

feature 'User sign in' do
  scenario 'using an email and a password' do
    user = User.create(email: 'joao@email.com', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    within('div.actions') do
      click_on 'Entrar'
    end

    expect(page).to have_content("Bem-vindo #{user.email}")
    expect(page).not_to have_link('Entrar')
  end
end
