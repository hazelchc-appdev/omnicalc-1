class ApplicationController < ActionController::Base
  def blank_square_form
    
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb"})
  end

  def blank_root_form
    render({ :template => "calculation_templates/root_form.html.erb"})
  end

  def calculate_root
    @num_root = params.fetch("user_number").to_f
    @root_of_num = @num_root ** 0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f

     @numerator =  (@apr/12/100) * @principal
     @denominator = 1 - (1 + (@apr/12/100)) ** (-(@years*12))
     @payment = @numerator/@denominator

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
end
