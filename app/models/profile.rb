class Profile < ApplicationRecord

    include ImageUploader::Attachment.new(:image)

    belongs_to :user
end
