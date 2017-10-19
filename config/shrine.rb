require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"), # permanent
}

Shrine.plugin :activerecord   # because we are using model (activerecord)
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :cached_attachment_data # for forms