module SubEventsHelper

  def attended_sub_event?(user)
    UserSubEvent.find_by(user_id: user.id, sub_event_id: @sub_event.id).attended
  end
end
