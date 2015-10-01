class PagesController < ApplicationController
  skip_before_filter :authorize
  def home
  end

  def about
  end

  def faqs
  end

  def contact
  end

  def help
  end
end
