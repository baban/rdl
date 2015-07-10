class RDL::Util
  def self.to_class(klass)
    return klass if klass.class == Class
    if has_singleton_marker(klass)
      klass = remove_singleton_marker(klass)
      sing = true
    end
    c = klass.to_s.split("::").inject(Object) { |base, name| base.const_get(name) }
    c = c.singleton_class if sing
    return c
  end

  def self.has_singleton_marker(klass)
    return (klass =~ /^\[singleton\]/)
  end
  
  def self.remove_singleton_marker(klass)
    if klass =~ /^\[singleton\](.*)/
      return $1
    else
      return nil
    end
  end

  def self.add_singleton_marker(klass)
    return "[singleton]" + klass
  end
    
  def self.method_defined?(klass, method)
    begin
      (self.to_class klass).method_defined? method.to_sym
    rescue NameError
      return false
    end
  end

  # Returns the @__rdl_type field of [+obj+]
  def self.rdl_type(obj)
    return (obj.instance_variable_defined?('@__rdl_type') && obj.instance_variable_get('@__rdl_type'))
  end

  def self.rdl_type_or_class(obj)
    return self.rdl_type(obj) || obj.class
  end

  def self.pp_klass_method(klass, meth)
    klass = klass.to_s
    if has_singleton_marker klass
      remove_singleton_marker(klass) + "." + meth.to_s
    else
      klass + "#" + meth.to_s
    end
  end
end
