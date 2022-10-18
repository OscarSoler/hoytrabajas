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

	validates_presence_of :name, :name_contact
	validates :nit, format: { with: /(^[0-9]{9}-[0-9]{1})/ }, allow_blank: false
	validates :account_number, length: { maximum: 15}, allow_blank: true
	validates :phone_contact, length: { maximum: 10}, allow_blank: true
end
