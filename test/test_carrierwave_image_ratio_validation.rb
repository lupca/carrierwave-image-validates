require 'test_helper'
require 'lupca/carrierwave_image_validation'

class User::Test < ActiveSupport::TestCase
  test 'aspect ratio valid' do
    e = User.new
    e.avatar = fixture_file_upload("image_150x150.png")
    assert_equal e.valid?, true
  end

  test 'aspect ratio invalid width 600 x 800' do
    e = User.new
    e.avatar = fixture_file_upload('image_600x800.png')
    assert !e.valid?
    assert_equal e.errors.full_messages, ["Avatar must have an aspect ratio of 1x1"]
  end

  test 'aspect ratio invalid width 800 x 600' do
    u = User.new
    u.avatar = fixture_file_upload('image_800x600.png')
    assert !u.valid?
    assert_equal u.errors.full_messages, ["Avatar must have an aspect ratio of 1x1"]
  end

  # test 'aspect ratio invalid: not is image' do
  #   e = User.new    
  #   e.avatar = fixture_file_upload('test.html')
  #   assert !e.valid?
  #   assert_equal e.errors.full_messages, ["Avatar is not a valid image"]
  # end
end

def image_150x150_file
  { io: File.open(Rails.root.join('public', 'image_150x150.png')), filename: 'image_150x150_file.png', content_type: 'image/png' }
end

def image_800x600_file
  { io: File.open(Rails.root.join('public', 'image_800x600.png')), filename: 'image_800x600_file.png', content_type: 'image/png' }
end

def image_600x800_file
  { io: File.open(Rails.root.join('public', 'image_600x800.png')), filename: 'image_600x800_file.png', content_type: 'image/png' }
end

def html_file
  { io: File.open(Rails.root.join('public', 'test.html')), filename: 'test.html', content_type: 'text/html' }
end