# This code was generated by @basketry/rails@{{version}}
#
# Changes to this file may cause incorrect behavior and will be lost if
# the code is regenerated.
#
# To make changes to the contents of this file:
# 1. Edit source/path.ext
# 2. Run the Basketry CLI
#
# About Basketry: https://github.com/basketry/basketry/wiki
# About @basketry/rails: https://github.com/basketry/rails#readme

module BasketryExample
  class WidgetsController < ActionController::Base
    include ControllerHelpers

    def get_widgets
      response = widget_service.get_widgets(
      )

      render json: map_widget_to_dto(response), status: get_status_code(response)
    end

    def create_widget
      response = widget_service.create_widget(
        body: map_dto_to_create_widget_body(JSON.parse(request.body.read))
      )

      render status: get_status_code(response)
    end

    def put_widget
      response = widget_service.put_widget(
      )

      render status: get_status_code(response)
    end

    def get_widget_foo
      response = widget_service.get_widget_foo(
        id: params['id']
      )

      render json: map_widget_to_dto(response), status: get_status_code(response)
    end

    def delete_widget_foo
      response = widget_service.delete_widget_foo(
        id: params['id']
      )

      render status: get_status_code(response)
    end
  end
end
