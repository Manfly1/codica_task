# frozen_string_literal: true

class Ability
  def initialize(user)
    can :manage, :all if user.admin?

    return unless user.doctor?

    can %i[read update], Doctor, id: user.id
    can :read, User, appointment: { doctor: user }
    can :read, Appointment, doctor: user
    can :update, Appointment, doctor: user, closed: false
    can :read, :patient

    return unless user.patient?

    can %i[read create update], User, id: user.id
    can %i[read create], Appointment, user: user
  end
end
