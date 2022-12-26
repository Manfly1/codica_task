ActiveAdmin.register Appointment do
  permit_params :reccomendation, :closed, :patient_id, :doctor_id

  form do |f|
    if current_user.doctor?
      f.inputs 'Make a recommendation' do  
        f.input :reccomendation
        f.actions
      end
    end

    if current_user.patient?
      f.inputs 'Select doctor' do
        f.input :doctor, as: :select, include_blank: false,
                         collection: Doctor.all.collect { |doctor| ["#{doctor.phone}, (#{doctor.categories.pluck(:name).join(', ')})", doctor.id] }
        f.input :patient_id, input_html: { value: current_user.id }, as: :hidden
        # include_blank: false
        f.actions
      end
    end

    if current_user.admin?
      f.inputs 'Make the changes' do
        f.input :doctor, as: :select, include_blank: false,
                         collection: Doctor.all.collect { |doctor| ["#{doctor.phone}, (#{doctor.categories.pluck(:name).join(', ')})", doctor.id] }
        f.input :patient, as: :select, include_blank: false, collection: Patient.all.pluck(:phone, :id)
        f.input :closed
        f.actions
      end
    end
  end
end
