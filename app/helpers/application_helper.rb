module ApplicationHelper

	def unapproved
		@unapproved = User.where(approved: 'false')
	end

  	def has_role?(role)
    	return true if current_user.role == role.to_s
  	end

	def generate_admin_link(options)
	 	link_to(options[:title_text], options[:path]) if current_user.role == 'admin'
	end

	def get_volunteer_counts(role, event)
		#count = UserSubEvent.where(sub_event_id: event.sub_events.map).count

		#count = UserSubEvent.where('sub_event_id in (?)', event.sub_events.map {|x| x.id})
				
		count = SubEvent.joins(:users).where('sub_event_id in (?) and users.role = ?', event.sub_events.map {|x| x.id}, role)

		output = event.sub_events.sum(role.to_s + '_num')
		"#{count.count} of #{output}"
	end

end
