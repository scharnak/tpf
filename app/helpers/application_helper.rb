module ApplicationHelper


  def has_role?(role)
    return true if current_user.role == role.to_s
  end

def generate_admin_link(options)
 link_to(options[:title_text], options[:path]) if current_user.role == 'admin'
end


end
