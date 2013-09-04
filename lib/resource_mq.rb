require "resource_mq/version"
require "active_support/core_ext/string/inflections"
require "active_support/core_ext/array/extract_options"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/concern"
require "active_support/dependencies"
require "active_support/dependencies/autoload"
require "active_support/core_ext/module/delegation"
require "librmdp"
require "virtus"
require "forwardable"

module ResourceMQ
  extend ActiveSupport::Autoload

  autoload :Message
  autoload :Resource
end
