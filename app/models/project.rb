class Project < ActiveRecord::Base
	has_many :entries

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum: 30}
	validates :name, format: {with: /[a-z0-9_ ]/i}

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

	def calculate_total_minutes
		myentries = entries
		minutes = 0
		myentries.each do |entry|
			minutes += entry.minutes.to_i
		end
		hours = minutes / 60
		minutes = minutes - (hours*60)
	end

	def calculate_total_hours
		myentries = entries
		hours = 0
		minutes = 0
		myentries.each do |entry|
			hours += entry.hours.to_i
			minutes += entry.minutes.to_i
		end
		hours += (minutes/60)

		# entries_to_search = entries
		# hours = entries_to_search.sum(:hours)
		# minutes = entries_to_search.sum(:minutes)
		# hours += minutes / 60
	end

end
