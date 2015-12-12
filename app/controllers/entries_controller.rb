class EntriesController < ApplicationController

	def index
		@project = Project.find(params[:project_id])
		@entries = @project.entries
		@hours = @project.calculate_total_hours
		@minutes = @project.calculate_total_minutes
	end

	def new
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new
	end

	def create
		@p = Project.find(params[:project_id])
		entry = @p.entries.new(entry_params)
		entry.save
		redirect_to "/projects/#{@p.id}/entries"
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end

end
