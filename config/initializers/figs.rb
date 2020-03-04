vars = Settings.REQUIRED_ENVS[Rails.env] || Settings.REQUIRED_ENVS['development']
vars.each do |var|
  unless Figs.env.key? var
    puts Rainbow("\nCannot start application!!!!").black.bg(:orchid)
    puts Rainbow("Make sure #{Figs.application.path} is present and has the required environment variables.").orchid.bg(:black)
    puts Rainbow("> Missing required ENV var '#{var}' for environment '#{Rails.env}'").orchid.bg(:black)
    abort
  end
end
