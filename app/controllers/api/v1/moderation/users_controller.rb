
module Api
  module V1
    module Moderation
      class UsersController < ApplicationController
        before_action :authenticate_moderator!

        def index
          users = User.includes(:comments).all
            render json: users.to_json(include: :comments), status: :ok
        end

        private

        def authenticate_moderator!
          # authentication by token
        end
      end
    end
  end
end
