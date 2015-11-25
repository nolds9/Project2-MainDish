class Recipe < ActiveRecord::Base
  belongs_to :user

  has_many :ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy

 # NHO: Really great use of nested attributes, your forms were awesome!
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  validates  :title, :description, :image, presence: true

  # NHO: Recommend you comment your code to be helpful for your future self, i.e. # using paperclip's helpers to attach image attribute for file upload
  has_attached_file :image, styles: { medium: "400x400>#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
