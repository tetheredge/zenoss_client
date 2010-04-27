#############################################################################
# Copyright © 2010 Dan Wanek <dwanek@nd.gov>
#
#
# This file is part of zenoss_client.
# 
# zenoss_client is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# zenoss_client is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with zenoss_client.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################
require 'uri'
module Zenoss
  module Model
    module Events
      class EventManagerBase
        include Zenoss::Model

        def initialize(manager_base)
          @manager = manager_base.sub(/^(\/zport\/dmd\/)?([^\/]+)$/,'\2')

          # Initialize common things from Model
          model_init
        end


        # ------------------ REST Calls ------------------ #

        # getEventList(self, resultFields=None, where="", orderby="", severity=None, state=2, startdate=None, enddate=None, offset=0, rows=0, getTotalCount=False, filter="", filters=None, **kwargs)
        #def get_event_list(where="device='itdmbx3.nd.gov'")
        def get_event_list(resultFields=nil, where=nil, orderby=nil, severity=nil, state=2, startdate=nil, enddate=nil, offset=0, rows=0, get_total_count=false, filter=nil, filters=nil)
          method = "getEventList?"
          method << "resultFields=#{resultFields.join(',')}&" unless resultFields.nil?
          method << "where=#{URI.encode(where,'=')}" unless where.nil?
          event_list = custom_rest(method)
        end



        private

        def rest(method)
          super("#{@manager}/#{method}")
        end

        def custom_rest(method)
          super("#{@manager}/#{method}")
        end

      end # EventManagerBase
    end # Events
  end # Model
end # Zenoss
