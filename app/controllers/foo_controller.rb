class FooController < ApplicationController
  def bar 
    some_slow_method(params[:sleep])
    render :text => "hello"
  end

  private 
  def some_slow_method(schleep)
    sleep schleep
  end
end
