RailsAdmin.config do |config|

  config.navigation_static_links = {
  'Speech' => '/speech.mp3',
  'Map' => '/map'

  }

  #config.authorize_with do
    #redirect_to main_app.root_path unless warden.user.admin==true
  #end

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  #config.show_gravatar = true

  config.actions do

    dashboard                     # mandatory
    index                         # mandatory
    new
    ## With an audit adapter, you can add:
    # history_index
    # history_show


  end

end