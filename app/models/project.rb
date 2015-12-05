class Project < ActiveRecord::Base

	def self.iron_find(id)
		where(id: id).first
	end

	def self.clean_old
		date = Time.now.midnight-1.week
		projects = where("created_at < ?", date)
		projects.destroy_all
	end

	def self.last_created_projects(number)
		limit(number).order(created_at: :desc)
	end
end
