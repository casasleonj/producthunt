# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  url                :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Product < ActiveRecord::Base 
belongs_to :user
has_many :comments, dependent: :destroy
has_many :votes, dependent: :destroy
# This method associates the attribute ":avatar" with a file attachment
has_attached_file :image, styles: {medium: '300x300>', square: '200x200#', thumb: '100x100>'}


	validates :name, presence: true
	validates :url, presence: true
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

def voted_by?(user)
votes.exists?(user: user)
end

end
