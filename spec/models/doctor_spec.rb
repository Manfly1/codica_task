# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject { described_class.new(phone: '00000000000', password: '666666') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.phone = '666666'
    expect(subject).to_not be_valid
  end
end
