class Fixnum
  type :%, '(other: Numeric) -> Numeric'
  post(:%) { |r, _| r.real? }
  type :&, '(Integer) -> Integer'
  type :*, '(Numeric) -> Numeric'
  type :**, '(Numeric) -> Numeric'
  type :+, '(Numeric) -> Numeric'
  type :-, '(Numeric) -> Numeric'
  type :-, '() -> Numeric'
  type :/, '(Numeric) -> Numeric'
  type :<, '(Numeric) -> %bool'
  pre(:<) { |x| x.real? }
  type :<<, '(count: Fixnum) -> Integer'
  type :<=, '(Numeric) -> %bool'
  pre(:<=) { |x| x.real? }
  type :<=>, '(Numeric) -> -1 or 0 or 1 or nil'
  type :==, '(%any) -> %bool'
  type :>, '(Numeric) -> %bool'
  pre(:>) { |x| x.real? }
  type :>=, '(Numeric) -> %bool'
  pre(:>=) { |x| x.real? }
  type :>>, '(count: Fixnum) -> Integer'
  type :[], '(Fixnum) -> 0 or 1'
  type :^, '(Integer) -> Integer'
  type :|, '(Integer) -> Integer'
  type :~, '() -> Integer'
  type :abs, '() -> Integer'
  type :bit_length, '() -> Fixnum'
  type :div, '(Numeric) -> Integer'
  type :divmod, '(Numeric) -> [Numeric, Numeric]'
  type :even?, '() -> %bool'
  type :fdiv, '(Numeric) -> Float'
  rdl_alias :inspect, :to_s
  type :magnitude, '() -> Integer'
  type :modulo, '(Numeric) -> Numeric'
  post(:modulo) { |r, _| r.real? } # Return value real
  type :next, '() -> Integer'
  type :odd?, '() -> %bool'
  type :size, '() -> Fixnum'
  rdl_alias :succ, :next
  type :to_f, '() -> Float'
  type :to_s, '(base: ?Fixnum) -> String'
  type :zero?, '() -> %bool'
end