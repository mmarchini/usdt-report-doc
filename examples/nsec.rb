#!/usr/bin/env ruby

require 'ruby-static-tracing'

t = StaticTracing::Tracepoint.new('global', 'nsec_latency', Integer)
t.provider.enable

loop do
  s = StaticTracing.nsec
  StaticTracing.nsec
  f = StaticTracing.nsec
  t.fire(f-s)
  sleep 0.001
end
