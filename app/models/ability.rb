# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    end

    if user.doctor?
      can :read, ActiveAdmin::Page, name: 'Dashboard'
      can :read, Doctor, id: user.id
      can :read, Appointment, doctor_id: user.id
      can :update, Appointment, doctor_id: user.id, closed: false
      can :read, Patient, appointments: { doctor: { id: user.id }, closed: false }
    end

    if user.patient?
      can :read, ActiveAdmin::Page, name: 'Dashboard'
      can :read, Doctor
      can :read, Category
      can %i[read update], Patient, id: user.id
      can :read, Appointment, patient_id: user.id
      can :create, Appointment
    end
  end
end
