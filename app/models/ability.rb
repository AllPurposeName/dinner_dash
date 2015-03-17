class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    order ||= Order.new
    if user.default?
      can :read, User, id: user.id
      can :read, Order
      can :create, Order
    end
    if user.admin?
      can :manage, :all
    end
  end
end
