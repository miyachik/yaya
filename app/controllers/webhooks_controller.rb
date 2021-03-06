class WebhooksController < ApplicationController
  protect_from_forgery :except => [:endpoint]

  def endpoint
    webhook = Webhook.find_by(uid: params[:uid])
    workspace = Workspace.new(nil,webhook.character,webhook.channel)
    workspace.run(webhook.source_code,self)
    render text: 'ok'
  rescue
    render text: 'error'
  end

end
