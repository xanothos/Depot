class ChoiceList < ActiveRecord::Base
  belongs_to :payment_type, polymorphic: true
end
