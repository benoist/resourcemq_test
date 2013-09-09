require 'test_helper'

class ResourcesDummy
  include ResourceMQ::Message
end

class ResourceDummy
  include ResourceMQ::Resource

  resource :products do
    attribute :name, String
    attribute :description, String
    attribute :price_in_cents, Integer
    attribute :published_at, Time

    collection do
      action :index, responds_with: :products do
        params :page, Integer
      end
    end
  end

  class << self

    def show(id)
      service.request(:show, id: id).response(ResourceDummy)
    end

    def create(attributes = {})
      service.request(:create, attributes).response(ResourceDummy)
    end

    def update(id, attributes = {})
      service.request(:update, attributes.merge(id: id)).response(ResourceDummy)
    end

    def destroy(id)
      service.request(:destroy, id: id).response(ResourceDummy)
    end

    def publish(id)
      service.request(:publish, id: id).response(ResourceDummy)
    end
  end

  def create
    self.class.create(attributes)
  end

  def update
    self.class.update(id, attributes)
  end

  def destroy
    self.class.destroy(id)
  end

  def publish
    self.class.publish(id)
  end
end

class ResourceTest < MiniTest::Unit::TestCase
  def test_the_truth
    assert ResourceDummy.respond_to?(:index)
  end
end

#service :products do
#  collection do
#    action :index, responds_with: ResourcesDummy do
#      params :page, Integer
#    end
#
#    action :create, responds_with: ResourceDummy do
#      attributes_for ResourceDummy
#    end
#  end
#
#  member do
#    action :update, responds_with: ResourceDummy do
#      attributes_for ResourceDummy, only: [:description, :price_in_cents]
#    end
#
#    action :show, responds_with: ResourceDummy
#    action :destroy, responds_with: ResourceDummy
#    action :publish, responds_with: ResourceDummy
#  end
#end

