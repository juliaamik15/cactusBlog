class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      if !user
        can :read, :all
      end

      if user
        admin_rules if user.role == "admin"
        editor_rules if user.role == "author"
        default_rules
      end
      #can :manage, User, id: user.id
     # if user.admin?
     #   can :manage, :all
     #  else
      #   can :read, :all

      # end
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

  def admin_rules
    can :manage, :all
  end

  def editor_rules
    can :manage, [Article]
    can :create, [Comment]
  end

  def default_rules
    can :read, :all
    can :create, [Comment]
  end
end
