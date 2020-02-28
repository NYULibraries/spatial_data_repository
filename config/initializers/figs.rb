Settings.REQUIRED_ENVS[Rails.env].each do |var|
  unless Figs.env.key? var
    puts Rainbow("\nCannot start application!!!!").black.bg(:orchid)
    puts Rainbow("Make sure 'config/vars.yml' is present and has the required environment variables.").orchid.bg(:black)
    puts Rainbow("> Missing required ENV var '#{var}'").orchid.bg(:black)
    abort
  end
end
