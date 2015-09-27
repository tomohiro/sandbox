#!/usr/bin/env ruby

require 'socket'

module FindFreePort
  def self.run
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    socket.listen(1)
    port = socket.local_address.ip_port
    socket.close
    port
  end
end

puts FindFreePort.run
