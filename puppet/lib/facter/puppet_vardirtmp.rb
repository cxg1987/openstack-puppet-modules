# Simple fact for base directory where puppet modules can work and namespace in
# Copyright (C) 2012-2013+ James Shubin
# Written by James Shubin <james@shubin.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'facter'

vardir = '/var/lib/puppet/'			# TODO: get from global
dir = Facter.value('puppet_vardir')		# nil if missing
if not dir.nil?					# let puppet decide if present!
	vardir = dir
end
valid_vardir = vardir.gsub(/\/$/, '')+'/'	# ensure trailing slash

Facter.add('puppet_vardirtmp') do
	#confine :operatingsystem => %w{CentOS, RedHat, Fedora}
	setcode {
		valid_vardir+'tmp/'		# eg: /var/lib/puppet/tmp/
	}
end

