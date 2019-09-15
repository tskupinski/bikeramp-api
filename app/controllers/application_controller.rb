class ApplicationController < ActionController::API
  def submit_form(form)
    if form.valid?
      model = form.save
      render json: model, status: :created
    else
      render_errors(form)
    end
  end

  def render_errors(object)
    errors = { errors: object.errors.messages }
    render json: errors, status: :bad_request
  end
end
