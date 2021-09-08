class Application

  def call(env)
    resp = Rack::Response.new

    # Generate some random numbers
    # Almost none of the code actually is specific to the CLI 
    # The only part that require a command line are the two puts lines 
    # All that needs to change to adabt this for the web is a different way than puts to 
    # express output to out user 
    # Because this is the web, that means adding it to out response 
    # instead of puts we'll use the #write method in our Rack::Response object (resp.write)
    num_1 = Kernel.rand(1..20)
    num_2 = Kernel.rand(1..20)
    num_3 = Kernel.rand(1..20)

    # The #write method can be called many times to build up the fill response 
    # The response isn't sent back to the user until #finish is called
    # / is a character which gets rendered by the browser as a new line
    resp.write "#{num_1}\n"
    resp.write "#{num_2}\n"
    resp.write "#{num_3}\n"

    # Check to see if you won or not
    if num_1==num_2 && num_2==num_3
      resp.write "You Win"
    else
      resp.write "You Lose"
    end 
    resp.finish
  end
end
