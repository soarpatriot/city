class Subdomain
  def self.matches?(request)
    case request.subdomain
      when 'www', '', 'test',nil
        false
      else
        true
    end
  end
end