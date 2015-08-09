class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if !user.role
        can :dashboard, User
    end

    if user.role == 'admin'
        can :manage, :all
    end

    if user.role == 'staff' || user.role == 'community' || user.role == 'intern'
        can [:read, :manage, :destroy, :update], User, :id => user.id
        cannot [:index, :create, :approve_users, :approve], User
        cannot [:read,:create,:update,:destroy,:manage], EventType
        cannot [:read,:create,:update,:destroy,:manage], VolunteerNote
        cannot [:create,:update,:destroy,:manage], Event
        can [:read], Event
        cannot [:create,:update,:destroy,:manage], SubEvent
        can [:read, :sign_up], SubEvent
        cannot [:create,:update,:destroy,:manage], Preference
        cannot [:create,:update,:destroy,:manage], PreferenceType
    end

    if user.role == 'guest'
        can [:read, :manage, :destroy, :update], User, :id => user.id
        cannot [:index, :create, :approve_users, :approve], User
        cannot [:read,:create,:update,:destroy,:manage], EventType
        cannot [:read,:create,:update,:destroy,:manage], VolunteerNote
        cannot [:create,:update,:destroy,:manage], Event
        cannot [:create,:update,:destroy,:manage], SubEvent
        cannot [:create,:update,:destroy,:manage], Preference
        cannot [:create,:update,:destroy,:manage], PreferenceType
    end

#use this to hide and show things based on the users role
#<% if can? :destroy, @user %>

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
