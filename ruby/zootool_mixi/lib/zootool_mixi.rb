# encoding: utf-8

require 'ostruct'
require 'kconv'
require 'zootool'
require 'pit'
require 'mixi_diary'
require 'zootool_mixi/version'

module ZootoolMixi
  extend self

  class Bookmark

    def self.user user
      new user
    end

    def initialize user
      @user = user

      config = Pit.get('zootool.com', :require => { :api_key => 'your api_key in zootool.com' })
      @zoo  = Zootool::ZootoolApi.new config[:api_key]
    end

    def all limit = 50
      @zoo.users(@user).items(:limit => limit).map { |i| OpenStruct.new i }
    end

    def today
      today = Date.today.to_s
      all.select { |i| Time.at(i.added.to_i).strftime('%Y-%m-%d').to_s == today }
    end

    def yesterday
      yesterday = (Date.today - 1).to_s
      all.select { |i| Time.at(i.added.to_i).strftime('%Y-%m-%d').to_s == yesterday }
    end

  end

end
