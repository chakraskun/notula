# frozen_string_literal: true

json.extract! minutelist, :id, :minute, :member, :created_at, :updated_at
json.url minutelist_url(minutelist, format: :json)
