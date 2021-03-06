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
package com.borhan.plugin.logic.properties
{
	import com.borhan.plugin.events.RestrictionErrorEvent;
	import com.borhan.plugin.logic.properties.restrictions.BaseRestriction;
	import com.borhan.plugin.logic.properties.restrictions.RestrictionUint;
	
	/**
	 * PropertyNumber is a concrete property (extends @Property [Property]).
	 * It enables Number based restriction like range and type validations
	 * 
	 */	
	public class PropertyUint extends Property
	{	
		/**
		 * 
		 * @param xmlPropertyDef
		 * 
		 */		
		public override function setDefinition(restriction:BaseRestriction):void
		{
			super.setDefinition(restriction);
			RestrictionUint(_Restriction).addEventListener(RestrictionErrorEvent.STEP_ERROR, dispatchErrors);
		}
		public function dispatchErrors(evtRestrictionError:RestrictionErrorEvent):void
		{
			if (evtRestrictionError.correctValue)
			{
				_nValue = evtRestrictionError.correctValue;
			}
			dispatchEvent(evtRestrictionError);
		}
		protected var _nValue:uint;
		/**
		 * @inheritDoc
		 */	
		public override function set value(newValue:*):void
		{
			_nValue = newValue;
			super.value = newValue;
		}
		/**
		 * @inheritDoc
		 */	
		public override function get value():*
		{
			return _nValue;
		}

	}
}