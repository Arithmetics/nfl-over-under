class StaticPagesController < ApplicationController

  #even if this is empty, it will still serve the view
  def home
  end

  def help
  end

  def about
  end

  def graphs
    @picks = Pick.all 
  end





end
