# == Schema Information
#
# Table name: providers
#
#  id             :integer          not null, primary key
#  name           :string
#  nit            :string
#  name_contact   :string
#  phone_contact  :string
#  account_number :string
#  bank_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Provider < ApplicationRecord
  	belongs_to :bank
end
