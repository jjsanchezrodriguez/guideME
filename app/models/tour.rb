class Tour < ActiveRecord::Base
	belongs_to :excursion
	belongs_to :guide, class_name: "User", foreign_key: :guide_id
	belongs_to :tourist, class_name: "User", foreign_key: :tourist_id
end
