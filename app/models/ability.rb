class Ability
  include CanCan::Ability

  def initialize(user)
    case user && user.role
    when 'admin'
      can :manage, :all
    when 'user'
      can :manage, Post, user_id: user.id
      can :manage, User, id: user.id
      can :read, :all
    else
      can :read, :all
    end
  end
end
