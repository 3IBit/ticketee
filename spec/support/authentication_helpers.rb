module AuthenticationHelpers
 
	 def sign_in_as!(user)
		 visit '/signin'
		 fill_in "Name", with: user.name
		 fill_in "Password", with: user.password
		 click_button 'Sign in'
		 expect(page).to have_content("Signed in successfully.")
	 end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :feature
end


#including for models or views only
#You can specify type: :model as a filter if you want to include a
#module only in your model specs. If you ever write any view specs,
#you can use type: :view to include this module only in the view
#specs. Similarly, you can use :features for specs that reside in
#spec/features.


module AuthHelpers

  def sign_in(user)
   session[:user_id] = user.id
  end
  
end

RSpec.configure do |c|
  c.include AuthHelpers, type: :controller
end