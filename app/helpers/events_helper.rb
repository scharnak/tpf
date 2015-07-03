module EventsHelper

  #This will get the current number of volunteers
  def volunteer_count(role,sub_event=nil)
    task = sub_event ||= @sub_event
    count = task.volunteer_count(role)
    "#{count} of #{task.try(role.to_s + '_num')}"
  end

end
