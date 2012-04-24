require 'dragonfly/rails/images'

require Rails.root.join('lib', 'rails_admin_publish.rb')

RailsAdmin.config do |c|
  c.excluded_models = [RelTest]
  c.authenticate_with {}
  c.current_user_method { User.first }
  c.authorize_with :cancan
  c.audit_with :history, User

  # Load the class in lib/rails_admin_publish.rb
  module RailsAdmin
    module Config
      module Actions
        class Publish < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
        end
      end
    end
  end

  c.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions 
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app

    # Set the custom action here
    publish do
    	# Make it visible only for comments model. You can remove this if you don't need.
      visible do
        bindings[:abstract_model].model.to_s == "Comment"
      end
    end
  end
end
