# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MinutelistsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/minutelists').to route_to('minutelists#index')
    end

    it 'routes to #new' do
      expect(get: '/minutelists/new').to route_to('minutelists#new')
    end

    it 'routes to #show' do
      expect(get: '/minutelists/1').to route_to('minutelists#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/minutelists/1/edit').to route_to('minutelists#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/minutelists').to route_to('minutelists#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/minutelists/1').to route_to('minutelists#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/minutelists/1').to route_to('minutelists#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/minutelists/1').to route_to('minutelists#destroy', id: '1')
    end
  end
end
