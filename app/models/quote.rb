class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit lambda {
  #                       broadcast_prepend_later_to 'quotes'
  #                       # partial: 'quotes/quote' # default is to_partial_path
  #                       # locals: { quote: self } # default is model_name.element.to_sym => self
  #                       # , target: 'quotes' # default target is model_name.plural
  #                     }

  # after_update_commit -> { broadcast_replace_later_to 'quotes' }
  # after_destroy_commit -> { broadcast_remove_to 'quotes' }

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
