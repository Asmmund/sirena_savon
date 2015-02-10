class RequestsController < ApplicationController
  # respond_to :html, :json, only: [:notify]
  def notify
    @client = Savon.client(
      wsdl:  "http://localhost:3000/orders/wsdl",
      soap_header: { 'Username' =>SIRENA[:auth][:username], 'Password' => SIRENA[:auth][:password] }
    )
    @response = @client.call(:notify ).to_hash
  end
end
