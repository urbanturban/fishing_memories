class Memory < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tackles
  has_and_belongs_to_many :tackle_sets
  has_and_belongs_to_many :ponds

  validates :user_id, presence: true
  validates :occured_at, presence: true

  default_scope -> { order('occured_at DESC') }

  accepts_nested_attributes_for :tackles,
		:reject_if => proc { |attrs|
		attrs['name'].blank? &&
		attrs['tackle_id'].blank?
	}

  accepts_nested_attributes_for :ponds,
    :reject_if => proc { |attrs|
    attrs['name'].blank? &&
    attrs['tackle_id'].blank?
  }

  def title
  	"#{Memory.model_name.human} #{I18n.t('date.from')} #{occured_at}"
  end

  def clear_description
    ApplicationController.helpers.clear_text_from_tags(description)
  end

  def self.sort_by_description(direction = "asc")
    sorted = all.sort_by(&:clear_description)
    direction == "desc" ? sorted.reverse : sorted
  end
end
