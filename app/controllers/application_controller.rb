class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2 

    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    @user_number = params.fetch("user_number").to_f
    @square_root_of_user_number = @user_number ** 0.5  

    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @user_apr = params.fetch("input_apr").to_f
    @user_apr_percentage = @user_apr / (100*12)

    @user_years = params.fetch("input_years").to_i
    @user_years_months = @user_years * 12

    @user_principal = params.fetch("input_principal").to_f

    @numerator = @user_apr_percentage * @user_principal
    @denominator = 1 - ((1+@user_apr_percentage) ** (0-@user_years_months))

    @payment = @numerator / @denominator 

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    
    render({ :template => "calculation_templates/random_results.html.erb"})
  end

end
