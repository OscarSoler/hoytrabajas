# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bank < ApplicationRecord
	validates_presence_of :name
	validates :name, length: {minimum: 2, maximum: 50}, allow_blank: false
end
