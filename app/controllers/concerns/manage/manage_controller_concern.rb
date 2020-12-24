module Manage
  module ManageControllerConcern
    extend ActiveSupport::Concern

    included do

      layout 'manage/application'
      
      before_action :setup_routes

      private

      def setup_routes
        @routes = [{
                     name: "Dashboard",
                     url: url_for({ controller: :dashboard, action: :index }),
                     icon: "fas fa-tachometer-alt",
                     can: (can? :index, :dashboard)
                   }]
      end

      def current_ability
        @current_ability ||= ManageAbility.new(current_user)
      end
    end

  end
end