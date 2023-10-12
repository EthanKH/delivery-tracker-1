# == Schema Information
#
# Table name: packages
#
#  id           :integer          not null, primary key
#  arrival_date :date
#  description  :string
#  details      :text
#  status       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Package < ApplicationRecord
end

# add a boolean value here to packages somehow 
# start boolean == true, will stay as waiting on
# after clicking button, boolean == false, will move to received
# can a regular string work?
