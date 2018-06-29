require "happened/version"

module Happened
  def method_missing(mname, *args, &block)
    m = mname.to_s
    at_attribute = m.gsub('?', '_at')
    if m[-1] == '?' && respond_to?(at_attribute)
      !!self.send(at_attribute)
    else
      super
    end
  end
end
