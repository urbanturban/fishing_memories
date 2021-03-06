class Memory < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tackles
  has_and_belongs_to_many :tackle_sets
  has_and_belongs_to_many :ponds
  has_and_belongs_to_many :places

  validates :user_id, presence: true
  validates :occured_at, presence: true
  validates :weather, length: {maximum: 200}

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

end
