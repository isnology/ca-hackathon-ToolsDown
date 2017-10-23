class Profile < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
