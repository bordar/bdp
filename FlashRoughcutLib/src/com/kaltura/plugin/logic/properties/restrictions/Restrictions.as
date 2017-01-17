/*
This file is part of the Borhan Collaborative Media Suite which allows users
to do with audio, video, and animation what Wiki platfroms allow them to do with
text.

Copyright (C) 2006-2008  Borhan Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

@ignore
*/
package com.borhan.plugin.logic.properties.restrictions
{
	import com.borhan.dataStructures.HashMap;

	public dynamic class Restrictions extends HashMap
	{
		private var _sName:String;
		private var _sVersion:String;
		public function setDefinitions(xmlRestrictionGroup:XML):void
		{
			_sName = xmlRestrictionGroup.name.text();
			_sVersion = xmlRestrictionGroup.version.text();
			for each (var xmlRestrcition:XML in xmlRestrictionGroup.restrictions.restriction)
			{
				var restriction:BaseRestriction = RestrictionFactory.newRestriction(xmlRestrcition.@type);
				restriction.setRestriction(xmlRestrcition);
				put(restriction.id, restriction);
			}
		}
		public function get name():String
		{
			return _sName;
		}
		public function get version():String
		{
			return _sVersion;
		}
	}
}