class Person
  attr_accessor :name, :this_children
  def initialize(name=nil, parent=nil)
    @name = name
    @parent = parent
    self.this_children = []
    if !@parent.nil?
      @parent.this_children << self
    end
  end

  def children
    self.this_children.map(&:name)
  end

  def grandchildren
    self.this_children.map{|child| child.children}.flatten!
  end
end
