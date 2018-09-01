class StaticPagesController < ApplicationController

  #even if this is empty, it will still serve the view
  def home
    @start = Random.rand(1...580)
  end

  def help
  end

  def about
  end

  def graphs
    @picks = Pick.all 
  end





end
