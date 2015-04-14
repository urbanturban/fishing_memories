class Place < ActiveRecord::Base
	include ResourceWithName
	include Rails.application.routes.url_helpers

	belongs_to :pond
	has_and_belongs_to_many :memories

	scope :without_pond, -> { where(pond_id: nil) }

	def title
		"#{(pond.name + ' - ') if pond.present?}#{name}"
  end

	def self.grouped_options_for_select(ponds)
		[[I18n.t('fishing_memories.all'), self.without_pond.map { |e| [e.name, e.id] }]] + ponds.includes(:places).map { |pond| [pond.name, 
			pond.places.map { |place| [place.name, place.id] }]}
	end

	def url
		polymorphic_path(self)
	end

	def as_json(options={})
    super(options.merge(:methods => [:title, :url], :only => []))
  end
end
