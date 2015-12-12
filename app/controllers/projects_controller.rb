class ProjectsController < ApplicationController
	def index
		#render index by default! 
		#@projects = Project.last_created_projects(5)
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:project_id])
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found'
	end

	def new
		@project = Project.new
	end

	def create
		p = Project.new(name: params[:project][:name], description: params[:project][:description])
		p.save

		redirect_to '/projects'
	end 

	def edit
		@project = Project.find(params[:project_id])

	end

	def update
		@project = Project.find(params[:project_id])
		@project.update(name: params[:project][:name], description: params[:project][:description])

		redirect_to "/projects/#{params[:project_id]}"
	end

	def destroy
		p = Project.find(params[:project_id])
		p.destroy
		redirect_to "/projects"
	end
end
