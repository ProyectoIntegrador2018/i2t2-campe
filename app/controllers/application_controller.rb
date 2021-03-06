# frozen_string_literal: true

# This class allows the sign in path
class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(_resource)
    '/pages'
  end

  def user_not_authorized
    redirect_to root_path
  end

  def custom_paginate_renderer
    # Return nice pagination for materialize
    Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        {class: "pagination"}
      end

      def page_number(page)
        if page == current_page
          "<li class=\'cyan active\'>#{link(page, page, rel: rel_value(page))}</li>"
        else
          "<li class=\'waves-effect\'>#{link(page, page, rel: rel_value(page))}</li>"
        end
      end

      def previous_page
        num = @collection.current_page > 1 && @collection.current_page - 1
        previous_or_next_page(num, "<i class=\"material-icons\">chevron_left</i>")
      end

      def next_page
        num = @collection.current_page < total_pages && @collection.current_page + 1
        previous_or_next_page(num, "<i class=\"material-icons\">chevron_right</i>")
      end

      def previous_or_next_page(page, text)
        if page
          "<li class=\'waves-effect\'>#{link(text, page)}</li>"
        else
          "<li class=\'waves-effect\'>#{text}</li>"
        end
      end
    end
  end
end
