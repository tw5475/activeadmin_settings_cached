require 'activeadmin_settings_cached/engine'

module ActiveadminSettingsCached
  class Configuration
    attr_accessor :model_name, :display, :group_name 

    def model_name
      (@model_name ||= 'Settings').constantize
    end

    def display
      (@display ||= {}).with_indifferent_access
    end
    
    def group_name
      (@group_name ||= {}).with_indifferent_access
    end
  end

  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end
end
