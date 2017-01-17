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
package com.borhan.net.interfaces
{
	import com.borhan.base.IDisposable;

	import flash.display.BitmapData;
	import flash.events.IEventDispatcher;

	public interface IMediaSource extends IEventDispatcher, IDisposable
	{
		//play control:
		function playMedia ():void;
		function pauseMedia ():void;
		function seekMedia (offset:Number, original:Number = -1, direction:Boolean = false):void;
		//display:
		function get mediaBitmapData ():BitmapData;
	}
}