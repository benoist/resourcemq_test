module ResourceMQ
  module Resource
    extend ActiveSupport::Concern
    include Message
  end
end
