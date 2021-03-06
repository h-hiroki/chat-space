require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Timezone
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # language
    config.i18n.default_locale = :ja

    # バリデーションエラー時にfield_with_errorsを出力しない対応
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
