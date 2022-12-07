module Eventable
  extend ACtiveSUpport::Concern

  include do
    has_many :events, as: :eventable, dependent: :destroy do
      def log(action:, properties: {})
        e = Event.action_for(action.to_sym)
        create(action: e, properties)
    end
  end
end