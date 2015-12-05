class ProjectsController < ApplicationController
	def index
		#render index by default! 
		@projects = Project.last_created_projects(5)
	end
end
