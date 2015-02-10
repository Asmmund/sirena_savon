class OrdersController < ApplicationController
  soap_service namespace: 'sir:WashOut', wsse_username: SIRENA[:auth][:username], wsse_password: SIRENA[:auth][:password]
  soap_action 'notify',
              :args => {
                  order: {
                      shop_id: :integer,
                      number: :string
                  },
                  status: :string,
                  shopref: :string,
                  error: {
                      category: :string,
                      code: :string
                  },
                  payments: {
                    payment: {
                        authorg: :string,
                        authcode: :string,
                        amount: {
                            currency: :string,
                            amount: :decimal
                        },
                        doc: {
                            code: :string,
                            holder: :string,
                            number: :string
                        },
                        clearing: :string,
                        date: :string,
                        type: :string,
                        id: :integer
                    }
                  },

              },
              :return => :string


  def notify
    begin

      render soap: {result: params.inspect}
    rescue => e
      Rails.logger.info "#{e.message}"
    end
  end


  before_filter :dump_parameters
  def dump_parameters
    Rails.logger.debug params.inspect
  end
end
