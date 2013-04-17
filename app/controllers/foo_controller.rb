class FooController < ApplicationController
  def bar 
    startt = Time.now.to_i
    some_slow_method(params[:sleep])
    endt = Time.now.to_i
    Rails.logger.info "NOTICE: The action took: #{endt-startt} secs to complete with sleep params = #{params[:sleep].to_f} and Rack::Timeout.timeout = #{Rack::Timeout.timeout}"
    render :text => 'hello'
    
  end

  private 
  def some_slow_method(schleep)
    sleep schleep.to_f
  end
end
