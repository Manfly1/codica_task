# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.admin?
    
    can :manage, :all
    

    return unless user.doctor?

    can :read, ActiveAdmin::Page, name: "Dashboard"
    can :read, Doctor, id: user.id
    can :read, Appointment, doctor_id: user.id
    can :update, Appointment, doctor_id: user.id, closed: false
    can :read, Patient, appointments: { doctor: { id: user.id }, closed: false }
   

    return unless user.patient?
    
    can :read, ActiveAdmin::Page, name: "Dashboard"
    can :read, Doctor
    can :read, Category
    can [:read, :update], Patient, id: user.id
    can [:read, :create], Appointment, patient_id: user.id

  end
end
