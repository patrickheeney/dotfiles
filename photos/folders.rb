#!/usr/bin/env ruby

require 'date'
require 'fileutils'

def move_file(path, file)
  Dir.mkdir(path) unless Dir.exist?(path)

  full_path = File.expand_path(file)
  FileUtils.mv(full_path, path)
end

ARGV.each do |f|
  #puts f
  root_dir = f

  Dir.glob "#{root_dir}/*" do |file|
    match_video = /.*?\.(mp4|mov)$/.match file
    if match_video
      folder = File.join(root_dir, "Videos")
      move_file(folder, file)
      next
    end

    match_image = /.*?(\d\d\d\d)-(\d\d)-\d\d \d\d.\d\d.\d\d.*\.(jpg|heic)$/.match file
    if match_image
      year = match_image[1]
      month = match_image[2]

      #month_abbr = Date::MONTHNAMES[month.to_i][0..2]
      #photo_dir_name = "#{year}-#{month}-#{month_abbr}"
      photo_dir_name = "#{year}-#{month}"

      folder = File.join(root_dir, photo_dir_name)
      move_file(folder, file)
      next
    end

    match_imageremain = /.*?\.(jpg|heic)$/.match file
    if match_imageremain
      folder = File.join(root_dir, "Unmatched")
      move_file(folder, file)
      next
    end

    #raise ArgumentError.new "File did not match: #{file}" unless match
    puts "#{file} does not match"
  end
end
