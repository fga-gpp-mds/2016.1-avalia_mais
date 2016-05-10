Given (/^I am on the log in page I will log in$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'teste'
	fill_in 'session_password', :with=> '123456'
	click_button ("Entrar")
	expect(page).to have_content("Login realizado com sucesso")
end

And (/^I will search for "Nike" and visit the page$/) do
	fill_in 'Buscar', :with=> 'Nike'
	click_button ("Buscar")
	click_link('Nike')
end

And (/^I will fill "3" stars in personal evaluation$/) do
	find("#star-3").click
end

And (/^I will choose "Sim" in response time of clains$/) do
	choose('confirm-radio')
end

And (/^I will fill "2" in response time$/) do
	fill_in 'response_response_time', :with => '2'
end

And (/^I will fill "-2" in response time$/) do
	fill_in 'response_response_time', :with => '-2'
end

And (/^I will press on submit button$/) do
	click_button ("Submeter")
end


Then (/^the page should give me a message "Avaliação realizada com sucesso!"/) do
	expect(page).to have_content("Avaliação realizada com sucesso!")
end

Then (/^the page should give me a message "Sua avaliação por tempo de resposta foi realizada com sucesso!"/) do
	expect(page).to have_content("Sua avaliação por tempo de resposta foi realizada com sucesso!")
end
