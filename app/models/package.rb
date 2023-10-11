# == Schema Information
#
# Table name: packages
#
#  id           :integer          not null, primary key
#  arrival_date :date
#  description  :string
#  details      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Package < ApplicationRecord
end
