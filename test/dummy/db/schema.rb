# frozen_string_literal: true
ActiveRecord::Schema.define do
  create_table :users, force: :cascade do |t|
    t.string :avatar
    t.datetime :created_at, precision: 6, null: false
    t.datetime :updated_at, precision: 6, null: false
  end
end