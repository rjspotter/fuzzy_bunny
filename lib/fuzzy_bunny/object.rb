
class Object # http://whytheluckystiff.net/articles/seeingMetaclassesClearly.html
  def define_class_method name, prok
    (class << self; self; end).instance_eval { define_method name, prok }
  end
end