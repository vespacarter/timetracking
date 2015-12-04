class SiteController < ApplicationController
	def home
		render 'home' #name of view
	end

	def contact
		render 'contact'
	end
end
