require "f/version"

module F
  class Error < StandardError; end

  def f(key, options = {})
    scope = :flash
    controller = self.class
    values = options[:values] || {}
    errors = options[:errors]
    redirect_path = options[:redirect]
    render_template = options[:render]

    keys = build_path(key, controller, params[:action])
    msg = I18n.t(keys.shift, scope: scope, default: keys, **values, errors: errors)

    # NOTE color logging
    Rails.logger.debug(Term::ANSIColor.green("flash: #{msg}"))

    type = options[:type] || key
    if options[:now]
      flash.now[type] = msg
    else
      flash[type] = msg
    end

    if redirect_path
      redirect_to redirect_path
    elsif render_template
      render render_template
    end
  end

  private

  def build_path(type, controller, action)
    keys = []
    lookup_controller = controller
    lookup_action = action

    while lookup_controller.superclass.name != 'ActionController::Base'
      lookup_key = []
      lookup_key << lookup_controller.controller_path.tr('/', '.')
      lookup_key << lookup_action
      lookup_key << type

      keys << lookup_key.join('.').to_sym

      lookup_controller = lookup_controller.superclass
      lookup_action = :base
    end

    keys
  end
end
