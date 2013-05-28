class Expense < ActiveRecord::Base
  attr_accessible :admin_user_id, :amount, :category, :description, :purchase_date, :supplier

  validates :admin_user_id, :amount, :category, :description, :purchase_date, :supplier, presence: true

  validates_numericality_of :amount, :greater_than_or_equal_to => 0.01

  has_one :admin_user

  # scope :sort_expenses, where(:admin_user_id => @admin_user.id)

end
