# frozen_string_literal: true

json.array! @minutelists, partial: 'minutelists/minutelist', as: :minutelist
